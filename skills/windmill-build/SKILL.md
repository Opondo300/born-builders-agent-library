---
name: windmill-build
description: Hard-enforcement protocol for building, updating, debugging Windmill Cloud scripts and flows for Build n Bloom. Replaces n8n-build for all NEW automation work. Use when creating, updating, debugging, or scheduling any Windmill script. Workspace bnb. User Bnb. All variables at u/YourUsername/* via wmill.getVariable() — never Deno.env.get for user secrets.
---

# Windmill Build Protocol — Build n Bloom

**Workspace:** `bnb`
**User:** `Bnb` (capital B — case-sensitive)
**MCP endpoint:** `https://app.windmill.dev/api/mcp/w/bnb/mcp`
**Path prefix:** `u/YourUsername/` for both variables and scripts
**Runtime:** Deno 2.2.x (default for createScript with `language: "deno"`)

---

## When to Invoke

Invoke this skill at the **start** of any Windmill task — before reading code, before writing code, before any MCP call:

- Creating a new script or flow
- Updating an existing script
- Debugging a failing job
- Adding a schedule or webhook
- Adding a new secret/variable
- Migrating logic from n8n

---

## The Rule (Non-Negotiable)

1. **Never use `Deno.env.get()` for user secrets.** Windmill does NOT inject user variables as env vars. Only contextual vars (`WM_TOKEN`, `WM_USERNAME`, `WM_WORKSPACE`, `BASE_INTERNAL_URL`) are exposed via `Deno.env.get()`.
2. **Always use `wmill.getVariable("u/YourUsername/KEY")` for secrets.**
3. **Always preview before deploy.** No `createScript` without a successful `runScriptPreviewAndWaitResult` first.
4. **Never hardcode IDs.** AC tag IDs and automation IDs change. Resolve by name with the helpers below.

---

## PHASE 0 — Pre-Build (before writing any code)

```ts
mcp__windmill__listScripts()        // see what exists
mcp__windmill__listVariable()       // confirm secret paths
mcp__windmill__listSchedules()      // confirm cron jobs
mcp__windmill__getScriptByPath(path) // when modifying
```

If a relevant script already exists at the same path, you are **updating**, not creating. Always read it first.

---

## PHASE 1 — Write

### Standard Template (use exactly)

```typescript
import * as wmill from "npm:windmill-client@1";

// ---- helpers (paste once at top of every script) ----

async function withRetry<T>(
  fn: () => Promise<T>,
  retries = 3,
  delayMs = 1000,
): Promise<T> {
  let lastErr: unknown;
  for (let i = 0; i < retries; i++) {
    try { return await fn(); }
    catch (e) {
      lastErr = e;
      if (i === retries - 1) break;
      await new Promise(r => setTimeout(r, delayMs * (i + 1)));
    }
  }
  throw lastErr;
}

async function getAcTagId(name: string, key: string, base: string): Promise<string | null> {
  const res = await fetch(`${base}/tags?search=${encodeURIComponent(name)}`, {
    headers: { "Api-Token": key },
  });
  const data = await res.json();
  const hit = (data.tags ?? []).find((t: { tag: string; id: string }) => t.tag === name);
  return hit?.id ?? null;
}

async function getAcAutomationId(name: string, key: string, base: string): Promise<string | null> {
  const res = await fetch(`${base}/automations?search=${encodeURIComponent(name)}`, {
    headers: { "Api-Token": key },
  });
  const data = await res.json();
  const hit = (data.automations ?? []).find((a: { name: string; id: string }) => a.name === name);
  return hit?.id ?? null;
}

async function reportError(scriptName: string, err: unknown, acKey: string, acBase: string) {
  try {
    await fetch(`${acBase}/contact/sync`, {
      method: "POST",
      headers: { "Api-Token": acKey, "Content-Type": "application/json" },
      body: JSON.stringify({
        contact: {
          email: "your@email.com",
          fieldValues: [{ field: "1", value: `${scriptName}: ${(err as Error).message?.slice(0, 200)}` }],
        },
      }),
    });
  } catch { /* silent — error reporter must not throw */ }
}

