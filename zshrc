function source_if_exists {
    if [ -f $1 ] 
    then
        echo "Sourcing $1"
        . $1
    else
        echo "Could not find '$1' for sourcing"
    fi
}

# Vi key bindings
bindkey -v

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

# Source Oh My Zsh plugins if they exist
source_if_exists ~/.local/opt/ohmyzsh/lib/git.zsh

typeset -a plugins
plugins=(
    'git'
    'gitignore'
    'git-auto-fetch'
    'git-prompt'
    'dnf'
    'brew'
    'debian'
    'laravel'
    'composer'
    'docker'
    'docker-compose'
    'history'
)
for plugin ("$plugins[@]") source_if_exists "$HOME/.local/opt/ohmyzsh/plugins/$plugin/$plugin.plugin.zsh"

# ~/.environment, instead of adding them here directly
source_if_exists ~/.local/etc/dot-files/environment
source_if_exists ~/.environment

# ~/.aliases, instead of adding them here directly.
source_if_exists ~/.local/etc/dot-files/aliases
source_if_exists ~/.aliases

# Interactive syntax highlighting
source_if_exists ~/.local/opt/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
