---
name: instagram-carousel-builder
description: End-to-end process for building 1080×1080 Instagram carousels — from brief through desire audit, copy, implementation, and Playwright verification. Covers 7-slide progressive revelation architecture, design system, component patterns, and per-slide persuasion checklist. Invoke before starting any carousel build.
type: process
---

# Instagram Carousel Builder

**Reference carousels (working examples):**
- `website/src/app/slides/slop-*/` — Anti-AI Slop Protocol (7 slides)
- `website/src/app/slides/stress-*/` — Business Advisor Stress-Test (7 slides)
- `website/src/app/slides/map-*/` — Buyer Psychology Map (7 slides)

---

## Phase 1 — Brief

Before writing a single word, answer these five questions. If any are unanswered, the carousel will underperform regardless of execution quality.

1. **Topic**: What skill/framework/protocol does this carousel deliver?
2. **Unique mechanism**: WHY does this work differently from the obvious alternative? Name the mechanism — it must be specific enough to label (e.g. "The uncanny valley of text", "Five lenses. One ranked output.", "8 questions from real calls").
3. **Comment keyword**: One word the viewer will comment to trigger ManyChat delivery (e.g. SLOP, STRESS, MAP). All-caps. This word becomes the CTA on slide 07 and appears as a footer keyword on slides 01–06.
4. **Primary human drive**: Which of the 8 core drives is this primarily activating? Most carousels hit Learn + Defend. Identify both.
5. **Hopkins private fear**: What is the *private*, embarrassing cost the viewer carries but does not say out loud? Not the intellectual problem — the silent personal consequence. This goes on slide 01.

---

## Phase 2 — Desire Audit (run before writing copy)

Answer all six. If you cannot, the copy will be intellectually clear but emotionally inert.

1. **Which drive?** Learn / Defend / Status / Acquire / Bond / Create / Experience / Transcend
2. **Wanting vs. liking?** Are you building anticipation (wanting system — dopamine, scarcity, incomplete loops) or describing satisfaction (liking system — outcomes, testimonials)? Carousels should be 80% wanting, 20% liking.
3. **Loss framing**: What specific loss does inaction produce? Frame in terms of what they lose, not what they gain.
4. **Identity Triangle**:
   - Current self: who they are now (problem state)
   - Aspirational self: who they become with the skill
   - **Rejected self**: who they become if they skip it — name this explicitly on slides 01 or 06
5. **Tribal signal**: What does using this skill signal about the viewer to their peers? ("I write at a human level" / "I test my assumptions before I commit")
6. **Somatic marker**: What should the visual + copy make the body *feel* before the mind decides? (urgency / relief / recognition / respect)

---

## Phase 3 — 7-Slide Architecture

Progressive revelation — each slide ends on an incomplete thought. The reader must swipe to resolve. Only slide 07 resolves (with a question, not a statement).

### Slide 01 — Hook (Confrontational claim + Hopkins private fear)

**Purpose**: Activate the Defend drive. Name the intellectual problem AND the private, embarrassing cost in the same slide.

**Structure**:
- Big headline (100–112px Instrument Serif, dark): confrontational claim
- Gold squiggle divider
- Body mono (14px JetBrains Mono): intellectual problem + Hopkins private fear line
- Visual proof card at bottom (white card with flagged example, comparison table, or "describes everyone" demo)

**Hopkins private fear rule**: The private fear is not the intellectual problem. It is what the viewer carries silently. Not "your writing has AI words in it" — "You'll never know who stopped reading. Or what you lost."

**Copy checklist**:
- [ ] First sentence = the point (no warmup)
- [ ] Hopkins private fear: named explicitly
- [ ] Rejected self: implied or stated
- [ ] Ends without resolution — the visual card raises the problem but does not solve it

---

### Slide 02 — Villain escalation (Data + forward pull)

**Purpose**: Prove the problem is worse than they thought. End with a line that pulls them to slide 03.

**Structure**:
- Context label (9px JetBrains Mono gold, uppercase): e.g. "THE RESEARCH"
- Hero stat (240–360px Instrument Serif, dark): the number that shocks (e.g. "48×")
- Gold squiggle divider
- Stat label (15px JetBrains Mono): what the number means
- Attribution line (10px JetBrains Mono, faint): source + year
- Forward pull (13px JetBrains Mono italic, faint): incomplete thought pulling to slide 03

