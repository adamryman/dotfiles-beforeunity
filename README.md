#dotfiles

For setting up a new dev box

You must give setup.sh execute privileges in order to run them.

This will create a bunch of sym links from where these dotfiles usually live to this repo


```shell
chmod a+x setup.sh
```

Inspiration taken from [zaqthefreshman/dotfiles](https://github.com/zaqthefreshman/dotfiles)

### Change caps lock to Ctrl

For base linux agetty to change caps lock to escape you edit `/etc/default/keyboard` and change

```
XKBOPTIONS="ctrl:nocaps"
```

### Vimperator mapping space to leader

https://github.com/vimperator/vimperator-labs/issues/10

### TODO

- Add local things to sym linking script
- Flesh out the idea of having ~/.local/before and ~/.local/after and source these files at the start and end of each dotfile
	- For paths so that machines can have locally different paths
	- Make a good default path for each one, but these files will be copied
- Add Vundle as a submodule or at least enough Vundle to bootstrap
- Comment .zshrc
- Comment .bashrc
- Comment plugin section of .vimrc
- Create a lightwight option of .vimrc
