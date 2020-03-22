#!/bin/fish

# Terminal colors
set foreground    F9F5ED
set background    0d1926

set grey_darkest  1C252E
set grey_dark     4A535C 
set grey_light    9CAAB8
set grey_lightest CEDCEA
set red           EF1C86
set red_light     EF53A1
set green         86EF1C
set green_light   A1EF53
set yellow        FF9328
set yellow_light  FFA54C
set blue          499DF2
set blue_light    6DB0F2
set magenta       7C39BF
set magenta_light 9E5DDE
set cyan          1EFF8E
set cyan_light    59FFAC



# Set colors
# Refer to doc here: https://fishshell.com/docs/current/index.html#variables-color
# The following variables are available to change the highlighting colors in fish:
#
set fish_color_prompt_primary $foreground

#set fish_color_prompt_secondary 5fdfff # Used for git for instance
set fish_color_prompt_accent $yellow
set fish_color_prompt_timestamp FFFFFF
# 7cc7f2 -> lighter blue

#set -l white (set_color FFFFFF)
#cyan (set_color 5fdfff)
#orange (set_color df5f00)
#hotpink (set_color df005f)
#blue (set_color 53D1ED)
#green (set_color 87ff00)
#greeno (set_color -o 87ff00)
#purple (set_color af5fff)
#red (set_color FF0000)
#redo (set_color -o FF0000)
#yellow (set_color E0D757)


#set fish_color_normal 000000 # the default color
set fish_color_command FFFFFF # the color for commands
# fish_color_quote 000000 # the color for quoted blocks of text
# fish_color_redirection 000000 # the color for IO redirections
set fish_color_end $green # the color for process separators like ';' and '&'
set fish_color_error $red # the color used to highlight potential errors
set fish_color_param $blue # the color for regular command parameters
# fish_color_comment 000000 # the color used for code comments
# fish_color_match 000000 # the color used to highlight matching parenthesis
# fish_color_selection 000000 # the color used when selecting text (in vi visual mode)
# fish_color_search_match 000000 # used to highlight history search matches and the selected pager item (must be a background)
# fish_color_operator 000000 # the color for parameter expansion operators like '*' and '~'
# fish_color_escape 000000 # the color used to highlight character escapes like '\n' and '\x70'
# fish_color_cwd 000000 # the color used for the current working directory in the default prompt
# fish_color_autosuggestion 000000 # the color used for autosuggestions (also timestamp right of prompt)
# fish_color_user 000000 # the color used to print the current username in some of fish default prompts
# fish_color_host 000000 # the color used to print the current host system in some of fish default prompts
# fish_color_cancel 000000 # the color for the '^C' indicator on a canceled command

# Additionally, the following variables are available to change the highlighting in the completion pager:
# fish_pager_color_prefix 000000 # the color of the prefix string, i.e. the string that is to be completed
# fish_pager_color_completion 000000 # the color of the completion itself
# fish_pager_color_description 000000 # the color of the completion description
# fish_pager_color_progress 000000 # the color of the progress bar at the bottom left corner
# fish_pager_color_secondary 000000 # the background color of the every second completion

