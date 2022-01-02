# add uawe scripts
export PATH="$HOME/bin:$PATH"

# use a sane default blocksize of 1kb instead of the default 512 for commands like df, du, etc.
export BLOCKSIZE=1k

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoredups:ignorespace
# make sure again to drop lines starting with a space
export HISTIGNORE="[ ]*"

# history size in memory
export HISTSIZE=20000

# history size on disk
# export HISTFILESIZE=200000
export HISTFILESIZE=-1 # no limit


# Locale settings
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="de_CH.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="de_CH.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="de_CH.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="de_CH.UTF-8"
export LC_TELEPHONE="de_CH.UTF-8"
export LC_MEASUREMENT="de_CH.UTF-8"
export LC_IDENTIFICATION="de_CH.UTF-8"


# editor settings
if command -v nvim 2>&1 > /dev/null; then
  export EDITOR=`command -v nvim`
  export VISUAL=`command -v nvim`
fi

alias vim='nvim'
alias vi='nvim'

# less configuration
export LESS='-RiF --mouse --wheel-lines=3'

# git aliases
alias gc='git commit'
alias gdc='git diff --cached'
alias gp='git push'
alias gs='git status'
alias ga='git add'
