---
name: "cold-email-doctrine"
description: "Build n Bloom cold email doctrine for NDIS SIL/SDA outreach. 5-email sequence architecture (day 0/3/7/10/14), personalisation tiers (9-18% reply rates), {{personalizedLine}} generation via n8n+Claude API, spintax rules, reply handling scripts, lead scoring minimum 50pts, Instantly infrastructure rules (SPF/DKIM/warmup/bounce), key metrics. Use when writing outreach sequences, cold email copy, or configuring Instantly campaigns."
license: MIT
metadata:
  version: 1.0.0
  author: Build n Bloom
  category: sales
  domain: cold-outreach
  updated: 2026-04-22
---

> **Scope — NDIS Vertical Only:** This doctrine applies to NDIS SIL/SDA cold outreach specifically. The Referral Agent, coordinator language, SCHADS references, and CTA structure are calibrated for NDIS providers. For other verticals (trades, agencies, general small business), adapt: replace coordinator language with the vertical's equivalent relationship-builder, replace NDIS trigger events with the vertical's compliance or operational pain, and replace the Referral Agent with the relevant point solution.

---

# Cold Email Doctrine

**Updated:** 2026-04-13
**Source:** Instantly 2026 best practices + Instantly opener templates (50k email dataset) + Instantly personalisation scaling guide + NDIS SIL/SDA outreach
**Product:** Referral/Outreach Agent only

---

## Core Principles

**Single Product Focus:** We sell one thing — the Referral/Outreach Agent. Every email is about coordinator relationships, referral pipeline, and vacancy cost. No other agents. No scorecard. No multi-agent pitch.

**The One Rule:** Make the prospect feel understood before making an offer. Research their world, use their language, reference their specific situation.

**The 15-Second Rule:** Best cold emails get read in 10–15 seconds. If it takes longer, cut it.

**The ICP Language Principle:** Write at the vocabulary register of the recipient. An ops director email sounds like one ops director texting another — not an agency pitch.

**The Opener Rule (Instantly):** The opening line is entirely about the recipient. Reference something specific — a service model, a positioning choice, a recent post, a job listing, a milestone — and pair it with a genuine compliment tied to that specific observation. The compliment must name something they've built, held, or achieved. Generic warmth ("Genuine respect for your work") is banned. Never open with sender-centric framing ("Most providers I talk to", "I wanted to reach out because").

**The Personalisation Rule (Instantly):** Personalisation is a data management system, not a creative writing challenge. Segment before writing. Use 3–5 custom variables per email. Tier 1 (name + company only) = ~9% reply rate. Tier 3 (firmographic + behavioural + AI-generated hooks + spintax) = 15–18%.

---

## Format (Non-Negotiable)

1. Plain text only. No images, no HTML, no logos.
2. No links in email 1. First links appear in email 4.
3. 50–80 words per email. Under 125 absolute max.
4. Single CTA only.
5. "Sent from iPhone" signature.
6. Subject: `{{firstName}} - {{RANDOM|variation1|variation2|variation3}}`
7. Greeting: `Hi {{firstName|there}},` — not "Hey" (too casual for executive recipients per Instantly data), not "Dear" (too formal).
8. Spintax on every email — minimum 3 blocks per body, 2 per subject line.
9. Fallback syntax on all variables: `{{firstName|there}}`, `{{city|your area}}`, `{{companyName|your organisation}}`.

---

## 5-Email Sequence Architecture

| Email | Day | Strategy | Offer | CTA |
|-------|-----|----------|-------|-----|
| 1 | Monday | {{personalizedLine}} + problem hook | Coordinator Pipeline Audit (reply-gated, no link) | "Want me to send it?" |
| 2 | Wednesday +3 | Reply-style bump | None | "Did this get buried?" |
| 3 | Monday +7 | New angle — vacancy cost + Navigator urgency | None — direct meeting ask | "Worth a quick call?" |
| 4 | Thursday +10 | Diagnostic deliverables + tool page links | Coordinator Gap Map + Vacancy Cost Estimate + Referral Agent Recommendation | "Keep the report either way" |
| 5 | Monday +14 | Break-up, leave door open | None | Email address |

**Email 1 offer:** The Coordinator Pipeline Audit at /tools/coordinator-audit. 5 questions, 3 minutes, produces a score out of 100. Shows whether their pipeline is top quartile, middle, or exposed. Reply-gated — no link in the email, they reply "yes," we send the link. The audit makes the case for the Referral Agent without us saying a word.

**Industry benchmarks (Instantly 2026):**
- Average reply rate: 3.43% | Top quartile: 5.5%+ | Elite tier: 10.7%+
- 58% of replies come from email 1. 42% from follow-ups.
- Problem-hook emails: 4.39% reply rate, 48.30% positive reply rate.
- Timeline-based hooks (industry shift, regulatory deadline): 10.01% reply rate.

---

## Personalisation Architecture

### Custom Variables (Import via Apollo CSV export)

| Variable | Source | Usage |
|----------|--------|-------|
| `{{firstName}}` | Apollo | Greeting |
| `{{companyName}}` | Apollo | Body reference |
| `{{city}}` | Apollo | Location specificity |
| `{{personalizedLine}}` | n8n + Claude API (LinkedIn/website scrape → GPT) | Opening line — prospect-specific |
| `{{triggerEvent}}` | Apollo job postings / news | Hiring signal, vacancy listing |

