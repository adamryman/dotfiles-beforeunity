# Source local files, like paths
source ~/.local/before/.zshrc
alias less='less -r'

if { which evince $2> /dev/null };
	then alias pdf=evince
fi
# Things to know about my zsh/oh-my-zsh
# - Case insensitive by default
# - Auto updates by default
# - ls colors are default
# -

# Oh-My-Zsh
# https://github.com/robbyrussell/oh-my-zsh
# -----------------------------------------

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
HIST_STAMPS="yyyy/mm/dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras nvm vi-mode)

# User configuration
# ----------------------------------------

# I need to look into how paths work a bit more
PATH="/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:/usr/local/bin:/usr/bin::/usr/games:/usr/local/go/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# hub is a git wrapper that gives nice github commands
# alias git="hub"

alias ctags="/usr/local/Cellar/ctags/5.8_1/bin/ctags"

fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit && compinit

alias :q="exit"

export GOPATH=~/projects/go

export SPLUNK_HOME="/opt/splunk"

# Some temp git aliases
alias ch="git checkout "
alias gc="git commit -m "
alias ga="git add "
alias gs="git status"

# Adding for resourcing zshrc
alias reso="source ~/.zshrc"

# Adding for editing zshrc quickly
alias zshrc="vim ~/.zshrc"

# Color match for ag
alias ag="ag --color-match 91"

# VI MODE
# bindkey -v

# Delay is normally 0.4 seconds, this is 0.1 seconds. May cause issues
# increase if there are problems
# export KEYTIMEOUT=1

# Follow this tutorial and really understand it http://dougblack.io/words/zsh-vi-mode.html

# http://charlieharvey.org.uk/page/google_did_you_mean_from_the_terminal/
# Looks for 'the original' in a google search and prints google's spell check
# Seems to not work on search if it only has 'did you mean'
# Need to learn regex to improve this, also add multiword arguments
# I had to wrap 'https://goo... with quotes for zsh
gsc() {
	q=$1
	lynx -dump 'https://www.google.com/search?q='$q | grep -e 'the original' | perl -nE 's/.*\]([^\.]+)\..*/$1/;print';
}

# http://stackoverflow.com/questions/6348387/how-to-quote-strings-in-file-names-in-zsh-passing-back-to-other-scripts
# http://unix.stackexchange.com/questions/228501/expand-parameter-in-quotes-in-zsh
# Command substitution is weird
# somehow the "$(echo ${(qq)@)" is getting the arguments, in a quoted list
# Then the emulate bash -c is able to break these apart but keep the quotes
# Then the process gets disowned, a sleep happens for the window manager to catch up
# then the terminal exits
# swapping the terminal with the new application
swap() {
	swap_command="$(echo ${(qq)@})"
	emulate bash -c "$swap_command" & disown; sleep 0.6; exit
}

# ssh to my server
alias web="ssh adamryman@adamryman.com"

# Change to current "real" path, ie cd to symlink and call this to be in the full path of the where the sym link points to

alias cdreal="cd $(realpath $PWD)"

# Run and compile all go files
# TODO: Exclude test files
alias gogo="go run *.go"

# Switch between different JDK https://wimdeblauwe.wordpress.com/2014/03/20/switching-easily-between-java-jdks-on-mac-os-x/
alias setJdk6='export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)'
alias setJdk7='export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)'
alias setJdk8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'

export ambition="/home/adamryman/projects/go/src/github.com/adamryman/ambition"

searchcmd() {
	query="$@"
	cat .zsh_history | ag $query
}

currentpermissions() {
	stat -c "%a %n" $@
}


export NVM_DIR="/home/adamryman/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
