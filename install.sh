#!/usr/bin/env sh

main() {
    # Use colors, but only if connected to a terminal, and that terminal
    # supports them.
    if which tput >/dev/null 2>&1; then
        ncolors=$(tput colors)
    fi
    if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
        RED="$(tput setaf 1)"
        GREEN="$(tput setaf 2)"
        YELLOW="$(tput setaf 3)"
        BLUE="$(tput setaf 4)"
        BOLD="$(tput bold)"
        NORMAL="$(tput sgr0)"
    else
        RED=""
        GREEN=""
        YELLOW=""
        c=""
        BOLD=""
        NORMAL=""
    fi

    # Only enable exit-on-error after the non-critical colorization stuff,
    # which may fail on systems lacking tput or terminfo
    set -e


    if [ ! $(which brew) ]; then
        echo "${BLUE}Install Homebrew${NORMAL}"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    FORMULAS="zsh git tig vim tmux jq peco pyenv pyenv-virtualenv \
        cask/alfred cask/dash \
        cask/docker cask/iterm2 cask/postman cask/visual-studio-code cask/ngrok \
        cask/google-backup-and-sync cask/flux cask/appcleaner cask/itsycal cask/iina cask/beamer" 
    for formula in ${FORMULAS}
    do
        if [[ ${formula} == cask/* ]]; then
            brew="brew cask"
            formula=${formula/cask\//}
        else
            brew="brew"
        fi

        if ! ${brew} ls --versions ${formula} &>/dev/null; then
            echo "${BLUE}Install ${formula}${NORMAL}"
            ${brew} install ${formula} 
        fi
    done

    if [ ! -d "~/.oh-my-zsh" ]; then
        echo "${BLUE}Install oh-my-zsh${NORMAL}" 
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi

    DOTFILES_HOME=~/dotfiles
    if [ ! -d "${DOTFILES_HOME}" ]; then
        echo "${BLUE}Git clone dotfiles ${NORMAL}"
        git clone https://github.com/jh0x4s/dotfiles.git ${DOTFILES_HOME}
    fi

}

main
