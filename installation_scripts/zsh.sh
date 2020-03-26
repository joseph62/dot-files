#! /usr/bin/env bash
echo 'Installing zsh...'

. installation_scripts/installation-functions.sh

update-file resources/aliases ~/.aliases 'aliases'
update-file resources/environment ~/.environment 'environment'
update-file resources/zshrc ~/.zshrc 'zshrc'

# Download zsh-syntax-highlighting if it does not exist

echo 'Zsh Installed'