// ---- main ----

export async function main(payload?: Record<string, unknown>) {
  const SCRIPT_NAME = "u/YourUsername/<script-name>";

  // Always fetch secrets at top of main (never module-level — wmill needs job context)
  const ANTHROPIC_KEY = await wmill.getVariable("u/YourUsername/ANTHROPIC_API_KEY");
  const AIRTABLE_KEY = await wmill.getVariable("u/YourUsername/AIRTABLE_API_KEY");
  const AC_KEY = await wmill.getVariable("u/YourUsername/ACTIVECAMPAIGN_KEY");
  const BASE = await wmill.getVariable("u/YourUsername/AIRTABLE_BASE_ID");
  const AC_BASE = "https://buildnbloom.api-us1.com/api/3";

  try {
    // ... script logic
    return { success: true };
  } catch (e) {
    await reportError(SCRIPT_NAME, e, AC_KEY, AC_BASE);
    return { error: (e as Error).message, script: SCRIPT_NAME };
  }
}
```

### Key Rules

- Secrets always via `await wmill.getVariable("u/YourUsername/KEY")` inside `main()` — never hardcode, never Deno.env.get.
- All external API calls wrapped in `withRetry(() => ...)` for idempotent operations.
- AC tag/automation IDs **always** resolved by name via `getAcTagId` / `getAcAutomationId` — never hardcoded.
- Webhook scripts: `main()` arg is the JSON payload. Always defensively read `payload.payload ?? payload` because some webhooks (Cal.com) double-wrap.
- Schedule scripts: `main()` takes no args.
- Script-to-script trigger: POST to `https://app.windmill.dev/api/w/bnb/jobs/run/p/u/YourUsername/{name}` with bearer `WINDMILL_API_TOKEN`.

### Webhook Trigger

Every script auto-gets a webhook URL on deploy:
```
https://app.windmill.dev/api/w/bnb/jobs/run/p/u/YourUsername/{script-name}
```
For sync return (waits for result):
```
https://app.windmill.dev/api/w/bnb/jobs/run_wait_result/p/u/YourUsername/{script-name}
```

### Constants to Hardcode

These are not secrets and don't change:

```typescript
const AIRTABLE_BASE = "your-airtable-base-id";  // Or fetch from u/YourUsername/AIRTABLE_BASE_ID
const AC_BASE = "https://buildnbloom.api-us1.com/api/3";
const ANTHROPIC_VERSION = "2023-06-01";
const APOLLO_BASE = "https://api.apollo.io/api/v1";
```

---

## PHASE 2 — Test (mandatory before deploy)

```ts
mcp__windmill__runScriptPreviewAndWaitResult({
  content: <full script>,
  language: "deno",
  args: <test payload>
})
```

- Preview runs the code WITHOUT creating it as a script. Use this to iterate.
- Test payloads must mirror real webhook shape — for Cal.com use `{ payload: { attendees: [{email, name}], startTime, uid } }`.
- Do not call `createScript` until preview returns the expected output. Failed preview = failed deploy.

---

## PHASE 3 — Deploy

### Create script
```ts
mcp__windmill__createScript({
  path: "u/YourUsername/<name>",
  summary: "<one-line>",
  description: "<2-sentence purpose>",
  content: <code>,
  language: "deno"
})
```

### Update script (path already exists)
Same call — Windmill versions automatically. No `parent_hash` needed for create-or-update on the same path.

### Schedule (cron)
```ts
mcp__windmill__createSchedule({
  path: "u/YourUsername/<schedule-name>",
  schedule: "0 0 * * * *",          // 6 fields including seconds
  timezone: "Australia/Sydney",
  script_path: "u/YourUsername/<script>",
  is_flow: false,
  args: {},
  enabled: true
})
```
**Cron format is 6-field** (sec min hour day month weekday) — not the 5-field unix style.

