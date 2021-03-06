# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac


# disable standard terminal function CTRL-Q and CTRL-S
# to stop output and resume
stty -ixon

# use the vi keymap
set -o vi

if [ -e "$HOME/.bash_profile" ]; then
    source "$HOME/.bash_profile"
fi


# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# export GLOBIGNORE


# make the name of the directory be enough to cd into it
shopt -s autocd

# load aliases
[[ -r ~/.sh_aliases ]] && . ~/.sh_aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi


[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# load ble.sh, improved line-editor to replace readline
blesh_path="$HOME/.local/share/blesh/ble.sh"
[[ $- == *i* ]] && # only needs to be loaded in interactive mode
    test -f "$blesh_path" && # check if installed
    source "$blesh_path" --noattach

# attach thw ble.sh line editor
[[ ${BLE_VERSION-} ]] && ble-attach
