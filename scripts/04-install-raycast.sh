#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Install Homebrew first: https://brew.sh"
  exit 1
fi

brew install --cask raycast
open /Applications/Raycast.app

echo "Raycast installed and launched."
