#! /usr/bin/env bash
echo 'Installing vim...'

. installation_scripts/installation-functions.sh

update-file resources/vimrc ~/.vimrc 'vimrc'

create-directory-if-not-exists ~/temp

create-directory-if-not-exists ~/.vim
create-directory-if-not-exists ~/.vim/bundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo 'Vim Installed'
