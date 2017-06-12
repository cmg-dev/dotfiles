#!/bin/bash

echo "Installing dotfiles"

touch ~/.bash_profile

# oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh

# Terminal solarized
git clone https://github.com/tomislav/osx-terminal.app-colors-solarized ~/.osx_terminal_solarized

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    xcode-select --install
    echo "Running on OSX"

    echo "Brewing all the things"
    source install/brew.sh

    echo "Updating OSX settings"
    source install/osx.sh

    echo "Installing nvm and node“
    source install/nvm.sh

    echo "Installing extra software using cask"
    source install/brew-cask.sh
fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp

echo "Installing additional stuff"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

curl "https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim" >> solarized.vim
mkdir ~/.vim/colors
mv solarized.vim ~/.vim/colors/

echo "Configuring zsh as default shell"
chsh -s $(grep /zsh$ /etc/shells | tail -1)
env zsh
