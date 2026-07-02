# Think Like Fable 5

A [Claude Code](https://claude.com/claude-code) skill that teaches Sonnet, Opus, and Haiku the problem-solving discipline of Claude Fable 5 — debug from evidence, verify before claiming done, scope ruthlessly, and finish the job.

It can't transfer Fable's raw reasoning depth, but most day-to-day quality comes from *habits*, not intelligence. This skill encodes those habits:

- **Understand before acting** — read the real code before forming a theory
- **Scope ruthlessly** — smallest change that fully solves the problem, no drive-by refactors
- **Debug from evidence** — hypothesis → verify → fix → re-run, never pattern-match diagnosis
- **Verify every claim** — never say "done" without running it and watching it work
- **Finish the turn** — don't stop at a plan; do the work
- **Lead with the answer** — first sentence is the outcome, detail after
- **Know your limits** — check API signatures before using them, keep checklists, compute with tools
- **Get unstuck** — two failed attempts means zoom out and re-derive, not retry a third time

The skill automatically steps aside when Fable 5 or Mythos 5 is the active model — these habits are already native to it.

## Install

1. Copy the skill into your Claude Code skills directory:

   ```bash
   mkdir -p ~/.claude/skills/fable-mode
   curl -o ~/.claude/skills/fable-mode/SKILL.md \
     https://raw.githubusercontent.com/FishBattleship2199/Think-Like-Fable-5-/main/skills/fable-mode/SKILL.md
   ```

2. Add this auto-trigger to your global `~/.claude/CLAUDE.md` so models load it without being asked:

   ```markdown
   # fable-mode
   - **fable-mode** (`~/.claude/skills/fable-mode/SKILL.md`) - problem-solving discipline modeled on Claude Fable 5. Trigger: `/fable-mode`
   At the start of any non-trivial task (debugging, building, refactoring, research, multi-step analysis), invoke the Skill tool with `skill: "fable-mode"` and follow its discipline for the rest of the task. EXCEPTION: if you are powered by Fable 5 / Mythos 5 (check the model named in your system prompt), do NOT auto-invoke this skill — it is redundant for you. When the user explicitly types `/fable-mode`, invoke it regardless of model.
   ```

3. Done. Start a new Claude Code session; on any non-trivial task the model loads the skill automatically. You can also invoke it manually anytime with `/fable-mode`.

## Using it outside Claude Code

The skill mechanism is Claude Code-only, but the advice is model-agnostic. [`SYSTEM_PROMPT.md`](SYSTEM_PROMPT.md) is a generic version with the Claude-specific parts removed — paste it into:

- **Gemini CLI** → `GEMINI.md`
- **Codex CLI** → `AGENTS.md`
- **Cursor** → Rules / `.cursorrules`
- **Ollama / local models** → system prompt or Modelfile `SYSTEM` block

Note: smaller models follow long instruction lists less reliably — for those, trim it to the handful of rules that matter most to you.

## License

MIT
