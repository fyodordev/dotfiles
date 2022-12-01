#!/bin/fish

fenv source ~/.profile
source ~/.config/fish/colors.fish

# Set the cursor shapes for the different vi modes.
# Doesn't work for some reason.
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      underscore blink 

set fish_greeting

# Set colors
# Refer to doc here: https://fishshell.com/docs/current/index.html#variables-color
# The following variables are available to change the highlighting colors in fish:

# set fish_color_normal 000000 # the default color
# fish_color_command 000000 # the color for commands
# fish_color_quote 000000 # the color for quoted blocks of text
# fish_color_redirection 000000 # the color for IO redirections
# fish_color_end 000000 # the color for process separators like ';' and '&'
# fish_color_error 000000 # the color used to highlight potential errors
# fish_color_param 000000 # the color for regular command parameters
# fish_color_comment 000000 # the color used for code comments
# fish_color_match 000000 # the color used to highlight matching parenthesis
# fish_color_selection 000000 # the color used when selecting text (in vi visual mode)
# fish_color_search_match 000000 # used to highlight history search matches and the selected pager item (must be a background)
# fish_color_operator 000000 # the color for parameter expansion operators like '*' and '~'
# fish_color_escape 000000 # the color used to highlight character escapes like '\n' and '\x70'
# fish_color_cwd 000000 # the color used for the current working directory in the default prompt
# fish_color_autosuggestion 000000 # the color used for autosuggestions
# fish_color_user 000000 # the color used to print the current username in some of fish default prompts
# fish_color_host 000000 # the color used to print the current host system in some of fish default prompts
# fish_color_cancel 000000 # the color for the '^C' indicator on a canceled command

# Additionally, the following variables are available to change the highlighting in the completion pager:
# fish_pager_color_prefix 000000 # the color of the prefix string, i.e. the string that is to be completed
# fish_pager_color_completion 000000 # the color of the completion itself
# fish_pager_color_description 000000 # the color of the completion description
# fish_pager_color_progress 000000 # the color of the progress bar at the bottom left corner
# fish_pager_color_secondary 000000 # the background color of the every second completion


alias dfgit='/usr/bin/git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'
alias vi='/usr/bin/nvim'
alias sxiv='sxiv -b'
alias m='neomutt'
alias r='ranger'
alias c='code .'
alias q='exit'
alias cli='xclip -sel clip'
alias r='ranger'
alias f='lfrun'


pyenv init - | source


