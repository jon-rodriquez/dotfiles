# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~

# Set to superior editing mode

set -o vi

export VISUAL=lvim
export EDITOR=lvim
export TERM="tmux-256color"

export BROWSER="chrome"

# Directories

export REPOS="/Users/jonathanrodriquez/Documents/GitHub"
export DOTFILES="/Users/jonathanrodriquez/dotfiles"

# ~~~~~~~~~~~~~~~ Path configuration ~~~~~~~~~~~~~~~~~~~~~~~~

setopt extended_glob null_glob

path=(
    $path                           # Keep existing PATH entries
    $HOME/bin
    $HOME/.local/bin
    $HOME/go/bin
    $HOME/.tmuxifier/bin
)
# Remove duplicate entries and non-existent directories
typeset -U path
path=($^path(N-/))

export PATH

# ~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions


# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~

PURE_GIT_PULL=0


if [[ "$OSTYPE" == darwin* ]]; then
  fpath+=("$(brew --prefix)/share/zsh/site-functions")
else
  fpath+=($HOME/.zsh/pure)
fi

autoload -U promptinit; promptinit
prompt pure


# ~~~~~~~~~~~~~~~ Alias Config ~~~~~~~~~~~~~~~~~~~~~~~~

alias lv='lvim .'
alias dot='cd $DOTFILES'
alias repo='cd $REPOS'
alias ..='cd ..'
alias ...='cd ../..'
alias gs='git status'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcom='git add . && git commit -m'
alias ggpush='git push origin $(git symbolic-ref --short HEAD)'
alias ggpull='git pull origin "$(git_current_branch)"'

# ~~~~~~~~~~~~~~~ File Manager Config ~~~~~~~~~~~~~~~~~~~~~~~~

lfcd() {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            cd "$dir"
        fi
    fi
}


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


# ~~~~~~~~~~~~~~~ Tmuxifier ~~~~~~~~~~~~~~~~~~~~~~~~
eval "$(tmuxifier init -)"
