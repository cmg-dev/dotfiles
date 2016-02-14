#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing homebrew packages..."

# cli tools
brew install ack
brew install tree
brew install wget

# development server setup
#brew install nginx
#brew install dnsmasq

# development tools
brew install git
brew install git-flow
brew install hub
brew install macvim --override-system-vim
brew install reattach-to-user-namespace
brew install tmux
brew install zsh
brew install highlight
brew install nvm
brew install z
brew install markdown
brew install midnight-commander

brew install vim

# install neovim
brew install neovim/neovim/neovim

# Productivity stuff
brew install Caskroom/cask/alfred
brew install pandoc
brew install htop-osx
brew install sphinx
brew install zsh-completions

exit 0
