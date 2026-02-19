#!/usr/bin/env bash
set -euo pipefail

BACKUP_DIR="$HOME/Downloads/dock-backups"
TS="$(date +%Y%m%d-%H%M%S)"
BACKUP_FILE="$BACKUP_DIR/com.apple.dock.running-only.$TS.plist"
mkdir -p "$BACKUP_DIR"
cp "$HOME/Library/Preferences/com.apple.dock.plist" "$BACKUP_FILE"

echo "Backup saved: $BACKUP_FILE"
echo "Setting Dock to running-apps-only (clearing pinned apps)..."

python3 - <<'PY'
import plistlib, os
p = os.path.expanduser('~/Library/Preferences/com.apple.dock.plist')
with open(p, 'rb') as f:
    d = plistlib.load(f)
d['persistent-apps'] = []
with open(p, 'wb') as f:
    plistlib.dump(d, f)
print('Updated persistent-apps to empty list.')
PY

killall Dock >/dev/null 2>&1 || true

echo "Done. Dock now shows running apps only."
