#!/bin/fish

fenv source ~/.profile
# Set the cursor shapes for the different vi modes.
# Doesn't work for some reason.
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      underscore blink 

alias dfgit='/usr/bin/git --git-dir=$HOME/.cfg-git/ --work-tree=$HOME'
alias vi='/usr/bin/nvim'
alias sxiv='sxiv -b'
alias rng='ranger'
alias cli='xclip -sel clip'

