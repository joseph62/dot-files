#! /usr/bin/env bash
echo 'Installing zsh...'

. installation_scripts/installation-functions.sh

update-file resources/aliases ~/.aliases 'aliases'
update-file resources/environment ~/.environment 'environment'
update-file resources/zshrc ~/.zshrc 'zshrc'

git clone https://github.com/zsh-users/zsh-syntax-highlighting /tmp/zsh-syntax-highlighting

create-directory-if-not-exists ~/.local
create-directory-if-not-exists ~/.local/opt
create-directory-if-not-exists ~/.local/opt/zsh-syntax-highlighting

update-file /tmp/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ~/.local/opt/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 'zsh-syntax-highlighting'

rm -r /tmp/zsh-syntax-highlighting

echo 'Zsh Installed'
