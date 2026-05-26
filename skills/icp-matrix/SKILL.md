---
name: "icp-matrix"
description: "Build n Bloom ICP and agent-job-fit routing. Target A (under $750k → Incubator), B ($750k-$1.5M → 1-2 agents), C ($1.5M+ → full stack). Agent-to-problem mapping table, vertical trigger events (NDIS/Trades/Allied Health/Ecommerce/Agency), anti-ICP disqualifiers, qualification questions per agent. Use when qualifying leads, routing prospects, or making targeting decisions."
license: MIT
metadata:
  version: 1.0.0
  author: Build n Bloom
  category: sales
  domain: icp-targeting
  updated: 2026-04-22
---

# ICP Matrix — Agent-Job-Fit Routing

**Updated:** 2026-03-30

---

## Routing Logic

Prospects are routed by which agents their operation needs, then qualified by revenue. Revenue is a qualifier, not the primary signal. The question: **"Which jobs in this business should an agent be handling right now?"**

---

## Segments

### Target A — Needs Education (Born Builders Incubator)

- Revenue below $750k ARR · 1–5 staff · No systematised operations
- Cannot identify a specific repeating job an agent could own
- **Route:** Born Builders Incubator (Skool)
- **Graduation trigger:** Revenue crosses $750k OR operator can describe a specific weekly manual process

### Target B — Needs 1–2 Agents ($3,500–$4,500)

- Revenue $750k–$1.5M ARR · 5–20 staff
- At least one manual process running 3+ times/week
- **Route:** Operational Diagnostic → single agent install → optional second agent at 60 days

**Agent-to-problem mapping:**

| Problem | Agent | Price |
|---------|-------|-------|
| Referrals manual, inconsistent, or absent | Referral Agent | $3,500 |
| Pre-audit, near-miss, registration renewal | Compliance Agent | $4,500 |
| Support workers rostered manually | Roster Agent | $2,500 |
| Delivering services that aren't being claimed | Funding Agent | $4,500 |

### Target C — Needs Full Stack ($9,000+)

- Revenue $1.5M–$10M ARR · 10–50 staff · SIL or after-hours operations
- Multiple broken processes — intake, compliance, and referrals all manual
- **Route:** Operational Diagnostic → Triage Agent primary → Compliance + Referral at 30–60 days

**Primary stack:** Triage ($9k) + Compliance ($4.5k) + Referral ($3.5k) = $17k. Retainer eligible at $1,500–$2,500/month.

---

## Vertical Trigger Events

### NDIS (Primary)

| Trigger | Agent |
|---------|-------|
| After-hours incident logging chaos | Triage Agent |
| Failed mock audit or compliance finding | Compliance Agent |
| Referral volume stagnant | Referral Agent |
| Claims rejected post-service | Funding Agent |
| SCHADS breaches on payroll | Roster Agent |
| July 2026 NDIS registration changes | Compliance Agent |

### Trades & Construction

| Trigger | Agent |
|---------|-------|
| Payday Super 2026 real-time reporting exposure | Roster Agent |
| Variation invoicing delayed to month-end | Funding Agent (adapted) |

### Allied Health (Physio, OT, Psychology)

| Trigger | Agent |
|---------|-------|
| AHPRA compliance burden, audit exposure | Compliance Agent (adapted) |
| Referral pathway gaps — GPs, specialists not converting | Referral Agent (adapted) |
| After-hours intake and appointment capture | Triage Agent (adapted) |

### Small Ecommerce ($1M–$10M)

| Trigger | Agent |
|---------|-------|
| VA cost eating margin, response speed losing customers | Customer support + Retention Agent |
| Returns volume unmanaged | Intake/triage system |

### Digital Agencies

| Trigger | Agent |
|---------|-------|
| Fulfillment headcount eating EBITDA | Referral Agent (adapted) |
| Reporting done manually by account managers | Compliance Agent logic adapted |

**Voice agents (trades, ecommerce, allied health only):** Voice agents apply where after-hours calls lose revenue. Not for NDIS — participant-facing automated voice interactions carry compliance risk.

---

## Anti-ICP — Do Not Deploy Agents For

- NDIS software companies (Brevity, GoodHuman, ShiftCare) — adjacent vendors, not buyers
- Large providers 50+ staff with existing IT teams — have internal build capacity
- Plan managers and support coordinators — referral sources, not service buyers
- Pre-revenue operators with zero clients — Incubator only
- Operators who believe hiring a better manager solves process failure
- Government departments — procurement cycles kill momentum
- Operators who cannot identify a specific repeating job

---

## Qualification Questions by Agent

**Referral Agent:** "How many support coordinators did you actively contact last month?"
**Triage Agent:** "What happens when an incident is reported at 2am?"
**Compliance Agent:** "How would you build an evidence package if an auditor called today?"
**Funding Agent:** "How do you know if a claim will be rejected before you submit it?"
**Roster Agent:** "How does your roster get checked for SCHADS breaches before it's published?"

One clear "yes" per agent is sufficient to qualify the install.
