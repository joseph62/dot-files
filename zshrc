function alias_if_exists {
    which $1 &> /dev/null
    if [ $? -eq 0 ] 
    then
        echo "Detected '$1', Adding alias $2=$3"
        alias $2=$3
    else
        echo "Could not find '$1', Ignoring alias $2=$3"
    fi
}

function source_if_exists {
    if [ -f $1 ] 
    then
        echo "Sourcing $1"
        . $1
    else
        echo "Could not find '$1' for sourcing"
    fi
}

export ZSH=$HOME/.oh-my-zsh

if [ -f "~/.rtx" ] then
    eval "$(~/.rtx/bin/rtx activate zsh)"
fi

# Use modern completion system
autoload -Uz compinit
compinit

setopt histignorealldups sharehistory
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

typeset -a plugins
plugins=(
    aliases
    git
    gitignore
    git-auto-fetch
    dnf
    brew
    laravel
    composer
    docker
    docker-compose
    history
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Vi key bindings
bindkey -v

# ~/.environment, instead of adding them here directly
source_if_exists ~/.environment

# ~/.aliases, instead of adding them here directly.
source_if_exists ~/.aliases

# Define environment variables here
# set PATH so it includes user's private bin directories
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
export IPYTHONDIR="$HOME/.local/etc/ipython"
export PROMPT="%F{221}%n@%m %F{215}<%!> %1~ %F{209} ->%f"
unset RPROMPT

eval "$(zoxide init zsh)"
eval "$(thefuck --alias)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias hgrep='history 0 | grep'
alias agrep='alias | grep'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias bye='exit'
alias tmux='tmux -2'
alias mit-scheme='rlwrap --multi-line --multi-line-ext ".scm" mit-scheme'

# Overwriting common utilities with new versions if they are detected
alias_if_exists z cd z
alias_if_exists bat cat bat
alias_if_exists exa ls exa
alias_if_exists rg grep rg

# Rust, Cargo, Rustup
alias carf='cargo fmt'
alias carr='cargo run'
alias carb='cargo build'
alias carc='cargo clippy'
alias cart='cargo test'
alias carnt='cargo nextest run'
alias carfcb='cargo fmt && cargo clippy && cargo build'

# Additional git aliases
alias_if_exists git gta 'git tag'