**Forward pull rule**: The last line must be incomplete. It points at what is coming without resolving it.
- Correct: "That's one word. There are 47 more."
- Correct: "The 8 questions do."
- Wrong: "Which is why the protocol exists." (resolves — no reason to swipe)

---

### Slide 03 — Unique mechanism (THE MECHANISM)

**Purpose**: Name WHY this works differently. Not what it contains — the underlying reason it produces results the alternative cannot.

**Structure**:
- Context label (9px JetBrains Mono gold uppercase): "THE MECHANISM"
- Headline split (86–90px Instrument Serif): dark line + gold line
- Gold squiggle divider
- Body (3 JetBrains Mono paragraphs, 13–14px): mechanism explained in plain language — cause then effect then consequence
- Attribution (10px faint): if sourced from research

**Mechanism writing rule**: The mechanism is not a feature list. It is the WHY. "Five frameworks each attack a different failure mode" is a mechanism. "Contains 5 frameworks" is a feature.

**Body paragraph structure**:
1. The underlying reality (what is actually happening)
2. The chain of events it triggers (cause → effect)
3. The consequence (italic Instrument Serif for weight — this is the line that lands)

---

### Slide 04 — Specific components (What is inside)

**Purpose**: Make the mechanism concrete. Show the parts.

**Structure options**:
- Numbered list (bold Montserrat names + JetBrains Mono descriptions)
- Two-column grid with gold numbered labels
- Hero number (200–240px Instrument Serif) + component grid

**Rule**: Every item must be specific enough to be actionable. "Resistance Beliefs" is specific. "Belief mapping" is not.

---

### Slide 05 — Output sample (What it produces)

**Purpose**: Show the result. The viewer should be able to see themselves using this.

**Structure**:
- Headline split: "What the skill / produces." (dark + gold)
- White card labeled "Sample Output" with 3–5 realistic output rows
- Output rows use alternating background for scannability

**Output sample rule**: The sample must look like something they could actually use tomorrow. Generic examples ("identifies key issues") are worthless. Specific examples ("Resistance belief: 'I've tried automation before. It didn't work for my team.'") create desire.

---

### Slide 06 — Stakes (What skipping it costs + personal exposure)

**Purpose**: Activate loss aversion. Name the business cost AND the personal cost (credibility, reputation, the fact that their name is attached).

**Structure**:
- Headline split: "What skipping it / costs." (dark + gold)
- Gold squiggle divider
- 3 red-left-border white cards: each names a specific cost scenario
- Footer stat (faint JetBrains Mono): the closing line that names the personal exposure

**Personal exposure rule (Google/CEB B2B research)**: Business costs alone underperform. The viewer needs to see their personal stake. "Your name is on the call you made with confidence." "You're the one who said this was solid."

**Footer stat rule**: Must name credibility, reputation, or personal exposure — not just money or time.

---

### Slide 07 — CTA (Comment keyword + offer + question)

**Purpose**: Trigger the comment. The question at the end activates the algorithm (comment intent) and completes the wanting loop.

**Structure**:
- Context label (faint JetBrains Mono): "Comment"
- Keyword (140–220px Montserrat 900, gold): the comment trigger word
- Dark squiggle divider (opacity 0.2)
- Offer body (36–40px Instrument Serif, dark): what they receive when they comment — 2–3 sentences, concrete
- Italic question (12–13px JetBrains Mono italic, faint): the closing question
- Bottom left: [YOUR BRAND] + yourdomain.com
- Bottom right: CLAUDE SKILL · PASTE → USE

**Offer body rule**: Say exactly what they receive. "We'll send the full protocol. 47 trigger words. 13 structural tells. The 16-point humanization checklist. Paste into Claude before anything ships."

**Question rule**:
- Must be a genuine question about their specific situation
- Must NOT be "What do you think?" or "Have you experienced this?" (hollow engagement bait)
- Must connect directly to the carousel unique mechanism
- Examples:
  - SLOP: "What's the word you keep catching yourself using?"
  - STRESS: "What's the decision you're about to commit to?"
  - MAP: "What's the thing your buyers say that you still don't fully understand?"

---

## Phase 4 — Design System

