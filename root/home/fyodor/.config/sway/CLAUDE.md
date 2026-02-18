# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Sway window manager configuration directory for a multi-monitor setup. Sway is a tiling Wayland compositor and i3-compatible window manager.

## Architecture

### Configuration Structure

- **Main config file**: `config` - The primary Sway configuration file
- **Modular configs**: `config.d/` directory containing:
  - `colors.conf` - Color scheme variables and theme definitions
  - `bg.conf` - Background wallpaper settings for each output

The main config includes all files from `config.d/` via: `include ~/.config/sway/config.d/*`

### Multi-Monitor Setup

Three displays configured in config:16-18:
- `HDMI-A-1`: 1920x1080@60Hz, portrait mode (270° rotation), leftmost position
- `DP-3`: 2560x1440@144Hz, primary center display
- `DP-2`: 1920x1080@120Hz, portrait mode (90° rotation), rightmost position

### Key Bindings Philosophy

- Primary modifier: `$mod` (Super/Windows key)
- Secondary modifier: `$mod2` (Alt)
- Vim-style directional keys: h/j/k/l
- Arrow keys also supported for all directional commands

### Custom Workspace Scripts

Referenced scripts in `~/.scripts/`:
- `new-sway-workspace` - Creates a new workspace (bound to $mod+n)
- `moveto-new-sway-workspace` - Moves current window to new workspace ($mod+Shift+n)
- `sway-copy-window` - Copy window to clipboard-like buffer ($mod+y)
- `sway-paste-window` - Paste window from buffer ($mod+p)

These scripts implement a unique "yank/paste" workflow for windows, similar to vim's copy/paste paradigm.

## Common Commands

### Testing Configuration

```bash
# Validate config syntax without reloading
sway --validate

# Reload configuration (from within Sway)
swaymsg reload
```

### Query Current State

```bash
# List all outputs and their configuration
swaymsg -t get_outputs

# List all workspaces
swaymsg -t get_workspaces

# Get current window tree
swaymsg -t get_tree

# List all input devices
swaymsg -t get_inputs
```

### Modifying Configuration

When editing the config, changes take effect after reload. To test a single command without editing the config:

```bash
swaymsg <command>
# Example: swaymsg output DP-3 mode 2560x1440@120Hz
```

### Working with Custom Scripts

The configuration depends on helper scripts in `~/.scripts/`. When modifying window management behavior, check these scripts as they extend Sway's native functionality.

## Color Scheme

Color variables are defined in `config.d/colors.conf` and used throughout the main config for:
- Window borders (active, inactive, focused_inactive, urgent)
- Uses a blue/cyan accent scheme with distinct active borders (#98d3f5)
- Semantic color names follow Gruvbox-inspired palette

To modify the color scheme, edit `colors.conf` and reload the config.

## Important Configuration Details

- **Window decorations**: Pixel borders only (2px), no title bars (config:259)
- **Gaps**: Smart gaps/borders enabled - gaps only appear when multiple windows visible
- **Terminal**: Default terminal is `foot`, alternate is `alacritty`
- **Launcher**: Using `wofi` for application launching (Super key release)
- **Screenshot**: `grimshot` bound to $mod+Shift+s
- **Status bars**: Two waybar instances (top and bottom), hidden by default, shown with Alt modifier
- **Keyboard layout**: US with altgr-intl variant
- **Mouse acceleration**: Disabled (flat profile)

## Systemd Integration

The config starts a systemd user target `sway-session.target` on launch, which can be used to manage services that should run within the Sway session.
