---
name: social-media-graphics
description: How Build n Bloom makes social media carousel graphics — design system, component patterns, build pipeline, and style reference. Invoke before building any carousel slide or social graphic.
---

# How We Make Social Media Graphics

## The Core System

We build carousel slides as Next.js React pages (1080×1350px) and screenshot them with Playwright. No Canva. No design tools. Code produces the asset. This gives us pixel-perfect consistency, version control, brand fidelity, and zero manual export friction.

**Build pipeline:**
1. Design in `website/src/app/slides/{carousel-name}-{slide-number}/page.tsx`
2. Screenshot via `website/capture-slides.mjs` → `public/slides/slide-{name}.png`
3. Upload binaries to Airtable `CONTENT-CALENDAR` via the attachment API
4. Post from Airtable or schedule via content calendar

---

## Reference Accounts — What We Study

### @bradautomates — Grid-Paper Editorial
**Visual signature:** Cream/warm background with grid paper overlay, Anton (condensed advertising sans-serif) headlines, terracotta accent `#C4704F`, overlapping app icon cards with rotation and z-index stacking.
**What works:** The grid paper pattern reads "handmade/technical" simultaneously. Anton at 120px+ is impossible to scroll past. The icon card cluster makes the slide feel like a physical object.
**Steal:** Grid paper + Anton + terracotta = their identity. We use this for tool/stack carousels.

### @okaashish — Clean Box Highlight
**Visual signature:** White background, bold condensed grotesque headline, terracotta-filled highlight boxes around key words (not underlines — boxes). Four icon cards in 2×2 grid with matching terracotta backgrounds and line-art icons.
**What works:** The filled box behind a phrase inside a headline forces the eye to the exact words that matter. The icon cards unify the concept visually.
**Steal:** Highlight boxes for key phrases. Don't underline — put a terracotta rectangle behind the word.
**Technical pattern:**
```tsx
<span style={{ background: TERRA, color: "white", padding: "4px 14px", borderRadius: "4px" }}>
  key phrase
</span>
```

### @gent.huruglica — High-Drama Bold Serif
**Visual signature:** White or near-white background, very large bold serif headline (editorial weight), terracotta/rust color applied to key terms inline, phone or device mockups showing the content fanned out.
**What works:** The contrast between the massive headline and the small mockup creates tension. The phone mockup shows social proof (this is what the finished thing looks like). The "SAVE POST!" stamp in the bottom-right corner is a native CTA that doesn't feel designed — it feels urgent.
**Steal:** Device mockups as a slide element. The "SAVE POST!" stamp concept. Serif at maximum weight for educational carousels.

### @adrianabubori — Minimal Centered Cream
**Visual signature:** Warm cream background (`#F2EDEA`), centered layout, Anthropic asterisk icon as a lone visual anchor, large centered serif headline in dark brown, pill/oval CTA at bottom, author name in small caps at top.
**What works:** Extreme whitespace creates luxury. The single icon does all the visual work. The pill CTA is soft — invitation, not command.
**Steal:** Use the Anthropic asterisk as a standalone icon element (we own this brand connection). Pill CTAs for softer slides. Centered layout when the content is contemplative rather than energetic.

### Dark Theme Carousel
**Visual signature:** Near-black background (`#0D0D0D`), white large serif headline, terracotta/coral pill button with soft glow effect (`box-shadow: 0 0 20px rgba(196,112,79,0.4)`), embedded dashboard data mockup in a slightly lighter dark card, green live-indicator badges, decorative terracotta asterisk burst overlapping the card.
**What works:** The glow effect on the pill makes it feel like a real UI element. Embedding actual data (128 emails, 23 tasks, 4 meetings) grounds the slide in reality. The overlapping decorative element (asterisk/burst) breaks the grid and creates depth.
**Steal:** Glow effect on accent-colored elements. Embed real numbers into mockup cards. Overlapping decorative burst as a depth trick.

