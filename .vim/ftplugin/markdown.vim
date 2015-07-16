"Spell checking
:setlocal spell spelllang=en_us

function! RenderMarkdown()
	silent ! mkdir -p __render; pandoc -o __render/%.html %
	redraw!
endfunction
:map <leader><leader>j :call RenderMarkdown()<enter>
:map <leader><leader>f :silent ! firefox ./__render/%.html<enter>:redraw!<enter>
