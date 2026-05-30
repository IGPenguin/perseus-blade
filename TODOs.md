# TODOs

## Plugin Distribution

- [ ] Create `IGPenguin/claude-plugins` personal marketplace repo with `marketplace.json` listing hades, styx, and perseus
- [ ] Add GitHub Action to each of hades-gate, styx-flow, and perseus-blade that auto-updates the marketplace repo on release tag — bumps `ref` and `sha` in `marketplace.json`, then commits or opens a PR to `IGPenguin/claude-plugins`
- [ ] Update install scripts in all three repos to use `claude plugins marketplace add IGPenguin/claude-plugins` + `claude plugins install <name>` instead of the current JSON hack

## Perseus Continuity Layer

Builds on the standing-positions memory (Option C, shipped). Suggested sequence: E then D then B. One-time upgrade to lean on while closing Stay Dead to beta.

- [ ] **Readiness scorecard (Rift):** add `.perseus/readiness.md` with beta-launch gates (onboarding, content depth, stability, legibility, performance, first-impression), each gate owned by the persona whose domain covers it. Each session nudges gate scores off the standing positions and surfaces a headline readiness %. Touches SKILL.md (read + update), papyrus.md (scorecard schema), manifesto.md (gate-to-persona ownership map).
- [ ] **Standup mode (Echo):** add a fifth mode that reads the `.perseus/` session logs + `positions.md` and synthesizes recurring concerns, acted-on vs. ignored, and trend lines. Touches SKILL.md (Phase 4 mode row + Phase 6 generation), papyrus.md (Standup format).
- [ ] **Backlog handoff (Weave):** convert Meeting action items and "Needs Attention" entries into proposed Styx tasks appended to `TODOs.md` under a `## From Perseus` block (unscored, Styx owns scoring). Touches SKILL.md (handoff phase), papyrus.md (handoff block), manifesto.md (Codex boundary line).
