" Adam Ryman .vimrc

"### Configure Vundle ###
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Other vim packages managed by Vundle


" Need to add comments for each of these
"Plugin 'Valloric/YouCompleteMe'

Plugin 'fatih/vim-go'

Plugin 'tpope/vim-fugitive'

Plugin 'sickill/vim-monokai'

Plugin 'mattn/emmet-vim'

Plugin 'godlygeek/tabular'

Plugin 'adamryman/twonote-vim'

Plugin 'marijnh/tern_for_vim'

Plugin 'tpope/vim-surround'

Plugin 'Raimondi/delimitMate'

Plugin 'easymotion/vim-easymotion'

Plugin 'scrooloose/nerdtree'

Plugin 'rking/ag.vim'

" Something wrong with python, see twonote
"Plugin 'FredKSchott/CoVim'

"Silly
Plugin 'natw/keyboard_cat.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"### End Configure Vundle ###
"
"### Start General Configuration ###

" Some Linux distributions set filetype /etc/vimrc
" This is to force them away
if exists("g:did_load_filettpes")
	filetype off
	filetype plugin indent off
endif

filetype plugin indent on

"remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e


"IMPORTANT!!!!
"For some resource monokai kills my html stlying
"I will need to look over that
"This is a hack to fix it
if !exists("AlreadySourced")
	colorscheme monokai
	syntax on
endif
:let AlreadySourced = 1

"syntax highlighting

"Show the number you are on and the relative distance of all numbers from your
"current line
set relativenumber
set number

"Show matching ({[]})
set showmatch

"Allows case insensitive searching with smart exceptions
set ignorecase
set smartcase

"Remove ycm preview
set completeopt -=preview

"Keybinding for switching windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Common mistakes now fixed
command! W w
command! Q q
command! WQ wq
command! Wq wq

"letting me see the string of commands
:set showcmd

"change my leader to space, using map allows me to see it with a \ in the
"Also space space to leader leader for DOUBLE COMMANDS
"showcmd space
map <space> <leader>
map <space><space> <leader><leader>

let maplocalleader = ","

"Quick quit and write
map <leader>q :q<enter>
map <leader>w :w<enter>

"Lets see how fast I can add stuff to my vimrc
map <leader>v :sp ~/.vimrc<enter>G

map <leader>o :sp<space>

"Resource current vimrc and current ftplugin
if !exists("*ReSource")
	function! ReSource()
		execute "source ~/.vimrc"
		execute "set filetype=" . &filetype
	endfunction
endif
map <leader>s :call ReSource()<enter>

"Allows me to edit the config of any filetype quickly
function! OpenFtpluginFile()
	execute ":sp ~/.vim/ftplugin/" . &filetype . ".vim"
endfunction
map <leader>f :call OpenFtpluginFile()<enter>

"Lets me see those tabs and spaces
set listchars=tab:>\ ,space:#
map <leader>t :set list!<enter>

"4 space tabs are nicer by default
set tabstop=4
set shiftwidth=4

"Global yank and put from system buffer / clipboard
"For more info http://stackoverflow.com/a/11489440
"System buffer
map <leader>' "+
"Quick system buffer put / clipboard
map <leader>p "+p

"Personal help file currently located at $HOME/.vim.helpfiles/new-commands.md
"Eventually learn how vim docs work and put it there
map <leader>h :sp $HOME/.vim/helpfiles/new-commands.md<enter>zRG

"TwoNote!
"map <leader>j :TwoNote<enter>

" I want faster macros
" So leader 1 will start recording a macro on key 2
" and leader 2 will play that back
map <leader>2 @2
map <leader>1 q2

" Set shell to be zsh interactive, I was having a problem where I could not
" use my zsh functions and aliases from vim, but this fixes it
" UPDATE This broke vim further, when external commands were ran, vim
" sometimes to be suspended tty output
" https://github.com/zaiste/vimified/issues/89
" set shell=/usr/bin/zsh\ -i
"

" Cannot record macro while using the below
" Go into command-line history rather than just command line
" Allows to do j and k to navigate history
nnoremap : q:i
nnoremap / q/i
nnoremap ? /



" Setting default yank to also go to the + register, which is the system
" clipboard. Not sure why clipboard=unnamed does not work (which would be the
" * register)
" This allows for yy to go to the clipboard, which is what I want for now. the
" whole <leader>' was getting pretty annoying to be honest
set clipboard=unnamedplus

" Do a string replacement of current visual selection
map <leader>/ yq:i%s/<Esc>pa/

" Ag settings
" LAg uses the location list
let g:ag_highlight=1
map <leader>n :LAg<Space>
"hi Search
":hi

" For some reason backspace was not backspacing text that was already written
" before that instance of insert mode
" this fixed it.
" Effected Asus ux305la with xubuntu
" http://stackoverflow.com/a/5019353
set backspace=indent,eol,start