### {{personalizedLine}} Generation

Use n8n to scrape the prospect's LinkedIn profile + company website via Playwright, then pass to Claude API:

> "Write 1–2 sentences for a cold email opener. First: reference something specific about this person or their company — a service model, a positioning choice, a recent post, a job listing, or a milestone. Second: add a genuine compliment tied to that specific observation — what they've built, held, or achieved. The compliment must be specific to what you observed, not generic ('Genuine respect for your work' is banned). Write like one sector professional to another. Context: they are an NDIS SIL/SDA provider."

If no usable signal is returned, the email falls back to a spintax block referencing their location + company name.

### Personalisation Hierarchy

Use the FIRST signal that applies:

1. Recent activity match — they posted about coordinators, referrals, vacancies, or participant placement
2. Hiring signal — new role, SC coordinator position open, expanding into new area
3. Capability gap — SIL/SDA services listed but no visible coordinator outreach system
4. Location match — mapping providers in their suburb/region
5. Industry context — sector trend (weakest, use only as fallback spintax)

---

## Spintax Rules

Format: `{{RANDOM|option1|option2|option3}}`

- 3–5 natural synonyms per block.
- Apply to subject lines AND body copy.
- Subject line spintax improves open rates by 50% (Instantly data).
- Purpose: prevent ESP fingerprinting, mass emailer classification, and template detection.

---

## Reply Handling

### Pipeline Audit Reply (Email 1 positive response)

Send within 15 minutes. Link to the Coordinator Pipeline Audit + Cal.com booking link in the same message.

### Other Positive Replies

Respond within 15 minutes. Send the Referral Agent warm handoff asset + Cal.com. No qualification exchange before booking. No pricing before the call.

### Objections

- *"Not interested"* → "Understood. If things change — your@email.com." Tag for 90-day re-engagement.
- *"Send info first"* → Send the pipeline audit link: "This is the quickest way to see if it's relevant — 3 minutes, no call: your-domain.com/tools/coordinator-audit"
- *"What does it cost?"* → "It depends on the size of the operation, which is why the diagnostic is worth doing first. This shows where the gaps usually sit: your-domain.com/tools/coordinator-audit"
- *"Already have someone"* → "Good to hear. How's it going? Any gaps in the coordinator side?"

---

## Lead Scoring (Min. 50 to enter sequence)

| Signal | Points |
|--------|--------|
| CEO/Founder/MD | +40 |
| Director/GM | +35 |
| Ops Manager | +30 |
| SIL/SDA provider confirmed | +30 |
| 10+ locations | +15 |
| Currently hiring SC/coordinator role | +10 |
| Verified personal email | +5 |

---

## Infrastructure Rules (Instantly)

| Rule | Specification |
|------|--------------|
| Sending cap | 30 emails per inbox per day |
| Warmup period | Minimum 2 weeks on secondary domains before campaign |
| Bounce rate | Below 2% — above 5% damages sender reputation within days |
| Tracking | Open/click tracking OFF for Email 1 |
| Domains | Never send cold from primary domain (your-domain.com). Use secondary domains. |
| SPF/DKIM/DMARC | Configured on all sending domains before first send |
| Inbox rotation | Use multiple inboxes to prevent single-domain reputation damage |

---

## Key Metrics & Targets

| Metric | Target | Instantly Benchmark |
|--------|--------|-------------------|
| Reply rate (cold) | >5.5% | Average: 3.43%, Top: 5.5%, Elite: 10.7% |
| Positive reply rate | >2% of sends | — |
| Meeting book rate | >50% of positive replies | — |
| Email bounce rate | <2% | Industry average: 7.5% |
| Email deliverability | >95% | — |

**Ignore open rates.** Apple Mail Privacy Protection pre-opens emails via proxy servers. Reply rate is the only reliable engagement signal.

---

## Templates

Full sequence (5 emails) with spintax, personalised openers, and pipeline audit offer:

**`05-Output/COLD-EMAIL-REWRITE.md`**

---

## Anti-AI-Slop Gate (Mandatory — runs before any output ships)

Canonical protocol: `.claude/rules/brand-voice.md` → Anti-AI-Slop Protocol

**Top 5 failure modes for cold email:**

- **Phantom confidence** — definitive tone with nothing underneath: "This is a significant issue for providers." Significant how? What number? Replace every claim that can't survive "according to what, exactly?" with a specific fact, number, or named observation.
- **Throat-clearing openers** — cold email has zero warmup tolerance. The first word is the point. Cut any sentence that exists to set context before the point. "I wanted to reach out because" is banned. So is any variation of it.
- **Latinate bias** — facilitate / implement / utilize / communicate / demonstrate trigger the uncanny valley. Use the Anglo-Saxon word every time: help, do, use, say, show.
- **Faux candor openers** — "To be honest," "Frankly," "Honestly" signal the opposite of honesty. Real directness doesn't announce itself. Delete and state the thing.
- **Epistemic openers** — "Naturally," "Obviously," "Clearly," "Certainly" as sentence starters are statistical AI fingerprints and epistemic arrogance. Cut every one.

Before finalising: run the 15-point self-check in `brand-voice.md`.

Is there anything in this output only Richard or Rayan could have written — a specific number from their outreach data, a named signal from an actual prospect, a real observation from the NDIS sector? If not, rewrite until there is.