### Webhook URL
After deploy, the URL is shown in the Windmill UI under the script's "Webhook" tab.

---

## Common Patterns

### Airtable list with filter
```typescript
const url = `https://api.airtable.com/v0/${BASE}/Leads?filterByFormula=${
  encodeURIComponent(`{Email Address}="${email}"`)
}&maxRecords=10`;
const res = await withRetry(() =>
  fetch(url, { headers: { Authorization: `Bearer ${AIRTABLE_KEY}` } }).then(r => r.json())
);
const records = res.records ?? [];
```

### Airtable PATCH
```typescript
await withRetry(() =>
  fetch(`https://api.airtable.com/v0/${BASE}/Deals/${recordId}`, {
    method: "PATCH",
    headers: { Authorization: `Bearer ${AIRTABLE_KEY}`, "Content-Type": "application/json" },
    body: JSON.stringify({ fields: { Stage: "Called" } }),
  }).then(r => r.json())
);
```

### Claude API (with model routing)
```typescript
// Sonnet for extraction / multi-field structured output:
const res = await withRetry(() =>
  fetch("https://api.anthropic.com/v1/messages", {
    method: "POST",
    headers: {
      "x-api-key": ANTHROPIC_KEY,
      "anthropic-version": "2023-06-01",
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      model: "claude-sonnet-4-6",
      max_tokens: 1024,
      messages: [{ role: "user", content: prompt }],
    }),
  }).then(r => r.json())
);
const text = res.content?.[0]?.text ?? "";

// Haiku for classification, simple scoring, hook generation:
// model: "claude-haiku-4-5-20251001", max_tokens: 100
```

### AC contact upsert + tag
```typescript
const sync = await fetch(`${AC_BASE}/contact/sync`, {
  method: "POST",
  headers: { "Api-Token": AC_KEY, "Content-Type": "application/json" },
  body: JSON.stringify({ contact: { email, firstName } }),
}).then(r => r.json());
const contactId = sync.contact?.id;

