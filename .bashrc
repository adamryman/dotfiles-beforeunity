# add this path to the path variable so that we can access go bins from any directory
export projects=~/projects

export GOPATH=$projects/go
export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/go
export GOCODE=$GOPATH/src

export PATH=/usr/bin:/usr/local/bin:/bin:/usr/sbin:/sbin
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# Custom bins export
PATH=$PATH:$HOME/bin

# This loads nvm
export NVM_DIR="/home/adamryman/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# hub is a git wrapper that gives nice github commands
if which hub > /dev/null; then
	alias git=hub
fi

# Custom Functions

# search google with w3m
function google() {
        IFS="+"
        export query="$@"
        w3m http://google.com/search?q="$query"
}

# swap a program in with the current terminal in i3
function swap() {
	echo "$@"
	swap_command="$@"
	"$swap_command" & disown; sleep 0.6; exit
}

# append to the history file, don't overwrite it
# The history file is normally in memory until shell closes
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Defining colors for prompt
bold='\e[1;39m'
orange='\e[38;5;208m'
red='\e[0;31m'
green='\e[0;32m'
bright_green='\e[1;32m'
yellow='\e[1;33m'
blue='\e[1;34m'
cyan='\e[0;36m'
purple='\e[0;35m'
reset='\e[0m'

# Functions in bash don't seem to really "return" anything. The only way to get
# a message out of them is to have them print data, then to capture that data
# via command substitution. That is what we do here.
function get_repo_name {
	repo=$(basename $(git rev-parse --show-toplevel 2> /dev/null) 2> /dev/null) || return
	echo "("$repo")"
}
function get_git_branch {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo ""
	echo "("${ref#refs/heads/}")"
}

user="\[$cyan\]\u\[$reset\]"
host="\[$purple\]\h\[$reset\]"
path="\[$green\]\w\[$reset\]"
cur_branch="\[$bright_green\]\$(get_git_branch)\[$reset\]"
cur_repo="\[$red\]\$(get_repo_name)\[$reset\]"
line_join="\[$yellow\]@\[$reset\]"
export PS1="$user$line_join$host\n$path $cur_branch $cur_repo\n$ "

# Bash file path completion
[[ $- = *i* ]] && bind TAB:menu-complete

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


eval `keychain --quiet --eval --agents ssh id_rsa`
