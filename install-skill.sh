#!/bin/bash
# Installs the Perseus Blade /perseus skill into Claude Code.

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
PLUGIN_CACHE="$HOME/.claude/plugins/cache/local/perseus/1.0.0"
PERSEUS_CONFIG="$HOME/.claude/perseus"
PLUGINS_JSON="$HOME/.claude/plugins/installed_plugins.json"

echo "⚔️  Installing Perseus Blade skill..."

mkdir -p "$PLUGIN_CACHE/skills/perseus"
mkdir -p "$PLUGIN_CACHE/.claude-plugin"
mkdir -p "$PERSEUS_CONFIG"

cp "$REPO_DIR/claude-skill/skills/perseus/SKILL.md" "$PLUGIN_CACHE/skills/perseus/SKILL.md"

cat > "$PLUGIN_CACHE/.claude-plugin/plugin.json" << 'PLUGINJSON'
{
  "name": "perseus",
  "description": "Perseus Blade — virtual AAA studio that slices through your gamedev with 16 expert persona voices",
  "author": {
    "name": "Adam Svoboda",
    "email": "eidamsvoboda@gmail.com"
  }
}
PLUGINJSON

cp "$REPO_DIR/.perseus/papyrus.md" "$PERSEUS_CONFIG/papyrus.md"
cp "$REPO_DIR/.perseus/manifesto.md" "$PERSEUS_CONFIG/manifesto.md"

SETTINGS_JSON="$HOME/.claude/settings.json"

python3 - "$PLUGIN_CACHE" "$PLUGINS_JSON" "$SETTINGS_JSON" << 'EOF'
import json, os, sys
from datetime import datetime, timezone

install_path = sys.argv[1]
plugins_json = sys.argv[2]
settings_json = sys.argv[3]

with open(plugins_json) as f:
    data = json.load(f)

now = datetime.now(timezone.utc).strftime('%Y-%m-%dT%H:%M:%S.000Z')
data['plugins']['perseus@local'] = [{
    'scope': 'user',
    'installPath': install_path,
    'version': '1.0.0',
    'installedAt': now,
    'lastUpdated': now
}]

with open(plugins_json, 'w') as f:
    json.dump(data, f, indent=2)

with open(settings_json) as f:
    settings = json.load(f)

settings.setdefault('enabledPlugins', {})['perseus@local'] = True

with open(settings_json, 'w') as f:
    json.dump(settings, f, indent=2)
EOF

echo "✨ Done. Restart Claude Code, then type /perseus in any project."
