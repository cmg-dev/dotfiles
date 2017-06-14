#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
GLOBALS='globals.sh'
COLORS='colors.sh'
TOUCH_FILES=(
  "$HOME/.bash_profile"
)
NVM_INSTALLER='high5/installers/nvm_node.sh'
SCRIPTS=(
  'installers/link_symlinks'
  'installers/brew'
  'installers/brew_applications'
  'installers/brew_cask_applications'
  'configs/osx'
  'installers/oh_my_zsh'
)

# include colors
source $COLORS

if [[ $PWD != $DOTFILES_DIR ]]; then
  echo "You must run this script in $DOTFILES_DIR"
  echo "Run git clone xxx && cd $DOTFILES_DIR && ./install.sh to change"
  exit 1
fi

echo "IMPORTANT: Please not that you have to install the following software first:"
echo "git, xcode."
echo "Add your sshkey to your github account before running this script."
echo ""

# touch local files
for file in "${TOUCH_FILES[@]}"
do
  touch $file
done

# install nvm, node
source $NVM_INSTALLER

# install yeoman we need this for our generator
npm install -g yo

# startup application and yeoman
# this will create the globals.sh file
# TODO: npm unlink ??
npm install && npm link && yo dotfiles

# load globals into env
source $GLOBALS

# configure git
git config --global user.name $GIT_USER_NAME
git config --global user.email $GIT_USER_EMAIL


USER_DOTFILES_REPO="https://github.com/$GITHUB_USER_NAME/dotfiles"

echo "Attempting to git clone $USER_DOTFILES_REPO ..."

# git clone $USER_DOTFILES_REPO local5

for script in "${SCRIPTS[@]}"
do
  echo "##################################"
	echo "Running script $script"
  echo "##################################"
  # run base scirpt
  source "high5/$script.sh"
  # run local overrides
  if [[ -f local5/$script.sh ]]; then
    source "local5/$script.sh"
  fi
  # run post script hooks
  if [[ -f high5/$script.post.sh ]]; then
    source "high5/$script.post.sh"
  fi
done



# rm -fr local5
