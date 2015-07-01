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