### Canvas
```
Width: 1080px
Height: 1080px
Background: #EDE8DF (cream)
Padding: 68px 72px 60px
```

### Color palette
```
Dark (primary text):    #0C1419
Gold (accent):          #C8A24F
Gold dark (labels):     #7A5C1E
Red (villain/wrong):    rgba(200,50,40,X)  — 0.3 border / 0.6 label / 0.85 text
White (cards):          #FFFFFF
Faint text:             rgba(12,20,25,0.35–0.48)
Very faint:             rgba(12,20,25,0.15–0.28)
```

### Typography
```
Display headline:   Instrument Serif, Georgia, serif — weight 400, lineHeight 0.92–0.95
Dominant keyword:   Montserrat, sans-serif — weight 900 (CTA keywords, footer keyword)
Body / labels:      JetBrains Mono, monospace — weight 400–500
```

### Decorative SVG elements

**Decorative arc** (every slide, bottom-right):
```jsx
<svg width="200" height="200" viewBox="0 0 200 200" fill="none"
  style={{ position: "absolute", bottom: "-70px", right: "-70px", opacity: 0.20 }}>
  <circle cx="200" cy="200" r="170" stroke="#C8A24F" strokeWidth="2.5"/>
  <circle cx="200" cy="200" r="140" stroke="#C8A24F" strokeWidth="2"/>
</svg>
```

**Gold squiggle divider** (after headline, before body):
```jsx
<svg width="68" height="10" viewBox="0 0 68 10" fill="none"
  style={{ display: "block", marginBottom: "28px" }}>
  <path
    d="M0 5 C4.5 1, 9 1, 13.5 5 C18 9, 22.5 9, 27 5 C31.5 1, 36 1, 40.5 5 C45 9, 49.5 9, 54 5 C58.5 1, 63 1, 67.5 5"
    stroke="#C8A24F" strokeWidth="3.5" strokeLinecap="round" fill="none"/>
</svg>
```

**Dark squiggle** (slide 07 only, under keyword): same path, stroke `rgba(12,20,25,0.12)`, strokeWidth 3.

### Standard header (every slide)
```jsx
<div style={{ display: "flex", justifyContent: "space-between",
  alignItems: "center", marginBottom: "52px" }}>
  <span style={{ fontFamily: "'JetBrains Mono', monospace", fontSize: "10px",
    letterSpacing: "0.22em", textTransform: "uppercase",
    color: "rgba(12,20,25,0.35)" }}>
    {SERIES_TITLE}
  </span>
  <span style={{ fontFamily: "'JetBrains Mono', monospace", fontSize: "10px",
    letterSpacing: "0.18em", color: "rgba(12,20,25,0.2)" }}>
    {NN} — 07
  </span>
</div>
```

### Standard footer (slides 01–06)
```jsx
<div style={{ display: "flex", justifyContent: "space-between",
  alignItems: "flex-end" }}>
  <div style={{ display: "flex", flexDirection: "column", gap: "8px" }}>
    <span style={{ fontFamily: "'JetBrains Mono', monospace", fontSize: "9px",
      letterSpacing: "0.24em", textTransform: "uppercase",
      color: "rgba(12,20,25,0.28)" }}>
      Comment to receive the skill
    </span>
    <span style={{ fontFamily: "'Montserrat', sans-serif", fontWeight: 900,
      fontSize: "28px", letterSpacing: "-0.02em", color: "#0C1419", lineHeight: 1,
      borderBottom: "1.5px solid #C8A24F", paddingBottom: "4px",
      display: "inline-block" }}>
      {KEYWORD}
    </span>
  </div>
  <span style={{ fontFamily: "'Montserrat', sans-serif", fontWeight: 900,
    fontSize: "10px", letterSpacing: "0.04em", color: "rgba(12,20,25,0.15)" }}>
    BUILD N BLOOM
  </span>
</div>
```

### White card (comparison / audit / sample output)
```jsx
<div style={{ background: "#FFFFFF", border: "1px solid rgba(12,20,25,0.08)",
  borderTop: "2px solid #C8A24F", borderRadius: "6px", padding: "22px 20px" }}>
```

### Red-left-border card (cost / wrong / villain)
```jsx
<div style={{ padding: "22px 24px", background: "#FFFFFF",
  border: "1px solid rgba(12,20,25,0.09)",
  borderLeft: "3px solid rgba(200,50,40,0.35)", borderRadius: "4px" }}>
```

