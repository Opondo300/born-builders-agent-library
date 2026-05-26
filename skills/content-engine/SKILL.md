---
name: content-engine
description: Create platform-native content systems for X, LinkedIn, TikTok, YouTube, newsletters, and repurposed multi-platform campaigns. Use when the user wants social posts, threads, scripts, content calendars, or one source asset adapted cleanly across platforms.
---

# Content Engine

Turn one idea into strong, platform-native content instead of posting the same thing everywhere.

## When to Activate

- writing X posts or threads
- drafting LinkedIn posts or launch updates
- scripting short-form video or YouTube explainers
- repurposing articles, podcasts, demos, or docs into social content
- building a lightweight content plan around a launch, milestone, or theme

## First Questions

Clarify:
- source asset: what are we adapting from
- audience: builders, investors, customers, operators, or general audience
- platform: X, LinkedIn, TikTok, YouTube, newsletter, or multi-platform
- goal: awareness, conversion, recruiting, authority, launch support, or engagement

## Core Rules

1. Adapt for the platform. Do not cross-post the same copy.
2. Hooks matter more than summaries.
3. Every post should carry one clear idea.
4. Use specifics over slogans.
5. Keep the ask small and clear.

## Platform Guidance

### X
- open fast
- one idea per post or per tweet in a thread
- keep links out of the main body unless necessary
- avoid hashtag spam

### LinkedIn
- strong first line
- short paragraphs
- more explicit framing around lessons, results, and takeaways

### TikTok / Short Video
- first 3 seconds must interrupt attention
- script around visuals, not just narration
- one demo, one claim, one CTA

### YouTube
- show the result early
- structure by chapter
- refresh the visual every 20-30 seconds

### Newsletter
- deliver one clear lens, not a bundle of unrelated items
- make section titles skimmable
- keep the opening paragraph doing real work

## Repurposing Flow

Default cascade:
1. anchor asset: article, video, demo, memo, or launch doc
2. extract 3-7 atomic ideas
3. write platform-native variants
4. trim repetition across outputs
5. align CTAs with platform intent

## Deliverables

When asked for a campaign, return:
- the core angle
- platform-specific drafts
- optional posting order
- optional CTA variants
- any missing inputs needed before publishing

## Quality Gate

Before delivering:
- each draft reads natively for its platform
- hooks are strong and specific
- no generic hype language
- no duplicated copy across platforms unless requested
- the CTA matches the content and audience

---

## Anti-AI-Slop Gate (Mandatory — runs before any output ships)

Canonical protocol: `.claude/rules/brand-voice.md` → Anti-AI-Slop Protocol

**Top 5 failure modes for content:**

- **SEEB pattern dominates** — Statement → Explanation → Example → Bridge. When every piece of content resolves this way the structure betrays machine authorship. Break at least one paragraph per piece: open with the example, end on the claim without bridging, or let the example be the whole paragraph.
- **Treadmill effect** — the writing moves without advancing. Each paragraph restates the previous point in different words instead of adding the next idea. If a paragraph could be deleted without the reader noticing a missing argument, delete it.
- **Colon-then-list as the only structure** — every section following "Here is the concept: [bullet] [bullet] [bullet]" is a fingerprint. Vary: sometimes the evidence leads to the conclusion in prose, with no list at all.
- **False balance** — "on one hand / on the other hand" where a clear side exists. AI hedges to avoid commitment. Real practitioners take a side. When you know which side is right, state it. False balance is evasion, not nuance.
- **Engagement-bait endings** — "Agree? Repost!" / "Share with someone who needs to hear this" / "What do you think?" with no real question underneath. Banned entirely. End on the last real idea. Stop there.

Before finalising: run the 15-point self-check in `brand-voice.md`.

Is there anything in this output only Richard or Rayan could have written — a specific observation from the NDIS sector, a number from the business, a named situation from actual operations? If not, rewrite until there is.
