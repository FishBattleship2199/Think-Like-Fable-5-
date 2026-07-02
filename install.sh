#!/bin/sh
# Installs the fable-mode skill for Claude Code.
# Usage: curl -fsSL https://raw.githubusercontent.com/FishBattleship2199/Think-Like-Fable-5-/main/install.sh | sh
set -e

RAW="https://raw.githubusercontent.com/FishBattleship2199/Think-Like-Fable-5-/main"
SKILL_DIR="$HOME/.claude/skills/fable-mode"
CLAUDE_MD="$HOME/.claude/CLAUDE.md"

echo "Installing fable-mode skill..."
mkdir -p "$SKILL_DIR"
curl -fsSL "$RAW/skills/fable-mode/SKILL.md" -o "$SKILL_DIR/SKILL.md"
echo "  -> $SKILL_DIR/SKILL.md"

# Add the auto-trigger to global CLAUDE.md (skip if already present)
if [ -f "$CLAUDE_MD" ] && grep -q "fable-mode" "$CLAUDE_MD"; then
  echo "  -> CLAUDE.md trigger already present, skipping"
else
  mkdir -p "$HOME/.claude"
  cat >> "$CLAUDE_MD" <<'EOF'

# fable-mode
- **fable-mode** (`~/.claude/skills/fable-mode/SKILL.md`) - problem-solving discipline modeled on Claude Fable 5. Trigger: `/fable-mode`
At the start of any non-trivial task (debugging, building, refactoring, research, multi-step analysis), invoke the Skill tool with `skill: "fable-mode"` and follow its discipline for the rest of the task. EXCEPTION: if you are powered by Fable 5 / Mythos 5 (check the model named in your system prompt), do NOT auto-invoke this skill — it is redundant for you. When the user explicitly types `/fable-mode`, invoke it regardless of model.
EOF
  echo "  -> added auto-trigger to $CLAUDE_MD"
fi

echo "Done. Start a new Claude Code session and the skill is active (or type /fable-mode)."
