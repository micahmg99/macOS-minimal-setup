#!/usr/bin/env bash
set -euo pipefail

CANDIDATES=(
  "/System/Library/Desktop Pictures/Solid Colors/Black.png"
  "/System/Library/Desktop Pictures/Solid Colors/Black.heic"
)

IMG=""
for p in "${CANDIDATES[@]}"; do
  if [[ -f "$p" ]]; then
    IMG="$p"
    break
  fi
done

if [[ -z "$IMG" ]]; then
  echo "No built-in black wallpaper found."
  exit 1
fi

osascript <<OSA
tell application "System Events"
  tell every desktop
    set picture to "$IMG"
  end tell
end tell
OSA

echo "Wallpaper set to: $IMG"