### Gold-left-border callout
```jsx
<div style={{ padding: "26px 28px", background: "rgba(12,20,25,0.04)",
  borderLeft: "2px solid rgba(200,162,79,0.5)", borderRadius: "2px" }}>
```

---

## Phase 5 — Implementation

### File structure
```
website/src/app/slides/
├── {keyword}-01/page.tsx   — hook
├── {keyword}-02/page.tsx   — villain escalation
├── {keyword}-03/page.tsx   — unique mechanism
├── {keyword}-04/page.tsx   — specific components
├── {keyword}-05/page.tsx   — output sample
├── {keyword}-06/page.tsx   — stakes / costs
└── {keyword}-07/page.tsx   — CTA
```

### Critical implementation rules

1. **All inline styles** — no Tailwind classes. Playwright renders inline styles reliably.
2. **No unsafe innerHTML props** — a security hook blocks them. Use plain JSX string literals. Apostrophes in JSX string expressions are fine as-is; HTML entities (`&apos;`) are for JSX text nodes only.
3. **Extract data arrays** to `const` before the return — never embed complex objects inline in JSX.
4. **Apostrophe rule**: In JSX text nodes use `&apos;`. In JS string values inside `{}` use `'` directly.

### Playwright screenshot command (single slide)
```bash
npx playwright screenshot \
  --browser chromium \
  --viewport-size="1080,1080" \
  --wait-for-timeout=1200 \
  "http://localhost:3000/slides/{keyword}-{nn}" \
  "/tmp/{keyword}-{nn}.png"
```

### Screenshot all 7 slides
```bash
KEYWORD=slop  # change per carousel
for n in 01 02 03 04 05 06 07; do
  npx playwright screenshot --browser chromium --viewport-size="1080,1080" \
    --wait-for-timeout=1200 \
    "http://localhost:3000/slides/${KEYWORD}-${n}" \
    "/tmp/${KEYWORD}-${n}.png" 2>/dev/null
done
```

---

## Phase 6 — Copy Verification Checklist

Run this before finalizing any carousel. Every box must be checked.

### Virality mechanics (content-operating-system)
- [ ] Slide 01 ends without resolving the problem
- [ ] Slide 02 has a forward pull line — ends on incomplete thought
- [ ] Slides 03–06 each end without completing the thought
- [ ] Slide 07 ends on a genuine question (not engagement bait)
- [ ] No slide gives the full answer — each requires the next slide

### Desire activation (human-desire-engine + persuasion-engine)
- [ ] Hopkins private fear: named explicitly on slide 01
- [ ] Rejected self: visible on slide 01 or slide 06
- [ ] Defend drive: activated by loss framing on at least 2 slides
- [ ] Personal exposure (credibility, name on the call): present on slide 06
- [ ] Wanting greater than liking: copy builds anticipation, does not just describe outcomes
- [ ] Slide 07 question is specific to the mechanism (not "What do you think?")

### Anti-slop protocol (brand-voice.md)
- [ ] No Tier 1 banned words (delve, multifaceted, seamlessly, tapestry, etc.)
- [ ] No banned structural phrases ("Not just X, but Y", "Furthermore", "It's worth noting that")
- [ ] Em-dash count: 2 or fewer per slide
- [ ] Sentence length varies (mix short and long — no 3+ consecutive same-length sentences)
- [ ] At least one specific number, name, or concrete detail per slide
- [ ] All copy uses "we" not "I" (brand voice rule)

### Design
- [ ] All 7 counters correct (01–07 through 07–07)
- [ ] Series label consistent across all 7 slides
- [ ] Footer keyword identical across all 7 slides
- [ ] Slide 07 footer shows [YOUR BRAND] + yourdomain.com + CLAUDE SKILL · PASTE → USE

---

## Execution order

1. Run the Brief and Desire Audit (Phase 1 + 2) — do not skip
2. Write all 7 slide copy briefs before implementing any code
3. Run anti-slop check on all 7 copy briefs
4. Build all 7 slides in order (01 → 07)
5. Screenshot all 7 after building
6. Review screenshots against the verification checklist
7. Iterate on any slide that fails a checklist item
