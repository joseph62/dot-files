#! /usr/bin/env bash
echo 'Installing bash...'

. installation_scripts/installation-functions.sh

update-file resources/aliases ~/.aliases 'aliases' 
update-file resources/environment ~/.environment 'environment' 
update-file resources/bash_logout ~/.bash_logout 'bash_logout' 
update-file resources/profile ~/.profile 'profile' 
update-file resources/bashrc ~/.bashrc 'bashrc'

echo 'Bash Installed'
