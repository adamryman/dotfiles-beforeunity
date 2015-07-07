set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab


function! ToggleViewWhitespace()
	if &list ==# "0"
		set list
		set listchars=tab:>\ ,space:#
		echo "did it work?"
	else
		set nolist
		echo "Should not see whitespace now"
	endif
endfunction

"So this command switches for youcompleteme to eclim, but it seems to fail, so
"I added a function to set it again if it does fail
set completefunc=eclim#java#complete#CodeComplete
function! SetEclim()
	set completefunc=eclim#java#complete#CodeComplete
endfunction

"Autocomplete with leader.
map <leader>. a<c-x><c-u>

map <leader>j :Java<enter>
