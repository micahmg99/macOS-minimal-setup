#!/usr/bin/env bash
set -euo pipefail

BACKUP_DIR="$HOME/Downloads/dock-backups"

if [[ ! -d "$BACKUP_DIR" ]]; then
  echo "No backup folder found at $BACKUP_DIR"
  exit 1
fi

LATEST="$(ls -1t "$BACKUP_DIR"/com.apple.dock*.plist 2>/dev/null | head -n 1 || true)"

if [[ -z "$LATEST" ]]; then
  echo "No Dock backup plist found in $BACKUP_DIR"
  exit 1
fi

cp "$LATEST" "$HOME/Library/Preferences/com.apple.dock.plist"
killall Dock >/dev/null 2>&1 || true

echo "Restored Dock from: $LATEST"