---

## Our Design System

### Canvas
- **Dimensions:** 1080 × 1350px (4:5 portrait — Instagram, LinkedIn, Facebook native)
- **Scale factor:** 1 (no Retina — single-pixel precision for web fonts)
- **Safe zone:** 60px padding all sides minimum

### Color Palette — Light Theme (primary)
```js
const BG = {
  backgroundColor: "#F0EBE0",          // warm cream
  backgroundImage: `
    linear-gradient(rgba(110,80,50,0.13) 1px, transparent 1px),
    linear-gradient(90deg, rgba(110,80,50,0.13) 1px, transparent 1px)
  `,
  backgroundSize: "32px 32px",         // grid paper
};
const TERRA = "#C4704F";               // terracotta accent
const INK   = "#1A1A1A";              // near-black text
const MUTED = "#5C4A3A";              // warm muted brown for subtitles
```

### Color Palette — Dark Theme (secondary)
```js
const BG_DARK    = "#0D0D0D";
const CARD_DARK  = "#1A1A1A";
const TERRA      = "#C4704F";
const GLOW       = "0 0 24px rgba(196,112,79,0.35)";
const GREEN_LIVE = "#4ADE80";
```

### Color Palette — Minimal Cream (tertiary)
```js
const BG_CREAM = "#F2EDEA";
const INK_WARM = "#2C1F14";
const TERRA    = "#C4704F";
```

### Typography
```tsx
// In root layout.tsx — already loaded:
// Anton (400) → --font-anton      — bold condensed advertising headlines
// Space Mono (400, 700) → --font-space-mono — labels, technical text, counters

// Usage:
fontFamily: "var(--font-anton), sans-serif",     // headlines > 60px
fontFamily: "var(--font-space-mono), monospace", // labels, tags, footers

// Scale:
// Cover headline:   148px, lineHeight: 0.9
// Section headline: 80–100px
// Subtitle:         22–28px, letterSpacing: 0.08em
// Label:            12px, letterSpacing: 0.25em, uppercase
// Footer URL:       14px, letterSpacing: 0.12em
```

### Shared Layout Shell
Every slide uses this outer wrapper:
```tsx
<div style={{
  width: "1080px", height: "1350px",
  ...BG,
  position: "relative", overflow: "hidden",
  display: "flex", flexDirection: "column",
  padding: "60px 72px 56px",
}}>
  {/* Top label — carousel name */}
  <div style={{
    fontFamily: "var(--font-space-mono), monospace",
    fontSize: "12px", letterSpacing: "0.25em",
    textTransform: "uppercase", color: TERRA,
    marginBottom: "24px",
  }}>Build n Bloom — {carouselTitle}</div>

  {/* Top rule */}
  <div style={{ width: "100%", height: "2px", background: INK, marginBottom: "52px" }} />

  {/* Content */}
  <div style={{ flex: 1 }}>
    {/* slide-specific content here */}
  </div>

  {/* Thin separator */}
  <div style={{ width: "100%", height: "1px", background: "rgba(26,26,26,0.2)", marginBottom: "20px" }} />

  {/* Footer */}
  <div style={{ display: "flex", justifyContent: "space-between", alignItems: "baseline" }}>
    <span style={{
      fontFamily: "var(--font-anton), sans-serif",
      fontSize: "54px", color: "rgba(26,26,26,0.12)",
    }}>{slideNumber.toString().padStart(2, "0")}</span>
    <span style={{
      fontFamily: "var(--font-space-mono), monospace",
      fontSize: "14px", letterSpacing: "0.12em",
      textTransform: "uppercase", color: TERRA,
    }}>yourdomain.com</span>
  </div>
</div>
```

---

## Component Patterns

