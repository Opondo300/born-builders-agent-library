#!/usr/bin/env bash
# Born Builders — Agent & Skill Library Installer
# Copies agents and skills into your Claude Code global config.
# Safe: uses --no-clobber so existing files are never overwritten.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
AGENTS_SRC="$SCRIPT_DIR/agents"
SKILLS_SRC="$SCRIPT_DIR/skills"
AGENTS_DEST="$CLAUDE_DIR/agents"
SKILLS_DEST="$CLAUDE_DIR/skills"

# ── Preflight ──────────────────────────────────────────────────────────────────

if [ ! -d "$CLAUDE_DIR" ]; then
  echo "❌  ~/.claude not found. Install Claude Code first: https://claude.ai/code"
  exit 1
fi

echo "Born Builders — Agent & Skill Library"
echo "Installing to: $CLAUDE_DIR"
echo ""

# ── Agents ────────────────────────────────────────────────────────────────────

mkdir -p "$AGENTS_DEST"

AGENTS_INSTALLED=0
AGENTS_SKIPPED=0

for file in "$AGENTS_SRC"/*.md; do
  name=$(basename "$file")
  if [ -f "$AGENTS_DEST/$name" ]; then
    echo "  ⏭  $name (already exists — skipped)"
    ((AGENTS_SKIPPED++))
  else
    cp "$file" "$AGENTS_DEST/$name"
    echo "  ✅  $name"
    ((AGENTS_INSTALLED++))
  fi
done

echo ""
echo "Agents: $AGENTS_INSTALLED installed, $AGENTS_SKIPPED skipped"

# ── Skills ────────────────────────────────────────────────────────────────────

mkdir -p "$SKILLS_DEST"

SKILLS_INSTALLED=0
SKILLS_SKIPPED=0

for dir in "$SKILLS_SRC"/*/; do
  name=$(basename "$dir")
  if [ -d "$SKILLS_DEST/$name" ]; then
    echo "  ⏭  $name (already exists — skipped)"
    ((SKILLS_SKIPPED++))
  else
    cp -r "$dir" "$SKILLS_DEST/$name"
    echo "  ✅  $name"
    ((SKILLS_INSTALLED++))
  fi
done

echo ""
echo "Skills: $SKILLS_INSTALLED installed, $SKILLS_SKIPPED skipped"

# ── Done ──────────────────────────────────────────────────────────────────────

echo ""
echo "────────────────────────────────────────"
echo "Done. $AGENTS_INSTALLED agents + $SKILLS_INSTALLED skills installed."
echo ""
echo "Next step: restart Claude Code to load the new agents and skills."
echo ""
echo "To use an agent:  'Use the sales-outbound-strategist agent to...'"
echo "To use a skill:   'Use the persuasion-engine skill before writing...'"
echo ""
echo "Questions? Born Builders community: skool.com/born-builders-1445"
