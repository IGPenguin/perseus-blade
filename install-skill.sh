#!/bin/bash
# Installs the Perseus Blade /perseus skill into Claude Code.

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
PERSEUS_CONFIG="$HOME/.claude/perseus"

echo "⚔️  Installing Perseus Blade..."

# 1. Register the GitHub repo as a marketplace (idempotent)
if claude plugins marketplace list 2>/dev/null | grep -q "perseus-blade"; then
    claude plugins marketplace update perseus-blade 2>/dev/null || true
else
    claude plugins marketplace add IGPenguin/perseus-blade --scope user
fi

# 2. Install (or update) the perseus plugin
if claude plugins list 2>/dev/null | grep -q "perseus@perseus-blade"; then
    claude plugins update perseus@perseus-blade 2>/dev/null || true
else
    claude plugins install perseus@perseus-blade --scope user
fi

# 3. Copy user-editable config files
mkdir -p "$PERSEUS_CONFIG"
cp "$REPO_DIR/.perseus/papyrus.md" "$PERSEUS_CONFIG/papyrus.md"
cp "$REPO_DIR/.perseus/manifesto.md" "$PERSEUS_CONFIG/manifesto.md"

echo "✨ Done. Restart Claude Code, then type /perseus in any project."
