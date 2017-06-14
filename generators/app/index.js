'use strict';
const Generator = require('yeoman-generator');
const chalk = require('chalk');
const yosay = require('yosay');

module.exports = class extends Generator {
  prompting() {
    // Have Yeoman greet the user.
    this.log(yosay(
      'Welcome to the 5minds dotfiles installer.'
    ));

    const prompts = [
      {
        type: 'input',
        name: 'github.user.name',
        message: 'Enter your github username:'
      },
      {
        type: 'input',
        name: 'mac.user.name',
        message: 'Enter your (mac) accounts username:'
      },
      {
        type: 'input',
        name: 'git.user.name',
        message: 'Enter your git username (used for git config):'
      },
      {
        type: 'input',
        name: 'git.user.email',
        message: 'Enter your git email (used for git config):'
      }
    ];

    return this.prompt(prompts).then(props => {
      this.props = props;
    });
  }

  writing() {
    this._copy('globals.sh');
    this._copy('./zsh/zshrc.symlink')
  }

  _copy(file) {
    this.fs.copyTpl(
      this.templatePath(file),
      this.destinationPath(file),
      this.props
    );
  }

  install() {
  }
};
