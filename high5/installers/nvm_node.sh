#!/bin/bash

if test ! $(command -v nvm); then
    echo "Installing nvm"
    # install script for nvm
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

    # load nvm into current env
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

    # install stable node version
    nvm install --lts
    lts_version=$(nvm ls lts/*)
    lts_version_clean=${lts_version##*v}
    nvm use default $lts_version_clean
fi
