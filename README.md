# mogria's dotfiles

Dotfiles are user specific configuration files for programs.

## Setup

Run the following commands to use some of the configuration files in this Repository.

    git clone git@github.com:mogria/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    stow bash

Then use [`stow`](https://www.gnu.org/software/stow/) (which you'll need to install separately) to manage symlinks.
Note options defined in the `.stowrc` in the top of this repository,
it contains the default options passed to stow, and you might consider
amending or adjusting them to your needs.

You can also stow the complete set of default packages by running the setup script

    ~/.dotfiles$ ./setup.sh

You might want to adjust the set of packages automatically stowed at the start of the `setup.sh`.

    PACKAGES="vim tmux bash"

Note, some packages have `postinstall.sh` script which the `setup.sh` will run,
if all packages could be correctly stowed.

### vim

Use stow to use this dotfiles vim configuration:

    cd ~/.dotfiles
    stow vim

In addition, you'll need to install the vim plugins and do the tree sitter update.

    vim -c :PlugInstall -c :q -c :q
    vim -c :TSUpdate all -c :q -c :q

