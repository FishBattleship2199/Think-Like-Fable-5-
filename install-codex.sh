#!/bin/sh
# Installs the fable-mode discipline for OpenAI Codex CLI.
# Codex has no skills system; it reads global instructions from ~/.codex/AGENTS.md,
# so this appends the model-agnostic version of the skill there.
# Usage: curl -fsSL https://raw.githubusercontent.com/FishBattleship2199/Think-Like-Fable-5-/main/install-codex.sh | sh
set -e

RAW="https://raw.githubusercontent.com/FishBattleship2199/Think-Like-Fable-5-/main"
CODEX_MD="$HOME/.codex/AGENTS.md"
MARKER="<!-- fable-mode -->"

echo "Installing fable-mode discipline for Codex CLI..."

if [ -f "$CODEX_MD" ] && grep -q "$MARKER" "$CODEX_MD"; then
  echo "  -> fable-mode already present in $CODEX_MD, skipping"
else
  mkdir -p "$HOME/.codex"
  {
    echo ""
    echo "$MARKER"
    echo "# Problem-solving discipline (fable-mode)"
    # Strip the human-facing preamble above the first --- separator
    curl -fsSL "$RAW/SYSTEM_PROMPT.md" | awk 'found; /^---$/{found=1}'
    echo "$MARKER"
  } >> "$CODEX_MD"
  echo "  -> appended to $CODEX_MD"
fi

echo "Done. New Codex sessions will follow the fable-mode discipline."
echo "To uninstall, delete the block between the $MARKER markers in $CODEX_MD."
