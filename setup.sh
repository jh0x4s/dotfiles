#!/bin/bash

# variables
DOT_BASE_DIR=~/dotfiles
DOT_LIB_DIR=$DOT_BASE_DIR/lib
DOT_VAR_DIR=$DOT_BASE_DIR/var
DOT_BIN_DIR=$DOT_BASE_DIR/bin
DOT_FILES="tmux.conf gitconfig gitignore_global"

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
    # create symlink
    for file in $DOT_FILES; do
        info "Creating symlink to $file in home directory."
        ln -snf $DOT_BASE_DIR/dotfiles/$file ~/.$file
    done

    ln -snf $DOT_BIN_DIR/tm.sh /usr/local/bin/tm

    # init vim 
    ln -snf $DOT_BASE_DIR/vim ~/.vim
    ln -snf $DOT_BASE_DIR/vim/vimrc ~/.vimrc
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugUpdate +qall
}

# remove
function remove {
    for file in $DOT_FILES; do
        info "Deleteing ~/.$file"
        rm ~/.$file
    done

    info "Deleteing /usr/local/bin/tm"
    rm /usr/local/bin/tm

    info "Deleteing ~/.vim"
    rm ~/.vim
}

# main
if [ "$1" = "--remove" ] || [ "$1" = "-r" ]; then
    remove 
else
    install
fi