### Keyword Highlight Box (from @okaashish)
For highlighting key terms inside a headline:
```tsx
function Highlight({ children }: { children: React.ReactNode }) {
  return (
    <span style={{
      background: TERRA, color: "white",
      padding: "2px 16px", borderRadius: "6px",
      display: "inline-block",
    }}>{children}</span>
  );
}
// Usage in headline:
<h1>These <Highlight>6 tools</Highlight> run our biz.</h1>
```

### App Icon Card (from @bradautomates)
Overlapping rotated icon cards for cover slides:
```tsx
function ToolIcon({ bg, rotate = 0, zIndex = 1, children }) {
  return (
    <div style={{
      width: "160px", height: "160px",
      borderRadius: "32px",
      background: bg,
      display: "flex", alignItems: "center", justifyContent: "center",
      transform: `rotate(${rotate}deg)`,
      boxShadow: "0 8px 32px rgba(0,0,0,0.18), 0 2px 8px rgba(0,0,0,0.12)",
      position: "absolute", zIndex,
      border: "2px solid rgba(255,255,255,0.15)",
    }}>{children}</div>
  );
}
// Stack 5 icons at offsets: left 0, 120, 240, 360, 480px — heights vary ±20px
// Rotate alternately: -8, +4, -3, +6, -5 degrees
```

### Dashboard Mockup Card (dark inset)
For showing real tool screenshots embedded in slides:
```tsx
<div style={{
  background: "#1A1A1A",
  borderRadius: "16px",
  padding: "24px",
  boxShadow: "0 4px 40px rgba(0,0,0,0.4)",
}}>
  {/* Header row */}
  <div style={{ display: "flex", alignItems: "center", gap: "8px", marginBottom: "20px" }}>
    {/* Tool logo SVG here */}
    <span style={{ color: "rgba(255,255,255,0.5)", fontSize: "11px", fontFamily: "var(--font-space-mono), monospace" }}>
      WORKSPACE / BNB
    </span>
    <div style={{ marginLeft: "auto", width: "8px", height: "8px", borderRadius: "50%", background: "#4ADE80" }} />
  </div>
  {/* Content rows */}
</div>
```

### Pill/Status Badge
```tsx
function Badge({ label, color = TERRA }: { label: string; color?: string }) {
  return (
    <span style={{
      background: `${color}22`,
      color: color,
      padding: "4px 12px",
      borderRadius: "100px",
      fontSize: "11px",
      fontFamily: "var(--font-space-mono), monospace",
      letterSpacing: "0.1em",
      textTransform: "uppercase",
      border: `1px solid ${color}44`,
    }}>{label}</span>
  );
}
```

### Glow Button (dark theme)
```tsx
<div style={{
  display: "inline-flex", alignItems: "center", gap: "8px",
  background: "transparent",
  border: `1.5px solid ${TERRA}`,
  borderRadius: "100px",
  padding: "10px 24px",
  boxShadow: `0 0 20px rgba(196,112,79,0.35)`,
  color: TERRA,
  fontFamily: "var(--font-space-mono), monospace",
  fontSize: "13px",
}}>
  <span style={{ fontSize: "10px" }}>+</span>
  Pulling live data...
</div>
```

### Decorative Asterisk Burst (Anthropic motif)
Use the Anthropic asterisk SVG as a floating decorative element overlapping a card:
```tsx
<svg viewBox="0 0 24 24" fill={TERRA} style={{
  width: "180px", height: "180px",
  position: "absolute", bottom: "-40px", right: "-20px",
  opacity: 0.85,
  transform: "rotate(15deg)",
}}>
  <path d="M11.9998..." />
</svg>
```

---

## Brand Icon Sources

For real brand SVG icons in icon cards:
- **Simple Icons CDN:** `curl -s "https://cdn.simpleicons.org/{slug}/white"`
  - Anthropic: slug `anthropic` ✓
  - Airtable: slug `airtable` ✓
  - Cal.com: slug `caldotcom` ✓
  - n8n: slug `n8n` ✓
  - ActiveCampaign: slug `activecampaign` ✓
