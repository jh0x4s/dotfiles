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

# body
for file in $__DOT_FILES; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

