source $HOME/.before/vimrc

" Be vim instead of vi
set nocompatible

" Line {{{ ----------------------------------------------------------------
" Show lines numbers that are  relative to the cursor position
" Show the actual line number on the current line

set relativenumber
set number

" }}}
" Colors {{{ --------------------------------------------------------------

syntax on
colorscheme monokai

" }}}
" Search {{{ --------------------------------------------------------------

" Highlight matching search terms
set hlsearch
" Set search register to empty string, clearing search
nnoremap <Bslash> :let @/ = ""<Return>

" }}}
" Code specific {{{ --------------------------------------------------------------

"shows matching ({[]})
set showmatch

" }}}
" Windowing {{{ -----------------------------------------------------------

"Keybinding hotkeys for switching windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" }}} 

source $HOME/.after/vimrc
" vim:foldmethod=marker:foldlevel=0
