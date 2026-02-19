#!/usr/bin/env bash
set -euo pipefail

echo "Applying accessibility visual settings (best effort)..."

ok=()
fail=()

set_pref() {
  local cmd="$1"
  local label="$2"
  if eval "$cmd" >/dev/null 2>&1; then
    ok+=("$label")
  else
    fail+=("$label")
  fi
}

# Visual simplification and border/contrast-like clarity
set_pref "defaults write com.apple.universalaccess reduceTransparency -bool true" "Reduce transparency"
set_pref "defaults write com.apple.universalaccess increaseContrast -bool true" "Increase contrast"
set_pref "defaults write com.apple.universalaccess reduceMotion -bool true" "Reduce motion"
set_pref "defaults write com.apple.universalaccess differentiateWithoutColor -bool true" "Differentiate without color"

killall SystemUIServer >/dev/null 2>&1 || true

echo ""
echo "Succeeded:"
for s in "${ok[@]:-}"; do
  echo " - $s"
done

echo ""
if [ ${#fail[@]} -gt 0 ]; then
  echo "Needs manual setup on this Mac:"
  for s in "${fail[@]}"; do
    echo " - $s"
  done
else
  echo "No manual fallback needed for the settings above."
fi

echo ""
echo "Set grayscale quick toggle (manual, one-time):"
echo "1. System Settings -> Accessibility -> Shortcut"
echo "2. Enable only Color Filters"
echo "3. System Settings -> Accessibility -> Display -> Color Filters"
echo "4. Turn on Color Filters and choose Grayscale"
echo "5. Toggle anytime with Option + Command + F5"

