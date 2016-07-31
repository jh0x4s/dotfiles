#!/bin/bash

# variables
DOT_BASE_DIR=~/dotfiles
DOT_LIB_DIR=$DOT_BASE_DIR/lib
DOT_VAR_DIR=$DOT_BASE_DIR/var
DOT_BIN_DIR=$DOT_BASE_DIR/bin
DOT_FILES="vimrc tmux.conf"

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

    # git submodule Vundle.vim, jellybeans.vim.
    git submodule init
    git submodule update

    # init var/vim for ~/.vim 
    mkdir -p $DOT_BASE_DIR/var/vim/bundle
    ln -snf $DOT_LIB_DIR/Vundle.vim $DOT_VAR_DIR/vim/bundle/Vundle.vim 
    ln -snf $DOT_LIB_DIR/jellybeans.vim/colors $DOT_VAR_DIR/vim/colors
    ln -snf $DOT_VAR_DIR/vim ~/.vim

    vim +PluginInstall +PluginUpdate +qall
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
