#!/bin/bash

# variables
DOT_DIR=~/dotfiles
DOT_FILES=".vimrc .tmux.conf"

# colorful output 
COLOR_INFO=`tput setaf 3`
COLOR_ERR=`tput setaf 1`
COLOR_RESET=`tput sgr0`

function info {
    echo "${COLOR_INFO}$@${COLOR_RESET}"
}

function err {
    echo "${COLOR_ERR}$@${COLOR_RESET}"
}

# install 
function install {
    for file in $DOT_FILES; do
	info "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/$file
    done
}

# remove
function remove {
    for file in $DOT_FILES; do
	info "Deleteing ~/$file."
	rm ~/$file
    done
}

# main
if [ "$1" = "--remove" ] || [ "$1" = "-r" ]; then
    remove 
else
    install
fi
