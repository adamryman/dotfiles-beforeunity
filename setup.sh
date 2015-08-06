#/bin/bash

# Sym linking dotfiles. Need to add stuff for local files

cwd=$(pwd)

# Backup for old things
mkdir -p "$HOME/.__backup/dotfiles/"

# Path stuff
cp -rn "${cwd}/.local" "$HOME"
mkdir -p "$HOME/.config"

# Let us be explicit with our links

# Good old vim
ln -sf "${cwd}/.vimrc" "$HOME/.vimrc"

# Filetype specific things for vim
mkdir -p "$HOME/.vim/"
mv -n "$HOME/.vim/ftplugin" "$HOME/.__backup/dotfiles/"
ln -sfn "${cwd}/.vim/ftplugin/" "$HOME/.vim/"

# Personal vim help file
mkdir -p "$HOME/.vim/"
mv -n "$HOME/.vim/helpfiles" "$HOME/.__backup/dotfiles/"
ln -sfn "${cwd}/.vim/helpfiles/" "$HOME/.vim/"

# Vundle, used to install all my plugins
mkdir -p "$HOME/.vim/bundle/"
mv -n "$HOME/.vim/bundle/Vundle.vim" "$HOME/.__backup/dotfiles/Vundle.vim"
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

mv -n "$HOME/.zsh" "$HOME/.__backup/dotfiles/"
ln -sfn "${cwd}/.zsh/" "$HOME/"

# Window manager configuration and plugins
mv -n "$HOME/.i3" "$HOME/.__backup/dotfiles/"
ln -sfn "${cwd}/.i3/" "$HOME/"

# These are for changing the keyboard on a mac for debian. These will
# eventually only be in a specific branch
# Makes command key into control key
# I am not actually using the super key at all
# terminator config
ln -sf "${cwd}/.xinitrc" "$HOME/.xinitrc"
ln -sf "${cwd}/.Xmodmap" "$HOME/.Xmodmap"

# terminator config
mv -n "$HOME/.config/terminator" "$HOME/.__backup/dotfiles/"
ln -sf "${cwd}/.config/terminator" "$HOME/.config/terminator"
