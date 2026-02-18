# Wayland Variables for NVIDIA to work correctly
# ! RUNNING THIS FILE DOESN'T DO ANYTHING
# ! PLEASE SOURCE THIS FILE BEFORE STARTING ANY WLROOTS-BASED COMPOSITOR
# Hardware cursors not yet working on wlroots
export WLR_NO_HARDWARE_CURSORS=1
# Set WLRoots renderer to Vulkan to avoid flickering
export WLR_RENDERER=vulkan
# General wayland environment variables
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
# Firefox wayland environment variable
export MOZ_ENABLE_WAYLAND=1
export MOZ_USE_XINPUT2=1
# OpenGL Variables
export GBM_BACKEND=nvidia-drm
export __GL_GSYNC_ALLOWED=0
export __GL_VRR_ALLOWED=0
export __GLX_VENDOR_LIBRARY_NAME=nvidia

export XDG_SCREENSHOTS_DIR=/home/fyodor/Screenshots

export PATH="\
$HOME/.scripts:\
/var/lib/snapd/snap/bin:\
/snap/bin:\
$HOME/.local/bin:\
/opt/apache-spark/bin:\
$HOME/.npm-global/bin:\
/opt/apache-spark/python:\
$PATH"


# Application specific variables
export PYSPARK_PYTHON=python3
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
export TERM='foot'
export EDITOR='/usr/bin/nvim'



# Convenience aliases
alias v='/usr/bin/nvim'
alias lg='/usr/bin/lazygit'
alias sxiv='sxiv -b'
alias q='exit'
alias cli='xclip -sel clip'
#alias f='lfrun'
alias f='yazi'

alias ls='ls --color=auto'
alias cgit='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
alias sl='slack --enable-features=WebRTCPipeWireCapturer --enable-features=UseOzonePlatform --ozone-platform=wayland -s %U'

source ~/.scripts/gwt
