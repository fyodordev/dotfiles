#!/bin/fish
bass source ~/.profile

if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_vi_key_bindings

set -U fish_greeting

set fish_cursor_default     block      blink
set fish_cursor_insert      underscore blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      underscore blink
