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

## The Pool (34 personas, grouped)

**Studio Leadership:** Game Director, Executive Producer, Product Owner, Company CEO

**Creative:** Art Director, Narrative Writer, Copy Editor, Sound Designer, VFX Artist, World Designer

**Design & Systems:** Game Design Lead, Balance Designer, UI/UX Designer, Tools Lead

**Engineering & Quality:** Engineering Lead, QA Lead, Release Manager

**Business & Investment:** Private Investor, Marketing Consultant

**Community & Audience:** Community Manager, Content Creator, Telemetry Analyst, Game Journalist

**Players:** Hardcore Fan, Genre Fan, Casual Gamer, External Playtester, Competitive Player, Speedrunner, Second-Run Player, Returning Player, Completionist

**Inner Circle:** Best Friend, Significant Other

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

## Standing Positions (Memory)

The skill maintains `.perseus/positions.md`, holding each persona's current stance on the project, carried across sessions. Personas load it on start (Phase 2) and reconcile it after delivering output (Phase 7): they hold, revise, or escalate a position rather than re-arguing settled ground. Rule is supersede, never append: one Active stance per persona per issue, and a concern raised session after session grows louder. Lives under the already-gitignored `.perseus/`.

## The Skill

Installs to `~/.claude/plugins/cache/local/perseus/1.0.0/`. User-editable config lives at:
- `~/.claude/perseus/papyrus.md`
- `~/.claude/perseus/manifesto.md`

When modifying the skill, update `claude-skill/skills/perseus/SKILL.md` in this repo. Commit and push, then re-run `install-skill.sh` to pick up changes (the installer pulls from GitHub).
