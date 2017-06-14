#!/bin/sh

echo "Installing homebrew packages..."

# cli tools
brew install ack
brew install tree
brew install wget

# development tools
brew install git
brew install git-flow
brew install hub
brew install macvim --override-system-vim
brew install reattach-to-user-namespace
brew install tmux
brew install zsh
brew install highlight
brew install z
brew install markdown
brew install midnight-commander

brew install vim

# install neovim
brew install neovim/neovim/neovim

# Productivity stuff
brew install pandoc
brew install htop-osx
brew install sphinx
brew install zsh-completions
