# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Yazi configuration directory. Yazi is a terminal file manager, and this repository contains user customizations for its behavior, appearance, and keybindings.

## Configuration Files

Yazi uses TOML configuration files with JSON schemas for validation:

- **keymap.toml** - Keyboard shortcuts and bindings
  - Currently defines custom keybindings in `[mgr]` section using `prepend_keymap`
  - Uses schema: `https://yazi-rs.github.io/schemas/keymap.json`

Expected standard files (may not exist yet):
- **yazi.toml** - General settings and behavior (schema: `https://yazi-rs.github.io/schemas/yazi.json`)
- **theme.toml** - Color schemes and visual appearance (schema: `https://yazi-rs.github.io/schemas/theme.json`)

## Keymap Configuration Structure

The `keymap.toml` file uses a specific pattern:

- Configuration is organized by context sections: `[mgr]` (manager mode), `[tasks]`, `[select]`, `[input]`, `[completion]`, `[help]`
- **prepend_keymap** - Adds keybindings with HIGH priority (executes before defaults)
- **append_keymap** - Adds keybindings with LOW priority (executes after defaults)
- **keymap** - Completely replaces default keybindings

Each keybinding entry has:
- `on` - Key combination (e.g., `"<C-t>"` for Ctrl+t)
- `run` - Command(s) to execute (string or array)
- `desc` - Description of the action

Key notation:
- `<C-x>` = Ctrl+x
- `<A-x>` = Alt+x
- `<S-x>` = Shift+x
- Modifiers can be combined: `<C-S-x>` = Ctrl+Shift+x

## Shell Command Syntax

Commands using `shell` have specific flags:
- `--block` - Blocks Yazi until command completes
- `--orphan` - Runs command independently of Yazi
- `--confirm` - Asks for confirmation before running

## Validation

Use a TOML linter like https://taplo.tamasfe.dev/ with the schema URLs to validate configuration files.
