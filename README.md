# macOS Minimal Setup

Reproducible scripts for a clean, minimalist Mac setup.
A practical, plain-English setup to make macOS feel clean and minimal using mostly native settings/tools, with Raycast as an optional add-on.


## What this includes

- Baseline setup that applies almost everything in one run
- Accessibility visual defaults (contrast/transparency/motion) + grayscale shortcut setup notes
- Black wallpaper
- Dock running-only mode
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

Baseline applies:

- Screenshot save location to `~/Downloads/screenshots`
- Menu bar auto-hide enabled
- Dock defaults:
  - auto-hide on
  - magnification off
  - minimize effect set to `scale`
  - app launch animation off
  - recent apps off
  - running-app indicator dots off
  - dock size set to `64`
- Finder defaults:
  - list view preferred
  - path bar shown
  - file extensions shown
- Accessibility visuals via `05-accessibility-visuals.sh`
- Black wallpaper via `03-set-black-wallpaper.sh`
- Dock running-only mode via `02-dock-running-only.sh`

Baseline does **not** apply:

- Raycast install (use script 04)
- any custom launcher folder/alias/icon system

### 2) Make Dock show running apps only

```bash
./scripts/02-dock-running-only.sh
```

### 3) Set black wallpaper

```bash
./scripts/03-set-black-wallpaper.sh
```

### 4) Install Raycast

```bash
./scripts/04-install-raycast.sh
```

### 5) Apply accessibility visual settings (and set up grayscale toggle)

```bash
./scripts/05-accessibility-visuals.sh
```

### Undo Dock changes

Undo Dock changes by running:

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
