<p align="center">
  <img src="assets/header.svg" width="100%" alt="Perseus Blade Header">
</p>

## ⚔️ Your virtual AAA studio, assembled to slay

**Perseus Blade** is a Claude Code skill that summons a virtual strike team to review your game project - code, art, features, 🔥 **[Hades Gate](https://github.com/IGPenguin/hades-gate)** proposals or 🌊 **[Styx Flow](https://github.com/IGPenguin/styx-flow)** tasks. Each voice speaks in their authentic stereotype.

---

## ⚡ Claude Code - Skill

Perseus Blade lives natively inside Claude Code as a `/perseus` skill. No API keys, no config per project. Install once, invoke from any session.

### Usage

Type `/perseus` in any [Claude Code](https://claude.com/product/claude-code) session. The Assembler will:
1. Read your project's `CLAUDE.md` (critical for the Hardcore Fan persona)
2. Ask what to review, or take a paste/file directly
3. Propose the right strike team for the job, you confirm or swap
4. Deliver feedback in the right mode

### Operation Modes

Mode is auto-suggested based on context. Name it explicitly to skip the suggestion.

| Mode | When | Output |
| :--- | :--- | :--- |
| **Direct** | Quick raw reaction | One-liner per persona, straight to CLI |
| **Inline** | Code, Hades paths, Styx tasks | Comments inserted in context with `[ROLE]:` prefix |
| **Review** | Feature proposals, systems, designs | Structured sections per persona with hot take, reasoning, suggestions |
| **Meeting** | Open debate, creative direction | Roundtable discussion, action items, verdict |

### Virtual Personas

#### Studio Leadership
| Persona | Domain | Tone |
| :--- | :--- | :--- |
| Game Director | Vision, coherence, what belongs | *"This doesn't belong in our game. Cut it."* |
| Executive Producer | Scope, timeline, impossible calls | *"Every option here costs something real. Here's which one we survive."* |
| Product Owner | Backlog, priorities, what ships vs. what waits | *"What metric does this move?"* |
| Company CEO | Brand, strategy, calls no one else will make | *"This isn't a design question anymore. Here's the call."* |

#### Creative
| Persona | Domain | Tone |
| :--- | :--- | :--- |
| Art Director | Style coherence, visual identity | *"Players will read it as a bug."* |
| Narrative Writer | Tone, character voice, story coherence | *"This character would never say that."* |
| Sound Designer | SFX, ambient, audio game feel | *"A single impact sound here would triple the satisfaction."* |
| VFX Artist | Particles, juice, visual feedback | *"Two days of work, massive perceived quality jump."* |
| World Designer | World-building, lore, environmental storytelling | *"This area doesn't exist for a reason. What happened here?"* |

#### Design & Systems
| Persona | Domain | Tone |
| :--- | :--- | :--- |
| Game Design Lead | Systems, feedback loops, player agency | *"The player has no signal their choice mattered."* |
| Balance Designer | Stat curves, formulas, numerical outlier detection | *"The curve breaks at level 12. Here's the adjusted formula."* |
| UI/UX Designer | Clarity, friction, discoverability | *"If they need a tooltip, we've already lost them."* |
| Tools Lead | Pipeline, dev velocity, tooling gaps | *"We'll spend two weeks building tools before we can test it."* |

#### Engineering & Quality
| Persona | Domain | Tone |
| :--- | :--- | :--- |
| Engineering Lead | Architecture, debt, implementation risk | *"That'll be a nightmare to maintain."* |
| QA Lead | Edge cases, failure states, stability | *"Found three ways to break this before lunch."* |
| Release Manager | Platform cert, launch windows, hotfix readiness | *"This can't ship until that's resolved. Cert is in three days."* |

#### Business & Investment
| Persona | Domain | Tone |
| :--- | :--- | :--- |
| Private Investor | ROI, market viability, risk, returns | *"What's the addressable market and why does this team capture it?"* |
| Marketing Consultant | Positioning, hooks, what sells to strangers | *"Nobody outside this room knows why they should care."* |

#### Community & Audience
| Persona | Domain | Tone |
| :--- | :--- | :--- |
| Community Manager | Player sentiment, PR risk, how it lands publicly | *"This is going to be a screenshot with no context."* |
| Content Creator | Watchability, clip potential, fun to watch vs. play | *"Dead for three minutes. A viewer skips."* |
| Telemetry Analyst | Player behavior patterns, drop-off data | *"The engagement data on features like this is brutal."* |
| Game Journalist | Press reception, review framing, score potential | *"I'd give this a 7. Here's the headline."* |

#### Players
| Persona | Domain | Tone |
| :--- | :--- | :--- |
| Hardcore Fan | THIS specific project, its soul | *"Players who love this game for X will feel betrayed."* |
| Genre Fan | Genre conventions, competitor landscape | *"There's a reason every game in this genre does it that way."* |
| Casual Gamer | Fun-first, patience threshold, drop-off | *"I got confused here and nearly quit."* |
| External Playtester | Fresh eyes, onboarding, confusion points | *"I didn't know I could do that."* |
| Competitive Player | Meta optimization, dominant strategies, exploits | *"Your leaderboard meta will converge on this build within a week."* |
| Speedrunner | Sequence breaks, skips, routing exploits | *"There's a sequence break here. You skip the entire third act."* |

#### Inner Circle
| Persona | Domain | Tone |
| :--- | :--- | :--- |
| Best Friend | Creator blind spots, honest emotional truth | *"The part you're most proud of is the part that lost me."* |
| Significant Other | Human cost of making this, creator psychological state | *"You've said this is almost done for six months. What does done mean to you?"* |

### History

Every `/perseus` session saves to `.perseus/YYYY-MM-DD-HHMM-slug.md`: mode, strike team, target, full output.

The skill adds `.perseus/` to your `.gitignore` automatically on first use.

### Tweaking

| File | Purpose |
| :--- | :--- |
| `~/.claude/perseus/manifesto.md` | Persona pool, stereotypes, domains, strike team logic |
| `~/.claude/perseus/papyrus.md` | Output format for each mode |

### Setup

```bash
git clone https://github.com/your-repo/perseus-blade.git
cd perseus-blade
./install-skill.sh
```

Then restart Claude Code.

### Updating

```bash
git pull && ./install-skill.sh
```

And restart Claude Code.

---

## 🔗 Related

- 🔥 **[Hades Gate](https://github.com/IGPenguin/hades-gate)** - Claude Skill: Turn feature drafts into a deep orthogonal analysis (`/hades`)
- 🌊 **[Styx Flow](https://github.com/IGPenguin/styx-flow)** - Claude Skill: Turn raw notes into a prioritized backlog (`/styx`)

