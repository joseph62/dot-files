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

# Use modern completion system
autoload -Uz compinit
compinit

setopt histignorealldups sharehistory
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# ~/.environment, instead of adding them here directly
source_if_exists ~/.environment

# ~/.aliases, instead of adding them here directly.
source_if_exists ~/.aliases

# Define environment variables here
# set PATH so it includes user's private bin directories
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

typeset -a plugins
plugins=(
    aliases
    rtx
    git
    gitignore
    git-auto-fetch
    docker
    docker-compose
    history
    zsh-syntax-highlighting
    zsh-autosuggestions
    zoxide
    thefuck
    rust
)

if [ "${OSTYPE#darwin}" != "$OSTYPE" ] # darwin prefix in OSTYPE
then
    ID=macos
else
    . /etc/os-release
fi

case $ID in
fedora)
    plugins+=(dnf)
    ;;
ubuntu)
    plugins+=(ubuntu)
    ;;
macos)
    plugins+=(brew)
    ;;
*)
    ;;
esac

fpath+=$ZSH/custom/plugins/zsh-completions/src

ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh

# Vi key bindings
bindkey -v

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
