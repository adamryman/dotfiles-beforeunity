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

Plugin 'sickill/vim-monokai'
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

"syntax highlighting
syntax on

colorscheme monokai

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

"Spellchecking
"autocmd tells me that I should be able to include multiple patterns with the
"comma but it does not seem to work, also no way to for tolower without a
"function
:autocmd BufRead,BufNewFile txt :setlocal spell spelllang=en_us
:autocmd BufRead,BufNewFile *.md :setlocal spell spelllang=en_us
:autocmd BufRead,BufNewFile *.MD :setlocal spell spelllang=en_us

