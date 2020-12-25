#!/usr/bin/env sh

main() {
    # Only enable exit-on-error after the non-critical colorization stuff,
    # which may fail on systems lacking tput or terminfo
    set -e

    if [ ! $(which brew) ]; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    FORMULAS="zsh git vim jq fzf direnv 
        nvm \
        pyenv pyenv-virtualenv \
        cask/docker cask/iterm2 cask/alfred cask/dash \
        cask/visual-studio-code cask/sublime-merge cask/tableplus cask/postman \
        cask/google-chrome cask/google-backup-and-sync cask/itsycal cask/appcleaner" 
    for formula in ${FORMULAS}
    do
        if [[ ${formula} == cask/* ]]; then
            brew="brew cask"
            formula=${formula/cask\//}
        else
            brew="brew"
        fi

        if ! ${brew} ls --versions ${formula} &>/dev/null; then
            ${brew} install ${formula} 
        fi
    done

    if [ ! -d ~/.oh-my-zsh ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi

    DOTFILES_HOME=~/dotfiles
    if [ ! -d "${DOTFILES_HOME}" ]; then
        git clone https://github.com/jh0x4s/dotfiles.git ${DOTFILES_HOME}
    fi
}

main
