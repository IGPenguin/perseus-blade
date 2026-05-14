# TODOs

## Plugin Distribution

- [ ] Create `IGPenguin/claude-plugins` personal marketplace repo with `marketplace.json` listing hades, styx, and perseus
- [ ] Add GitHub Action to each of hades-gate, styx-flow, and perseus-blade that auto-updates the marketplace repo on release tag — bumps `ref` and `sha` in `marketplace.json`, then commits or opens a PR to `IGPenguin/claude-plugins`
- [ ] Update install scripts in all three repos to use `claude plugins marketplace add IGPenguin/claude-plugins` + `claude plugins install <name>` instead of the current JSON hack
