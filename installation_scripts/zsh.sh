#! /usr/bin/env bash
echo 'Installing zsh...'

. installation_scripts/installation-functions.sh

update-file resources/aliases ~/.aliases 'aliases'
update-file resources/environment ~/.environment 'environment'
update-file resources/zshrc ~/.zshrc 'zshrc'

create-directory-if-not-exists ~/.local
create-directory-if-not-exists ~/.local/opt

rm -r ~/.local/opt/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.local/opt/zsh-syntax-highlighting

echo 'Zsh Installed'
