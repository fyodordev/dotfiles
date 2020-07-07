export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export BROWSER=/usr/bin/chromium
 
export PATH=$PATH:$HOME/.scripts:/var/lib/snapd/snap/bin:/snap/bin

export EDITOR="nvim"

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
