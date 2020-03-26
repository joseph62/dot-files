#! /usr/bin/env bash
echo 'Installing vim...'

. installation_scripts/installation-functions.sh

update-file resources/vimrc ~/.vimrc 'vimrc'

create-directory-if-not-exists ~/temp

echo 'Vim Installed'