const tagId = await getAcTagId("Diagnostic-Booked", AC_KEY, AC_BASE);
if (contactId && tagId) {
  await fetch(`${AC_BASE}/contactTags`, {
    method: "POST",
    headers: { "Api-Token": AC_KEY, "Content-Type": "application/json" },
    body: JSON.stringify({ contactTag: { contact: contactId, tag: tagId } }),
  });
}
```

### Apollo enrichment
```typescript
const apolloRes = await fetch("https://api.apollo.io/api/v1/people/match", {
  method: "POST",
  headers: { "x-api-key": APOLLO_KEY, "Content-Type": "application/json", "Cache-Control": "no-cache" },
  body: JSON.stringify({ email, reveal_personal_emails: false, reveal_phone_number: false }),
}).then(r => r.json());
const person = apolloRes.person ?? {};
```

### Trigger another Windmill script
```typescript
const WINDMILL_TOKEN = await wmill.getVariable("u/YourUsername/WINDMILL_API_TOKEN");
await fetch("https://app.windmill.dev/api/w/bnb/jobs/run/p/u/YourUsername/meet-b-intelligence", {
  method: "POST",
  headers: { Authorization: `Bearer ${WINDMILL_TOKEN}`, "Content-Type": "application/json" },
  body: JSON.stringify({ dealId }),
});
```

---

## Airtable Field Names — Build n Bloom Reference

The plan often gets these wrong. **Source of truth (verified 2026-04-27):**

### Leads (`tblOVOoTAn0GZ7JJ0`)
- `Email Address` (NOT "Email")
- `First Name`, `Last Name` (NOT "Name")
- `Pipeline Stage`
- `Source`, `Lead Source`
- `Organisation` does NOT exist — use `Company Name` or `Business Name`
- `Scorecard Score`, `Scorecard Tier`
- `Booking Status`, `Booked Call?`, `Booking Confirmation Date`

### Deals (`tblXz7AOGNTWMvSwA`)
- `Deal Name`, `Stage`, `Pipeline Stage`
- `Deal Value`, `Notes`, `Next Action`, `Next Action Date`
- `Source`, `Sequence Status`, `BAMFAM Date`
- `Leads` (linked field), `Proposals` (linked), `Installs` (linked)
- `Lost Reason`, `Close Sentiment`, `Prospect Goal`
- **Does NOT have:** Call Transcript, Call Date, Pain Points, Recommended Agent, Temperature, Urgency Score, Proposal Value, Call Summary, Post-Call Email Sent. These need to be added or stored in `Notes` as structured text.

### Bookings (`tbl0DQZxh3hfsGeQ2`)
- `Booking ID`, `Lead`, `Booking Date`, `Booking Status`, `Booking Source`
- `Lead Email`, `Booking Confirmation Date`
- `Notes`, `Booking Notes Summary`

### Scorecard Submissions (`tbl3TeGO8U6wDjs8U`)
- `Email` (here it IS just "Email" — different from Leads)
- `First Name`, `Organisation`, `Role`
- `Score`, `Tier` (NOT "Scorecard Score" — this table has its own short names)
- `Recommended Agent`, `Top Risk Domains`, `Submitted At`
- `Revenue Band`, `Stage`

**Always describe the table before writing PATCH calls** — `mcp__airtable__describe_table` with `detailLevel: "identifiersOnly"`.

---

## Failure Patterns

| Symptom | Cause | Fix |
|---------|-------|-----|
| `wmill.getVariable` returns 404 | Variable path doesn't exist or wrong case | Verify `u/YourUsername/KEY` (capital B). `mcp__windmill__listVariable` to list. |
| `Deno.env.get("ANTHROPIC_API_KEY")` returns undefined | User vars not auto-injected | Use `await wmill.getVariable("u/YourUsername/ANTHROPIC_API_KEY")` |
| 401 from Anthropic | Wrong header — should be `x-api-key`, not `Authorization` | Fix header |
| 401 from Airtable | Wrong header — should be `Authorization: Bearer`, not `x-api-key` | Fix header |
| 401 from AC | Wrong header — should be `Api-Token`, not `Authorization` | Fix header |
| **422 from Airtable on a singleSelect field** | `INSTANTLY_API_KEY` plan/free tier disallows new option creation | Add `typecast: true` at top level of body: `JSON.stringify({ typecast: true, fields })`. Always include for any Airtable POST/PATCH that touches singleSelect fields (Stage, Pipeline Stage, Source, Booking Status, etc.) |
| **Lead create silently returns empty `id`** | 422 swallowed because code checks `data.id ?? ""` | Two-step fix: (1) `if (!response.ok) throw await response.text()` (2) add `typecast: true` to body |
| **Airtable formula `SEARCH(id, ARRAYJOIN({Linked}))` returns no match** | `ARRAYJOIN` joins display names of the linked record (primary field), not record IDs | Read the Lead's `Deals` linked field directly — it returns an array of Deal record IDs. Iterate and `GET` each by ID. |
| **`run_wait_result` body keys don't reach script's `payload`** | Windmill maps body keys to **named function params**. If `main(payload)`, the body must be `{ "payload": {...} }`, not `{...}`. | Always wrap webhook test payloads as `{ "payload": { ... } }` when calling `run_wait_result/p/`. |
| **Inter-script trigger returns "Not authorized: jobs:run:scripts"** | Stored API token (e.g. `WINDMILL_API_TOKEN` variable) lacks job-run scope. | Use `Deno.env.get("WM_TOKEN")` instead — that is the **per-job ephemeral token** with the running user's full perms. |
| **Schedule script filter `NOT({Boolean})` returns nothing** | Field is actually `singleLineText`, not `checkbox`. `NOT("true")` is true, but `NOT("false")` is also true. | Always `mcp__airtable__describe_table` with `detailLevel: "full"` and confirm field types. For a text-as-boolean field, use `{processed}!="true"`. |
| **Claude returns category like "policy" but Airtable rejects it** | Airtable `singleSelect` choices are fixed (e.g. `pricing_change`, `enforcement`, `policy_update`, `compliance`, `industry`, `competitive`, `trends`, `no_signal`) | Constrain the prompt to the EXACT choice names + validate the result before PATCH (`if (!VALID_CHOICES.includes(x)) x = "no_signal"`). |
| **Stage field gets stuck — post-call-sequence never finds the deal** | Multiple scripts advance `Stage` (meet-b moves Called → Intelligence Captured) | Filter on `OR({Stage}="Called",{Stage}="Intelligence Captured")` and use a checkbox like `Post-Call Email Sent` for idempotency, not stage. |
| **RSS feed URL returns 404 / non-JSON** | URL is wrong/dead — many "official" RSS endpoints don't exist | **Verified working NDIS-relevant feeds**: `pwd.org.au/feed/`, `everyaustraliancounts.com.au/feed/`, `linkonline.com.au/feed/`, `theconversation.com/au.atom`. Test with a fetch+content-type check before deploying. |
| Hangs forever in preview | Forgot `await` on a Promise | Add `await` |
| Webhook payload undefined | Cal.com double-wraps in `payload.payload` | Use `(payload.payload ?? payload)` |
| Schedule never fires | 6-field cron required (with seconds) | `0 0 * * * *` not `0 * * * *` |
| Script can't trigger another | Stored token wrong scope | Use `Deno.env.get("WM_TOKEN")` from job context |
| **Re-deploying same path errors `Path conflict for u/YourUsername/X with non-archived hash`** | `mcp__windmill__createScript` doesn't accept `parent_hash` | Update via raw API: POST `${BASE_INTERNAL_URL}/api/w/bnb/scripts/create` with body `{ path, parent_hash, content, ... }`. Bearer auth uses `WM_TOKEN`. |
| **MCP `runScriptPreviewAndWaitResult` times out at 120s for batch tests** | Hard timeout on the MCP tool itself | Split tests into batches of ≤6 scripts running in parallel via `fetch` to `/jobs/run_wait_result/p/{path}` directly. |
| **Claude/Haiku JSON wrapped in ` ```json...``` ` fences — `JSON.parse` throws "Unexpected token '`'"** | Anchored regex `/^```json?\s*\|```\s*$/g` fails when output has leading whitespace, BOM, or extra prose. Caused 18 silent `no_signal` rows in `intel-process` (2026-04-28). | Don't try to strip fences. Greedy-extract the first JSON object: `const match = raw.match(/\{[\s\S]*\}/); JSON.parse(match?.[0] ?? "{}")`. Works regardless of fences, prose, or whitespace. |
| **Workspace migration leaves every secret as literal string `"PLACEHOLDER"`** | Migration tools (Windmill self-host import, etc.) copy variable PATHS but reset VALUES. All scripts then 401 silently because outer `try/catch` returns `success: true` with empty results. | After ANY migration, audit values: `for k in K1 K2 ...; do v=$(curl ".../variables/get_value/u/YourUsername/$k" -H "Authorization: Bearer $T"); [[ "$v" == *PLACEHOLDER* ]] && echo "FAIL $k"; done`. Re-PATCH with real values via `POST .../variables/update/u/YourUsername/{KEY}` body `{"value":"..."}`. |
| **AC tag create fails with `duplicate entry` after a search returned 0 results** | AC enforces case-insensitive uniqueness on tag names at the DB level, but the API search is case-sensitive. Searching for `Reply-Positive` misses the existing lowercase `reply-positive`, so the script tries to create — DB rejects. Caused `instantly-reply` silent failures in production (script returned `success: true, action: "routed to sales"` while AC tag NEVER applied). | In `ensureAcTag`, lowercase the lookup: `(search.tags ?? []).find(t => (t.tag ?? "").toLowerCase() === name.toLowerCase())`. On create-failure with `/duplicate\|exists/i`, re-search and use the existing ID. |
| **Airtable PATCH 422 `INVALID_VALUE_FOR_COLUMN: field cannot accept a value because the field is computed`** | The field is a `multipleLookupValues` / `formula` / `rollup` (computed). Any write — even `null` — is rejected. Caused `no-show-tagger` to roll back the entire `Booking Status` flip every day. | Inspect schema first via `mcp__airtable__describe_table`. Drop computed fields entirely from PATCH bodies. Common offenders: `Booking Confirmation Date`, anything ending in `(lookup)` or `(rollup)`. |
| **Cal.com webhook retries cause duplicate Deals + Notion pages** | Cal.com retries on 5xx responses and on network blips (and any latency >30s). Without dedupe, every retry creates a fresh Deal row + fresh Notion Pipeline page + fresh Booking page. | Always dedupe by `Cal.com UID` (unique per booking) BEFORE any create. Pattern: `filterByFormula={Cal.com UID}="${escapeAirtableFormulaString(uid)}"` → if found, return early with `{idempotent: true}`. Same dedupe in Notion via `filter: {property: "Notes", rich_text: {contains: uid}}`. |
| **Self-host Windmill is single-worker — schedules in same minute-band queue** | Workers list returns empty/1 worker. 5 nurture + 2 ghost cadences fire 10:00–10:30 Sydney = 7 jobs in same band, drains over ~30–60s. `run_wait_result` callers and webhook-test wrappers will hit 60s timeouts during the cluster. Production schedules are unaffected (no real-time consumer). | Stagger schedules across hours when adding new ones. For test wrappers, use `--max-time 180` minimum. To check queue depth: `GET /api/w/bnb/jobs/queue/list?per_page=50`. |
| **External webhook callers (ManyChat, Zapier, n8n) get `Not authorized: Access denied. Required scope: jobs:run:scripts`** | The default `WINDMILL_API_TOKEN` variable is MCP-scoped — it can read/write workspace metadata but cannot trigger script execution. External services pasting that token into their webhook URL get a 403. | Generate a per-script-scoped token: `POST /api/users/tokens/create` with body `{"label":"<service>-<script>-webhook","expiration":null,"scopes":["jobs:run:scripts","run:script/u/YourUsername/<script-name>"]}`. Response is the raw token string. Embed in the webhook URL as `?token=<value>`. The token can ONLY trigger that one script — safe to leave in third-party config. |
| **ManyChat sends literal `{{varname}}` text when a variable can't resolve** | If the test contact has no value for a Custom User Field (e.g., email never captured), ManyChat substitutes the literal string `"{{email}}"` instead of an empty string. Scripts then try to write `"{{email}}"` as a real email — Airtable accepts it (no validation), polluting CRM with garbage rows. | At the top of the webhook handler, sanitize: `if (email && /^\{\{.*\}\}$/.test(email.trim())) email = ""`. Apply to every CUF-backed field. Also: build email-capture step EARLIER in the ManyChat flow (Ask Email → save to CUF) before the External Request runs. |

---

## Quick Reference Card

```
Workspace: bnb         User: Bnb         Path prefix: u/YourUsername/
Import:    import * as wmill from "npm:windmill-client@1";
Secret:    await wmill.getVariable("u/YourUsername/KEY")
Preview:   mcp__windmill__runScriptPreviewAndWaitResult
Deploy:    mcp__windmill__createScript (path, summary, content, language: "deno")
Schedule:  mcp__windmill__createSchedule (6-field cron, Australia/Sydney)
Webhook:   https://app.windmill.dev/api/w/bnb/jobs/run/p/u/YourUsername/{name}
Airtable:  your-airtable-base-id — describe_table BEFORE PATCH
AC base:   https://buildnbloom.api-us1.com/api/3
```

---

## Migration Note (n8n → Windmill)

n8n is **legacy as of 2026-04-27.** Do not create new n8n workflows. Existing n8n debugging still uses `n8n-build` skill, but every new automation goes through Windmill. The 10 Phase 1 revenue-critical flows have been migrated. See `05-Output/WINDMILL-WEBHOOK-UPDATE-GUIDE.md` for external service URL updates.
