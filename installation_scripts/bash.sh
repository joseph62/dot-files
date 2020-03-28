#! /usr/bin/env bash
echo 'Installing bash...'

. installation_scripts/installation-functions.sh

create-directory-if-not-exists ~/.local
create-directory-if-not-exists ~/.local/etc
create-directory-if-not-exists ~/.local/etc/dot-files

update-file resources/aliases ~/.local/etc/dot-files/aliases 'aliases' 
update-file resources/environment ~/.local/etc/dot-files/environment 'environment' 
update-file resources/bash_logout ~/.bash_logout 'bash_logout' 
update-file resources/profile ~/.profile 'profile' 
update-file resources/bashrc ~/.bashrc 'bashrc'

echo 'Bash Installed'
