#!/bin/bash

if [[ "$PWD" != "$HOME/.dotfiles" ]]; then
  echo "You must run this script in $HOME/.dotfiles/"
  echo "Run git clone xxx && cd $HOME/.dotfiles && ./install.sh to change"
  exit 1
fi

echo "IMPORTANT: Please not that you have to install the following software first:"
echo "git, xcode."

echo "Installing dotfiles"

while [[ -z "$GITHUB_USER_NAME" ]]
do
  read -p "Enter github user name: " GITHUB_USER_NAME
done

USER_DOTFILES_REPO="https://github.com/$GITHUB_USER_NAME/dotfiles"

echo "Attempting to git clone $USER_DOTFILES_REPO ..."

# git clone $USER_DOTFILES_REPO local5

touch ~/.bash_profile
touch ~/.zshrc

scripts=( installers/oh-my-zsh installers/nvm_node_npm installers/brew installers/brew_applications installers/brew_cask_applications configs/osx )
for script in "${scripts[@]}"
do
  echo "##################################"
	echo "Running script $script"
  echo "##################################"
  # run base scirpt
  source "high5/$script.sh"
  # run local overrides
  if [ -f local5/$script.sh ]; then
    source "local5/$script.sh"
  fi
  # run post script hooks
  if [ -f high5/$script.post.sh ]; then
    source "high5/$script.post.sh"
  fi


done

# rm -fr local5
