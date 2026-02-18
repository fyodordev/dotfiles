# ~/.zshrc

# ── Environment (single source of truth) ──
source ~/.profile

# ── History ──
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS SHARE_HISTORY INC_APPEND_HISTORY

# ── Completions ──
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ── Directory navigation ──
setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_SILENT

# ── Vi mode ──
bindkey -v
export KEYTIMEOUT=1

# Cursor: block(blink)=normal, underscore(blink)=insert (matches fish config)
function zle-keymap-select {
    case $KEYMAP in
        vicmd)      print -n '\e[1 q' ;;
        viins|main) print -n '\e[3 q' ;;
    esac
}
function zle-line-init { print -n '\e[3 q' }
zle -N zle-keymap-select
zle -N zle-line-init

# ── Plugins (pacman-installed) ──
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# History substring search: arrow keys + vi j/k
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# ── Prompt ──
eval "$(starship init zsh)"
