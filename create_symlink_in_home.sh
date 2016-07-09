#!/bin/bash

# variables
__DOT_DIR=~/dotfiles
__DOT_FILES=".vimrc .tmux.conf"

# colorful output 
__COLOR_INFO=`tput setaf 3`
__COLOR_ERR=`tput setaf 1`
__COLOR_RESET=`tput sgr0`

function info {
    echo "${__COLOR_INFO}$@${__COLOR_RESET}"
}

function err {
    echo "${__COLOR_ERR}$@${__COLOR_RESET}"
}

# install 
function install {
    for file in $__DOT_FILES; do
	info "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/$file
    done
}

# remove
function remove {
    for file in $__DOT_FILES; do
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
