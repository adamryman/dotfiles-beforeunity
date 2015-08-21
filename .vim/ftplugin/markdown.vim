"Spell checking
setlocal spell spelllang=en_us

function! RenderMarkdown()
	let renderpath=expand('%:p:h') . "/"
	let filename=expand('%:t')
	let fullfilepath=expand('%:p')
	execute "silent ! mkdir -p " . renderpath ."__render; pandoc -o " . renderpath . "__render/" . filename . ".html " . fullfilepath
	redraw!
endfunction

function! OpenInFirefox()
	let renderpath=expand('%:p:h') . "/"
	let filename=expand('%:t')
	execute "silent ! firefox " . renderpath . "__render/" . filename . ".html"
	redraw!
endfunction

" For opening the render in firefox and rerendering it
"map <leader><leader>j :call RenderMarkdown()<enter>
"map <leader><leader>f :call OpenInFirefox()<enter>

" Allows me to align pandoc pipe tables using Tabularize
"map <leader><leader>t :Tab /\|<enter>
