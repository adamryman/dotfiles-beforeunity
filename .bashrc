# Basic path
export PATH=/usr/bin:/usr/local/bin:/bin:/usr/sbin:/sbin

# Pip is putting things here
export PATH=$PATH:$HOME/.local/bin

export projects=$HOME/projects

# GOOOOOOOO
export GOPATH=$projects/go
export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/go
export GOCODE=$GOPATH/src

# Add go bins to path
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

# Make
# lets clean up
alias clean='make clean'


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
# Leland Batey's
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

# My Colors
# to list possible colors
function all_colors {
	for C in {0..255}; do  tput setab $C;  echo -n "$C "; done
	echo
}

# color = "\e[38;5;XXXm
# where XXX is the color code
# http://misc.flogisoft.com/bash/tip_colors_and_formatting
#light_red='\e[38;5;161m'
#light_blue='\e[38;5;81m'
light_green='\e[38;5;118m'
#light_orange='\e[38;5;202m'

# Functions in bash don't seem to really "return" anything. The only way to get
# a message out of them is to have them print data, then to capture that data
# via command substitution. That is what we do here.

# Bash/shell escaping is wierd. I am going to just write down a few things I have learned
# http://wiki.bash-hackers.org/syntax/pe

# http://wiki.bash-hackers.org/scripting/style

# The most important things I have learned.
# Always call functions and programs via $() when they are part of another command
# Always get vars via "${FOO}" WITH QUOTES

function get_git_top_path {
	top_path=$(git rev-parse --show-toplevel 2> /dev/null) || return
	echo $top_path
}

function git_top {
	echo $(get_git_top_path)
}

function get_repo_path {
	repopath=$(git rev-parse --show-toplevel 2> /dev/null)
	echo $repopath
}

function get_repo_name {
	repo=$(basename $(get_repo_path) 2> /dev/null) || return
	echo "("$repo")"
}

function get_git_branch {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo ""
	echo "("${ref#refs/heads/}")"
}

# If in git repo and mv command is used then prompt if git mv should be used
function check_git_repo_for_mv {
	if [ $(get_git_top_path) ]; then
		echo "In git directory, please use 'git mv'"
		echo "Procced anyways? (y or n or git (for git mv)):"
		read response
		if [ $response == 'y' ]; then
			echo "$ mv "${@}""
			mv "${@}"
		else
			if [ $response == 'git' ]; then
				echo "$ git mv $@"
				git mv "${@}"
			fi
		fi
	else
		mv "${@}"
	fi
}
alias mv=check_git_repo_for_mv

# This function allows to to compare two files using git's diff config
# These files do not need to be in git repos
# You can pipe this into anything and have the output be nice
function diffc {
	git --no-pager diff --color=always --no-index "${1}" "${2}"
}

# search google with w3m
function google {
        IFS="+"
        export query="${@}"
        w3m http://google.com/search?q="${query}"
}

# swap a program in with the current terminal in i3
function swap {
	echo "${@}"
	swap_command="${@}"
	"${swap_command}" & disown; sleep 0.6; exit
}

user="\[$cyan\]\u\[$reset\]"
host="\[$purple\]\h\[$reset\]"
#path="\[$green\]\w\[$reset\]"
path="\[$light_green\]\W\[$reset\] \[$green\]\w\[$reset\]"
cur_branch="\[$bright_green\]\$(get_git_branch)\[$reset\]"
cur_repo="\[$red\]\$(get_repo_name)\[$reset\]"
line_join="\[$yellow\]@\[$reset\]"
export PS1="$user$line_join$host\n$path $cur_branch $cur_repo\n$ "

# bash vim mode
set -o vi

# Bash file path completion
# http://unix.stackexchange.com/questions/55203/bash-autocomplete-first-list-files-then-cycle-through-them
 [[ $- = *i* ]] && bind "C-TAB:menu-complete"
#bind TAB:menu-complete
bind '"\e[Z":menu-complete-backward'
#bind '"TAB":menu-complete-backward'
#bind "set show-all-if-ambiguous on"
#bind "set menu-complete-display-prefix on"

# ssh keychain
# Note, this only adds the ssh key 'id_rsa',
# I need a solution for multiple keys that may differ on different machines
eval `keychain --quiet --eval --agents ssh id_rsa`

# some more ls aliases
alias l='ls -1'
alias la='ls -la'

# Less with color and cancling if it will not scroll the terminal
alias lesss='less -XFR'

# Tree into less with color
alias treee='tree -C | less -XRF'

# make and pipe both stdout and stderr to less with color
alias makel='make 2>&1 | less -XFR'

# agl passes ag's output to less with color
alias agg='ag --pager="less -XFR"'

alias cppwd='pwd | tr "\n" " "  | xsel -i -b'

### VVVV DEFAULTS I NEED TO UNDERSTAND VVVV ###

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


