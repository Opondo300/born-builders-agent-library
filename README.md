# Born Builders — Agent & Skill Library

The actual agent and skill stack Build n Bloom runs in Claude Code. 23 agents. 43 skills. Sanitised for installation on any machine.

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

## The 23 Agents

| Agent | What it does |
|-------|-------------|
| `planner` | Breaks any task into a clear implementation plan before execution |
| `architect` | System design, scalability decisions, architectural trade-offs |
| `code-reviewer` | Code quality, patterns, security — flags issues before they ship |
| `chief-of-staff` | Communication triage across email, Slack, and messaging — classifies and drafts replies |
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
| `sales-engineer` | Pre-sales tech, demo engineering, POC scoping, competitive battlecards |
| `engineering-frontend-developer` | React, Next.js, UI implementation, performance |
| `engineering-backend-architect` | APIs, server architecture, database design, cloud |
| `engineering-ai-engineer` | AI/ML integration, Claude API, agentic systems |
| `specialized-workflow-architect` | Windmill and n8n workflow design, spec and debugging |
| `specialized-document-generator` | Professional PDF, PPTX, DOCX, XLSX generation with charts and data |

---

## The 43 Skills

### Persuasion and Writing
| Skill | What it does |
|-------|-------------|
| `persuasion-engine` | Buyer neuroscience + Cialdini, SPIN, Voss, pricing psychology |
| `copywriting-craft` | Copy structure, headlines, hooks, conversion mechanics |
| `hook-engine` | Hook generation system for posts, emails, ads, video |
| `cold-email-doctrine` | 80-word cap, plain text, single CTA, personalised first-line methodology |
| `article-writing` | Long-form articles, guides, blog posts, newsletter issues |

### Content and Brand
| Skill | What it does |
|-------|-------------|
| `content-operating-system` | Science of content that spreads — STEPPS, virality mechanics |
| `content-engine` | Platform-native content systems for X, LinkedIn, TikTok, YouTube, newsletters |
| `brand-science` | Brand perception, memory, and market position — Ehrenberg-Bass research |
| `distribution-science` | Channel mix, owned vs rented media, algorithm mechanics |
| `attention-belief` | Cognitive architecture of attention — RAS filtering, pre-attentive processing |
| `social-media-graphics` | Social media carousel and graphic build pipeline |
| `instagram-carousel-builder` | End-to-end Instagram carousel build process — 7-slide architecture |

### Marketing Execution
| Skill | What it does |
|-------|-------------|
| `market-copy` | Website copy audit and rewrite |
| `market-emails` | Email sequence design and copywriting |
| `market-ads` | Paid ad copy — Meta, Google, LinkedIn |
| `market-social` | Social media content strategy and execution |
| `market-landing` | Landing page CRO analysis and copy |
| `market-funnel` | Lead funnel design — lead magnet to conversion |
| `market-research` | Market sizing, trend analysis, industry research |
| `market-competitors` | Competitor analysis, positioning gaps, differentiation |
| `market-audit` | Full marketing audit — 5 parallel sub-analyses, unified report |
| `market-brand` | Brand voice guidelines from channel analysis |
| `market-launch` | Week-by-week product launch playbook |
| `market-proposal` | Client-ready marketing services proposal |
| `market-report` | Professionally formatted marketing report |
| `icp-matrix` | Ideal customer profile — segmentation, qualification, targeting |
| `competitive-intel` | Systematic competitor tracking — battlecards, win/loss, positioning |
| `contract-and-proposal-writer` | Contracts and proposals for services engagements |

### Strategy and Leadership
| Skill | What it does |
|-------|-------------|
| `decision-making` | Dalio, Buffett, Thiel, Munger, Musk, Grove decision frameworks |
| `offer-acquisition` | Offer design, pricing, lead magnet, acquisition systems |
| `founder-coach` | Founder-level strategic coaching and decision support |
| `coo-advisor` | Operations leadership — process design, OKRs, scaling playbooks |
| `cro-advisor` | Revenue leadership — forecasting, pricing, NRR, sales model design |
| `cmo-advisor` | Marketing leadership — brand positioning, growth model, channel mix |
| `operator-frameworks` | Musk 5-Step, Grove Manager Output, Bezos Leadership Principles |
| `wealth-leverage` | Naval leverage equation, 4 leverage types, Horowitz CEO principles |
| `growth-product` | Graham startup growth, default alive, do things that don't scale |
| `scenario-war-room` | Multi-variable compound scenario modelling |

### Research and Automation
| Skill | What it does |
|-------|-------------|
| `deep-research` | Multi-source research methodology — cited synthesis reports |
| `exa-search` | Live neural web search — current data, company profiles, people lookup |
| `revenue-operations` | CRM strategy, pipeline management, go-to-market efficiency |
| `windmill-build` | Windmill workflow automation — scripts, flows, schedules |
| `agentic-engineering` | Multi-agent system design, orchestration, model routing |

---

## Questions

Post in the **Born Builders** Skool community — [skool.com/born-builders-1445](https://skool.com/born-builders-1445)
