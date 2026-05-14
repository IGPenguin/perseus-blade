# CLAUDE.md

This file provides guidance to Claude Code when working with code in this repository.

## What This Is

**Perseus Blade** is a Claude Code skill that assembles a virtual AAA-experienced game dev studio as a strike team of expert personas. Each persona reviews work from their domain in their authentic stereotype voice — cutting through to what actually matters.

## Repo Structure

| Path | Purpose |
|------|---------|
| `claude-skill/skills/perseus/SKILL.md` | The `/perseus` skill definition |
| `install-skill.sh` | One-command installer |
| `.perseus/papyrus.md` | Output format for all four modes |
| `.perseus/manifesto.md` | Full persona pool, stereotypes, domain rules |

## The Pool (20 personas)

Engineering Lead, Game Design Lead, Game Director, UI/UX Designer, QA Lead, Narrative Writer, Tools Lead, Producer, Sound Designer, VFX Artist, Art Director, External Playtester, Hardcore Fan, Genre Fan, Casual Gamer, Telemetry Analyst, Release Manager, Marketing Consultant, Community Manager, Content Creator.

The Hardcore Fan is special: they speak about the specific project being reviewed, not games in general. They rely on CLAUDE.md in the target project.

## Output Modes

| Mode | Description |
|------|-------------|
| Direct | Raw one-liners to CLI |
| Inline | Comments inserted into target content |
| Review | Structured per-persona sections |
| Meeting | Roundtable discussion with action items |

## History Logging

Each `/perseus` session saves to `.perseus/YYYY-MM-DD-HHMM-slug.md` in the current working directory. The skill ensures `.perseus/` is gitignored on first use.

## The Skill

Installs to `~/.claude/plugins/cache/local/perseus/1.0.0/`. User-editable config lives at:
- `~/.claude/perseus/papyrus.md`
- `~/.claude/perseus/manifesto.md`

When modifying the skill, update `claude-skill/skills/perseus/SKILL.md` in this repo. Commit and push, then re-run `install-skill.sh` to pick up changes (the installer pulls from GitHub).
