#/bin/bash

# Sym linking dotfiles. Need to add stuff for local files

cwd=$(pwd)

# Let us be explicit with our links

# Good old vim
ln -sf "${cwd}/.vimrc" "$HOME/.vimrc"

# Filetype specific things for vim
ln -sf "${cwd}/.vim/ftplugin/" "$HOME/.vim/ftplugin"

# Personal vim help file
ln -sf "${cwd}/.vim/helpfiles/" "$HOME/.vim/helpfiles"

# vimperator is a firefox extension that is awesome.
# It makes firefox 99% mouse free. 100% recommend.
ln -sf "${cwd}/.vimperatorrc" "$HOME/.vimperatorrc"

# bashrc. This needs some work.
ln -sf "${cwd}/.bashrc" "$HOME/.bashrc"

# Right now I am using zsh with oh-my-zsh, may cut this down at some point to
# something I can fully understand. Also bash is more portable so maybe I
# should just customize bash instead
ln -sf "${cwd}/.zshrc" "$HOME/.zshrc"
ln -sf "${cwd}/.zsh/" "$HOME/.zshrc"

# Window manager configuration and plugins
ln -sf "${cwd}/.i3/" "$HOME/.i3/"

# These are for changing the keyboard on a mac for debian. These will
# eventually only be in a specific branch
# Makes command key into control key
# I am not actually using the super key at all
ln -sf "${cwd}/.xinitrc" "$HOME/.xinitrc"
ln -sf "${cwd}/.Xmodmap" "$HOME/.Xmodmap"
