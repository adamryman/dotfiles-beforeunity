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
Plugin 'Valloric/YouCompleteMe'

Plugin 'fatih/vim-go'

Plugin 'tpope/vim-fugitive'

Plugin 'sickill/vim-monokai'

Plugin 'mattn/emmet-vim'

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
:map <space> <leader>
:map <space><space> <leader><leader>

"Quick quit and write
:map <leader>q :q<enter>
:map <leader>w :w<enter>

"Lets see how fast I can add stuff to my vimrc
:map <leader>v :sp ~/.vimrc<enter>G

:map <leader>o :sp<space>

"Resource current vimrc and current ftplugin
if !exists("*ReSource")
	function! ReSource()
		execute "source ~/.vimrc"
		execute "set filetype=" . &filetype
	endfunction
endif
:map <leader>s :call ReSource()<enter>

"Allows me to edit the config of any filetype quickly
function! OpenFtpluginFile()
	execute ":sp ~/.vim/ftplugin/" . &filetype . ".vim"
endfunction
:map <leader>f :call OpenFtpluginFile()<enter>

"Lets me see those tabs and spaces
set listchars=tab:>\ ,space:#
:map <leader>t :set list!<enter>
