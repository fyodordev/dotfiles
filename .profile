export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export BROWSER=/usr/bin/chromium
 
export PYSPARK_PYTHON=python3
export PATH=$PATH:$HOME/.scripts:/var/lib/snapd/snap/bin:/snap/bin:$HOME/.local/bin:/opt/apache-spark/bin:/opt/apache-spark/python

export EDITOR="nvim"

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
