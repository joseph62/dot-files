#! /usr/bin/env bash
echo 'Installing git...'

. installation_scripts/installation-functions.sh

update-file resources/gitconfig ~/.gitconfig 'gitconfig'

echo 'Git Installed'
