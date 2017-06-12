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
      }
    ];

    return this.prompt(prompts).then(props => {
      this.props = props;
    });
  }

  writing() {
    this.fs.copyTpl(
      this.templatePath('globals.sh'),
      this.destinationPath('globals.sh'),
      this.props
    );
  }

  install() {
  }
};
