#!/bin/bash

# variables
DOT_BASE_DIR=~/dotfiles
DOT_LIB_DIR=$DOT_BASE_DIR/lib
DOT_VAR_DIR=$DOT_BASE_DIR/var
DOT_BIN_DIR=$DOT_BASE_DIR/bin
DOT_FILES="tmux.conf"

function install {
    # create symlink
    for file in $DOT_FILES; do
        echo "Creating symlink to $file in home directory."
        ln -snf $DOT_BASE_DIR/dotfiles/$file ~/.$file
    done

    ln -snf $DOT_BIN_DIR/tm.sh /usr/local/bin/tm

    ln -snf $DOT_BASE_DIR/.gitignore ~/
    ln -snf $DOT_BASE_DIR/.vimrc ~/

    # init vim     
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugUpdate +qall
}

function remove {
    for file in $DOT_FILES; do
        echo "Deleteing ~/.$file"
        rm ~/.$file
    done

    echo "Deleteing /usr/local/bin/tm"
    rm /usr/local/bin/tm

    test -h ~/.vimrc && rm ~/.vimrc
    test -h ~/.gitignore && rm ~/.gitignore
}

# main
if [ "$1" = "--remove" ] || [ "$1" = "-r" ]; then
    remove 
else
    install
fi
