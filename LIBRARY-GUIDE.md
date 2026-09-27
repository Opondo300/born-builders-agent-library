# Library scope and maintenance

Reviewed against repository commit `306060d336f53dfd5aec4294f832371f6508f3dc` on 27 September 2026.

## What is maintained here

This public repository distributes reusable agent prompts and skill methods. It is not the operating authority for a particular business, a deployed-agent inventory, a service registry, a price list or evidence that any cited result occurred.

Before applying a method, use the target project's current instructions, product/offer, approved claims, runtime configuration and task scope. Examples naming NDIS, a founder, a client, a guarantee or a revenue figure remain examples unless the target project supplies applicable evidence and authority. Never invent experience or retain a legacy price to fill missing context.

## Content map

| Surface | Use | Currentness boundary |
| --- | --- | --- |
| `agents/*.md` | Specialist prompt definitions | Model IDs, tools, collaborators and dependencies must match the target environment; a prompt is not proof of installation. |
| `skills/*/SKILL.md` | Reusable methods | Scope and examples require project-specific context. Research claims and platform advice are not freshly verified by this review. |
| Skill `references/` and `assets/` | Supporting frameworks and templates | Templates are inputs for adaptation, not approved business commitments or benchmark evidence. |
| [Archived ICP and outreach](archive/2026-09-27/INDEX.md) | Historical company-specific material | Excluded from installation; superseded as defaults by the portable current methods. |
| `install.sh` | Existing bulk installer | Known `set -e` counter issue; selective manual installation is documented in the root README. |

## Portable use

1. Read the selected prompt and its declared dependencies before installation.
2. Resolve references such as `.claude/rules/brand-voice.md`, `05-Output/` and named collaborator agents in the target project. They are not bundled by implication. If absent, use explicit task context and record the missing dependency.
3. Use the runtime/model selected by the user's environment. Embedded model names are defaults from the exported prompt, not proof of current availability.
4. Check examples and quantitative claims before reusing them as factual claims. Time-sensitive legal, platform, API and provider details need current primary evidence.
5. Drafting a message, campaign, contract or workflow does not itself authorise sending, signing, deployment or provider changes.

## Review coverage

The September review inventories the 23 agent files, 43 skill entrypoints and their supporting documents. It corrects the root's unsupported active-use claim and replaces the obsolete ICP/outreach defaults while preserving original bytes. It does not certify every research citation, every numeric claim, provider capability or prompt's runtime compatibility. Those require scoped verification before use; no blanket “all documents current” claim is made.
