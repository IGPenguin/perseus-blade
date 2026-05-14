#!/bin/bash
# Installs the Perseus Blade /perseus skill into Claude Code.

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
LOCAL_CACHE="$HOME/.claude/plugins/cache/local"
PERSEUS_CONFIG="$HOME/.claude/perseus"
PLUGINS_JSON="$HOME/.claude/plugins/installed_plugins.json"
SETTINGS_JSON="$HOME/.claude/settings.json"

# Resolve version from latest GitHub release, fall back to "beta"
GH_REPO="IGPenguin/perseus-blade"
VERSION=$(curl -fsSL "https://api.github.com/repos/$GH_REPO/releases/latest" 2>/dev/null \
    | python3 -c "import sys,json; print(json.load(sys.stdin)['tag_name'].lstrip('v'))" 2>/dev/null \
    || echo "beta")

PLUGIN_CACHE="$LOCAL_CACHE/perseus/$VERSION"

echo "⚔️  Installing Perseus Blade skill (v$VERSION)..."

# 1. Copy plugin files into Claude's local plugin cache
mkdir -p "$PLUGIN_CACHE/skills/perseus"
mkdir -p "$PLUGIN_CACHE/.claude-plugin"
cp "$REPO_DIR/claude-skill/skills/perseus/SKILL.md" "$PLUGIN_CACHE/skills/perseus/SKILL.md"

cat > "$PLUGIN_CACHE/.claude-plugin/plugin.json" << PLUGINJSON
{
  "name": "perseus",
  "version": "$VERSION",
  "description": "Perseus Blade — virtual AAA studio that slices through your gamedev with 16 expert persona voices",
  "author": { "name": "Adam Svoboda", "email": "eidamsvoboda@gmail.com" }
}
PLUGINJSON

# 2. Copy user-editable config files
mkdir -p "$PERSEUS_CONFIG"
cp "$REPO_DIR/.perseus/papyrus.md" "$PERSEUS_CONFIG/papyrus.md"
cp "$REPO_DIR/.perseus/manifesto.md" "$PERSEUS_CONFIG/manifesto.md"

# 3. Ensure the 'local' marketplace exists so Claude Code can resolve @local plugins.
#    Without this, plugins fail with: "Plugin not found in marketplace local".
mkdir -p "$LOCAL_CACHE/.claude-plugin"
cat > "$LOCAL_CACHE/.claude-plugin/marketplace.json" << 'MPJSON'
{
  "$schema": "https://anthropic.com/claude-code/marketplace.schema.json",
  "name": "local",
  "description": "Locally installed plugins",
  "owner": { "name": "Adam Svoboda", "email": "eidamsvoboda@gmail.com" },
  "plugins": []
}
MPJSON

if claude plugins marketplace list 2>/dev/null | grep -q "❯ local"; then
    claude plugins marketplace update local 2>/dev/null || true
else
    claude plugins marketplace add "$LOCAL_CACHE"
fi

# 4. Register the plugin in Claude's internal JSON state
python3 - "$PLUGIN_CACHE" "$VERSION" "$PLUGINS_JSON" "$SETTINGS_JSON" << 'EOF'
import json, sys
from datetime import datetime, timezone

install_path, version, plugins_json, settings_json = sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4]

try:
    with open(plugins_json) as f:
        data = json.load(f)
except (FileNotFoundError, json.JSONDecodeError):
    data = {"version": 2, "plugins": {}}

now = datetime.now(timezone.utc).strftime('%Y-%m-%dT%H:%M:%S.000Z')
existing = data.setdefault('plugins', {}).get('perseus@local', [{}])[0]
data['plugins']['perseus@local'] = [{
    'scope': 'user',
    'installPath': install_path,
    'version': version,
    'installedAt': existing.get('installedAt', now),
    'lastUpdated': now
}]

with open(plugins_json, 'w') as f:
    json.dump(data, f, indent=2)

try:
    with open(settings_json) as f:
        settings = json.load(f)
except (FileNotFoundError, json.JSONDecodeError):
    settings = {}

settings.setdefault('enabledPlugins', {})['perseus@local'] = True

with open(settings_json, 'w') as f:
    json.dump(settings, f, indent=2)
EOF

echo "✨ Done. Restart Claude Code, then type /perseus in any project."
