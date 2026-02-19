#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Applying baseline minimalist defaults..."

# Screenshot destination
mkdir -p "$HOME/Downloads/screenshots"
defaults write com.apple.screencapture location "$HOME/Downloads/screenshots"

# Menu bar
defaults write NSGlobalDomain _HIHideMenuBar -bool true

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock magnification -bool false
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock show-process-indicators -bool false
defaults write com.apple.dock tilesize -int 64

# Finder
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder ShowPathbar -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

killall SystemUIServer >/dev/null 2>&1 || true
killall Finder >/dev/null 2>&1 || true
killall Dock >/dev/null 2>&1 || true

echo "Applying accessibility visuals..."
"$SCRIPT_DIR/05-accessibility-visuals.sh"

echo "Setting black wallpaper..."
"$SCRIPT_DIR/03-set-black-wallpaper.sh"

echo "Setting Dock to running-apps-only..."
"$SCRIPT_DIR/02-dock-running-only.sh"

echo "Done. Baseline applied (everything except Raycast install)."
