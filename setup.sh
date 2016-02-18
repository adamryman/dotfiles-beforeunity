#/bin/bash

# Sym linking dotfiles. Need to add stuff for local files

cwd=$(pwd)

git submodule update --init --recursive

# Path stuff
cp -rn "${cwd}/.local" "$HOME"
mkdir -p "$HOME/.config"

# Let us be explicit with our links

# Good old vim
ln -sf "${cwd}/.vimrc" "$HOME/.vimrc"

# Filetype specific things for vim
mkdir -p "$HOME/.vim/"
ln -sfn "${cwd}/.vim/ftplugin/" "$HOME/.vim/"

# Personal vim help file
mkdir -p "$HOME/.vim/"
ln -sfn "${cwd}/.vim/helpfiles/" "$HOME/.vim/"

# Vundle, used to install all my plugins
mkdir -p "$HOME/.vim/bundle/"
ln -sfn "${cwd}/.vim/bundle/Vundle.vim" "$HOME/.vim/bundle/"

# vimperator is a firefox extension that is awesome.
# It makes firefox 99% mouse free. 100% recommend.
ln -sf "${cwd}/.vimperatorrc" "$HOME/.vimperatorrc"

# bashrc. This needs some work.
ln -sf "${cwd}/.bashrc" "$HOME/.bashrc"

# Right now I am using zsh with oh-my-zsh, may cut this down at some point to
# something I can fully understand. Also bash is more portable so maybe I
# should just customize bash instead
ln -sf "${cwd}/.zshrc" "$HOME/.zshrc"

ln -sfn "${cwd}/.zsh/" "$HOME/"

mkdir -p "$HOME/.oh-my-zsh/plugins/vi-mode/"
ln -sfn "${cwd}/.oh-my-zsh/plugins/vi-mode/vi-mode.plugin.zsh" "$HOME/.oh-my-zsh/plugins/vi-mode/vi-mode.plugin.zsh"

# Window manager configuration and plugins
ln -sfn "${cwd}/i3/" "$HOME/.config/i3"

# Folder for custom scripts
mkdir -p "$HOME/.config/dotfile_scripts/"

# Script for screenshots, must have dropbox setup and scrot installed
ln -sf "${cwd}/scrotbox.sh" "$HOME/.config/dotfile_scripts/scrotbox.sh"

# Script for launching urxvt from the same place as the current terminal
ln -sfn "${cwd}/fromhere.sh" "$HOME/.config/dotfile_scripts/fromhere.sh"

# Script for google spell checking what is currently in my clipboard
ln -sfn "${cwd}/gsc" "$HOME/.config/dotfile_scripts/gsc.sh"

# These are for changing the keyboard on a mac for debian. These will
# eventually only be in a specific branch
# Makes command key into control key
# I am not actually using the super key at all
# terminator config
ln -sf "${cwd}/.xinitrc" "$HOME/.xinitrc"
ln -sf "${cwd}/.Xmodmap" "$HOME/.Xmodmap"

# Mostly urxvt config
ln -sf "${cwd}/.Xresources" "$HOME/.Xresources"

# terminator config
ln -sfn "${cwd}/.config/terminator" "$HOME/.config/terminator"

# fonts config
# I don't know what this config does exactly, but my fonts look way better
# Might want to copy ubuntu / xubuntu's version of this file
ln -sfn "${cwd}/.config/fontconfig" "$HOME/.config/fontconfig"

# w3m config - terminal web browser
# pretty cool, might have sold me on emacs
mkdir -p $HOME/.w3m
ln -sf "${cwd}/.w3m/keymap" "$HOME/.w3m/keymap"

# xfce4-terminal seems good enough
mkdir -p "$HOME/.config/xfce4/terminal"
ln -sf "${cwd}/.config/xfce4/terminal/terminalrc" "$HOME/.config/xfce4/terminal/terminalrc"
