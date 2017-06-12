#!/bin/sh

# reload nvm into this environment
source $(brew --prefix nvm)/nvm.sh

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

nvm install stable
nvm alias default stable
