# disable standard terminal function CTRL-Q and CTRL-S
# to stop output and resume
stty -ixon

# use the vi keymap
setopt vi

if [ -e "$HOME/.bash_profile" ]; then
    source "$HOME/.bash_profile"
fi

alias '.d'='cd ~/.dotfiles'
