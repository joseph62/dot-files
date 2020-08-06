# Import the environment dot file if it exists

[ -f ~/.local/etc/dot-files/environment ] && . ~/.local/etc/dot-files/environment
[ -f ~/.environment ] && . ~/.environment

# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt adam1

# Custom prompt
PROMPT='%F{221}%n@%m %F{215}<%!> %1~ %F{209}->%f'

setopt histignorealldups sharehistory

# Vi key bindings
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

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

# ~/.aliases, instead of adding them here directly.
[ -f ~/.local/etc/dot-files/aliases ] && . ~/.local/etc/dot-files/aliases
[ -f ~/.aliases ] && . ~/.aliases

# Interactive syntax highlighting
. ~/.local/opt/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. ~/.local/opt/ohmyzsh/plugins/git/git.plugin.zsh