- **Custom SVG paths** (not on Simple Icons):
  - Windmill: Use polygon blade shape (5-6 trapezoid polygons in a radial pattern)
  - Instantly: Use lightning bolt path (`M14.615 1.595... M12.982 9.75...`)

Always render icons at 72–88px inside a 160×160px card. Use `fill="white"` for dark card backgrounds.

---

## Carousel Structure (7-slide system)

Every carousel follows this arc:
| Slide | Role | Key element |
|-------|------|-------------|
| 01 | Cover | Anton headline + icon card cluster |
| 02–05 | Topic slides | One tool/concept per slide, dashboard mockup |
| 06 | Proof/data | Number or result — real, not hypothetical |
| 07 | CTA | "Book at yourdomain.com" or "Link in bio" |

**Cover headline formula:** `[NUMBER] [CATEGORY]` on line 1 (terracotta), `[VERB/ACTION]` on line 2 (black), `[OBJECT]` on line 3 (black). Subtitle in Space Mono below.

**Topic slide formula:** Terracotta bookmark icon + tool name as heading → Dark mockup card showing real UI → 3 bullet points in Space Mono → terracotta slide number bottom-left.

---

## What Makes a Carousel Stop the Scroll

From studying the references, the stops-scroll signals are:

1. **One-line cover hook at 100px+.** Anton (or equivalent condensed weight) at that size is physically impossible to process while scrolling. The eye stops before the brain decides.
2. **Real data embedded.** "128 emails, 23 tasks, 4 meetings" beats "saves you time." Show the actual numbers from actual systems.
3. **Icon cards overlapping each other.** The visual depth from z-index stacking + rotation makes it look like a photograph of physical objects, not a flat digital design.
4. **Grid paper as texture.** It reads simultaneously as "technical blueprint" and "notebook" — both associations work for an AI/automation audience.
5. **Terracotta on cream is a rare palette.** It's warm and anti-corporate. The AI space is full of blue/purple gradient content. Terracotta on cream is distinctive.
6. **The "SAVE POST!" stamp.** A self-referential CTA. Tells the reader what action to take without making it feel like a polished designed button.

---

## Screenshot Pipeline

```bash
# From website/ directory — captures all slides in SLIDES array
node capture-slides.mjs

# Output: public/slides/slide-{name}.png
# Dev server must be running on localhost:3000

# Suppress Next.js dev overlay — already in capture-slides.mjs:
await page.addStyleTag({ content: 'nextjs-portal { display: none !important; }' });
await page.waitForTimeout(1200); // wait for web fonts
```

## Airtable Upload

Binary attachment upload — body is JSON with base64 file, NOT octet-stream. No table ID in URL.

```js
const file = fs.readFileSync('website/public/slides/slide-tools-01.png');
const b64 = file.toString('base64');

// URL format: baseId / recordId / fieldName / uploadAttachment  (NO table ID)
await fetch(`https://content.airtable.com/v0/${BASE_ID}/${RECORD_ID}/Carousel_Images/uploadAttachment`, {
  method: 'POST',
  headers: { 'Authorization': `Bearer ${API_KEY}`, 'Content-Type': 'application/json' },
  body: JSON.stringify({ contentType: 'image/png', filename: 'slide-tools-01.png', file: b64 }),
});
```

After upload, reorder via MCP `mcp__airtable__update_records` to drop old attachment and set correct slide sequence:
```json
{ "fields": { "Carousel_Images": [{"id": "attNEW"}, {"id": "att02"}, ...{"id": "att07"}] } }
```

Record IDs (CONTENT-CALENDAR, table `tblxYK3dLdeKNjb4S`):
- SLOP: `rec84949mA8s0QzJK`
- MAP: `recKlnTXNBmElOigT`
- STRESS: `recB8q07gyzFmrNDD`
- TOOLS: `reczamfgRFtjSEUOA`
