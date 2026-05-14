<p align="center">
  <img src="assets/header.svg" width="100%" alt="Perseus Blade Header">
</p>

## ⚔️ Your virtual AAA studio, assembled to slay

**Perseus Blade** is a Claude Code skill that summons a virtual strike team to review your work - code, features, [Hades Gate](https://github.com/IGPenguin/hades-gate) proposals, [Styx Flow](https://github.com/IGPenguin/styx-flow) tasks, UI, art... Each voice speaks in their authentic stereotype.

---

## ⚡ Claude Code - Skill

The Assembler lives natively inside Claude Code as a `/perseus` skill.

No API keys, no config per project. Install once, invoke from any session.

### Setup

```bash
git clone https://github.com/your-repo/perseus-blade.git
cd perseus-blade
./install-skill.sh
```

Restart Claude Code. That's it.

### Usage

Type `/perseus` in any [Claude Code](https://claude.com/product/claude-code) session. The Assembler will:
1. Read your project's `CLAUDE.md` (critical for the Hardcore Fan persona)
2. Ask what to review, or take a paste/file directly
3. Propose the right strike team for the job, you confirm or swap
4. Deliver feedback in the right mode

### Modes

| Mode | When | Output |
| :--- | :--- | :--- |
| **Direct** | Quick raw reaction | One-liner per persona, straight to CLI |
| **Inline** | Code, Hades paths, Styx tasks | Comments inserted in context with `[ROLE]:` prefix |
| **Review** | Feature proposals, systems, designs | Structured sections per persona with hot take, reasoning, suggestions |
| **Meeting** | Open debate, creative direction | Roundtable discussion, action items, verdict |

Mode is auto-suggested based on context. Name it explicitly to skip the suggestion.

### The Pool

| Persona | Domain | Tone
| :--- | :--- | :--- |
| Game Director | Vision, coherence, what belongs | *"This doesn't belong in our game. Cut it."* |
| Producer | Scope, timeline, reality check | *"How long does this actually take? The real number."* |
| Engineer | Architecture, debt, implementation risk | *"That'll be a nightmare to maintain."* |
| Game Desiger | Systems, feedback loops, balance | *"The player has no signal their choice mattered."* |
| Art Director | Style coherence, visual identity | *"Players will read it as a bug."* |
| Narrative Writer | Tone, character voice, world coherence | *"This character would never say that."* |
| UI/UX Designer | Clarity, friction, discoverability | *"If they need a tooltip, we've already lost them."* |
| Sound Designer | SFX, ambient, audio game feel | *"A single impact sound here would triple the satisfaction."* |
| Tools Engineer | Pipeline, dev velocity, tooling gaps | *"We'll spend two weeks building tools before we can test it."* |
| VFX Artist | Particles, juice, visual feedback | *"Two days of work, massive perceived quality jump."* |
| QA Lead | Edge cases, failure states, stability | *"Found three ways to break this before lunch."* |
| Telemetry Analyst | Player behavior patterns, data | *"The engagement data on features like this is brutal."* |
| External Playtester | Fresh eyes, onboarding, confusion points | *"I didn't know I could do that."* |
| Hardcore Fan | THIS specific project, its soul | *"Players who love this game for X will feel betrayed."* |
| Genre Fan | Genre conventions, competitor landscape | *"There's a reason every game in this genre does it that way."* |
| Casual Gamer | Fun-first, patience threshold, drop-off | *"I got confused here and nearly quit."* |

### History

Every `/perseus` session saves to `.perseus/YYYY-MM-DD-HHMM-slug.md`: mode, strike team, target, full output.

The skill adds `.perseus/` to your `.gitignore` automatically on first use.

### Tweaking

| File | Purpose |
| :--- | :--- |
| `~/.claude/perseus/manifesto.md` | Persona pool, stereotypes, domains, strike team logic |
| `~/.claude/perseus/papyrus.md` | Output format for each mode |

---

## 🔗 Related

- 🔥 **[Hades Gate](https://github.com/IGPenguin/hades-gate)** - Claude Skill: Feature outline to deep orthogonal analysis (`/hades`)
- 🌊 **[Styx Flow](https://github.com/IGPenguin/styx-flow)** - Claude Skill: Raw note chaos to prioritized task backlog (`/styx`)

---

## 📄 License

MIT, see [LICENSE.md](LICENSE.md)
