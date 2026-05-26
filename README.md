# Born Builders — Agent & Skill Library

The actual agent and skill stack Build n Bloom runs in Claude Code. 20 agents. 25 skills. Sanitised for installation on any machine.

This is not a starter kit. These are the files in active daily use for sales, marketing, content, workflow automation, research, and strategy.

---

## Prerequisites

- [Claude Code](https://claude.ai/code) installed
- Basic familiarity with Claude Code agents and skills

If you have not used agents or skills before, start with Module 1 of the Born Builders Foundations course before installing this library.

---

## Installation

### Option A — One command

```bash
bash install.sh
```

Copies all agents and skills to `~/.claude/agents/` and `~/.claude/skills/`. Restart Claude Code after running.

### Option B — Manual

Copy the files you want:

```bash
# Copy a specific agent
cp agents/planner.md ~/.claude/agents/

# Copy a specific skill
cp -r skills/persuasion-engine ~/.claude/skills/
```

---

## How to use after installation

**Agents** — invoke with the Agent tool in Claude Code:

```
Use the sales-outbound-strategist agent to write a cold email sequence for [prospect].
```

**Skills** — invoke with the Skill tool:

```
Use the persuasion-engine skill before writing this sales page.
```

Skills work on-demand — they load a sourced framework into context when called. Agents are specialists that handle a specific job end-to-end.

---

## The 20 Agents

| Agent | What it does |
|-------|-------------|
| `planner` | Breaks any task into a clear implementation plan before execution |
| `architect` | System design, scalability decisions, architectural trade-offs |
| `code-reviewer` | Code quality, patterns, security — flags issues before they ship |
| `marketing-linkedin-content-creator` | LinkedIn posts, thought leadership, personal brand content |
| `marketing-content-creator` | Content calendars, editorial planning, multi-platform campaigns |
| `marketing-instagram-curator` | Instagram content, visual storytelling, caption strategy |
| `marketing-social-media-strategist` | Cross-platform social campaigns, community building, engagement |
| `marketing-growth-hacker` | Acquisition experiments, viral loops, conversion optimisation |
| `marketing-seo-specialist` | Technical SEO, content optimisation, organic growth strategy |
| `sales-outbound-strategist` | Cold email sequences, prospecting, outbound pipeline |
| `sales-discovery-coach` | Call prep, discovery question design, prospect research |
| `sales-deal-strategist` | Deal qualification, competitive positioning, win planning |
| `sales-proposal-strategist` | Proposals, win themes, executive summary writing |
| `sales-account-strategist` | Land-and-expand, account planning, retention strategy |
| `sales-pipeline-analyst` | Pipeline health, deal velocity, forecast accuracy |
| `sales-coach` | Rep development, call coaching, deal review |
| `engineering-frontend-developer` | React, Next.js, UI implementation, performance |
| `engineering-backend-architect` | APIs, server architecture, database design, cloud |
| `engineering-ai-engineer` | AI/ML integration, Claude API, agentic systems |
| `specialized-workflow-architect` | n8n and Windmill workflow design and debugging |

---

## The 25 Skills

| Skill | What it does |
|-------|-------------|
| `persuasion-engine` | Integrated persuasion framework — Cialdini, SPIN, Voss, neuroscience |
| `copywriting-craft` | Copy structure, headlines, hooks, conversion writing |
| `content-operating-system` | Content strategy, virality mechanics, platform-specific structure |
| `hook-engine` | Attention capture for any format — posts, emails, ads, video |
| `brand-science` | Brand identity, positioning, distinctiveness, verbal identity |
| `distribution-science` | Channel mix, owned vs rented media, algorithm mechanics |
| `attention-belief` | Designing for attention capture and belief change |
| `cold-email-doctrine` | Cold email rules: 80-word cap, plain text, single CTA, opener methodology |
| `deep-research` | Multi-source research methodology for any topic |
| `exa-search` | Live web search via Exa — current data, recent content |
| `market-copy` | Website copy audit and rewrite |
| `market-emails` | Email sequence design and copywriting |
| `market-ads` | Paid ad copy — Meta, Google, LinkedIn |
| `market-social` | Social media content strategy and execution |
| `market-landing` | Landing page copy and structure |
| `market-funnel` | Lead funnel design — lead magnet to conversion |
| `market-research` | Market sizing, trend analysis, industry research |
| `market-competitors` | Competitor analysis, positioning gaps, differentiation |
| `icp-matrix` | Ideal customer profile — segmentation, qualification, targeting |
| `windmill-build` | Windmill workflow automation — scripts, flows, schedules |
| `agentic-engineering` | Multi-agent system design, orchestration, agent architecture |
| `decision-making` | Structured decision frameworks for high-stakes choices |
| `offer-acquisition` | Offer design, pricing, lead magnet, acquisition systems |
| `revenue-operations` | CRM strategy, pipeline management, rev ops |
| `founder-coach` | Founder-level strategic coaching and decision support |

---

## Questions

Post in the **Born Builders** Skool community — [skool.com/born-builders-1445](https://skool.com/born-builders-1445)
