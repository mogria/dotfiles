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
setopt vi

if [ -e "$HOME/.bash_profile" ]; then
    source "$HOME/.bash_profile"
fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar


# make the name of the directory be enough to cd into it
shopt -s autocd

# load aliases
[[ -r ~/.sh_aliases ]] && . ~/.sh_aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
