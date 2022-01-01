# mogria's dotfiles

Dotfiles are user specific configuration files for programs.


## Install

    git clone git@github.com:mogria/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    stow bash

Then use `stow` to manage symlinks.

### vim

Use stow to use this dotfiles vim configuration:

    cd ~/.dotfiles
    stow vim

In addition, you'll need to install the vim plugins and do the tree sitter update.

    vim -c :PlugInstall -c :q -c :q
    vim -c :TSUpdate all -c :q -c :q

