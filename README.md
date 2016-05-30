# dotfiles

For setting up a new dev box, currently for on top of a freshly install xubuntu instance

Inspiration taken from [zaqthefreshman/dotfiles](https://github.com/zaqthefreshman/dotfiles)

## Install

1. Basics
```
sudo apt-get install i3 git curl
mkdir ~/dotfiles
cd ~/dotfiles
git clone http://github.com/adamryman/dotfiles .
./setup
```

2. Change caps lock to Ctrl; Change Super_L to alt

```
// Do this carefully
sudo cp -R etc /
```

3. urxvt

```
sudo apt-get rxvt-unicode-256color xfonts-terminus xsel

// Copy urxvt setting files
// Do this carefully
sudo cp -R usr /
```

4. vim - from source [Follow this guide](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)

```
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    ruby-dev git

sudo apt-get remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common

cd ~/external
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install

sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim
```
5. Golang
```
sudo tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
```

6. Vim plugins
```
vim +PluginInstall +qall
vim +GoInstallBinaries +qall
```

7. YCM
```
sudo apt-get install build-essential cmake

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --gocode-completer --tern-completer
```

8. Other programs
```
sudo apt-get install keychain scrot feh keynav python-pip mercurial chromium
```

### Vimperator mapping space to leader

https://github.com/vimperator/vimperator-labs/issues/10

