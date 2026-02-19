# macOS Minimal Setup

Reproducible scripts for a clean, minimalist Mac setup.

## What this includes

- Minimal UI defaults (Dock behavior, Finder defaults, screenshot location)
- Accessibility visual defaults (contrast/transparency/motion) + grayscale shortcut setup notes
- Optional black wallpaper
- Optional "Dock for running apps only"
- Optional Raycast install
- Dock rollback from latest backup

## Folder layout

- `scripts/01-apply-minimal-defaults.sh`
- `scripts/02-dock-running-only.sh`
- `scripts/03-set-black-wallpaper.sh`
- `scripts/04-install-raycast.sh`
- `scripts/05-accessibility-visuals.sh`
- `scripts/rollback-dock-latest.sh`

## Usage

Run from this folder:

```bash
cd macos-minimal-setup
chmod +x scripts/*.sh
```

### 1) Apply baseline minimalist settings

```bash
./scripts/01-apply-minimal-defaults.sh
```

### 2) (Optional) Make Dock show running apps only

```bash
./scripts/02-dock-running-only.sh
```

### 3) (Optional) Set black wallpaper

```bash
./scripts/03-set-black-wallpaper.sh
```

### 4) (Optional) Install Raycast

```bash
./scripts/04-install-raycast.sh
```

### 5) Apply accessibility visual settings (and set up grayscale toggle)

```bash
./scripts/05-accessibility-visuals.sh
```

### Roll back Dock

```bash
./scripts/rollback-dock-latest.sh
```

## Notes

- Dock-changing scripts create timestamped backups at:
  - `~/Downloads/dock-backups`
- Accessibility keys can vary by macOS version. The script applies what it can and prints any manual follow-up.
- Grayscale toggle setup (manual one-time):
  - `System Settings -> Accessibility -> Shortcut`
  - Enable only `Color Filters`
  - `System Settings -> Accessibility -> Display -> Color Filters`
  - Turn on `Color Filters`, choose `Grayscale`
  - Toggle anytime with `Option + Command + F5`
- If icon caching looks stale after Dock changes, run:

```bash
killall Dock Finder cfprefsd || true
```

## Share on GitHub

1. Create a new repo.
2. Copy this `macos-minimal-setup` folder into it.
3. Commit and push.
