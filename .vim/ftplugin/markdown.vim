"Spell checking
:setlocal spell spelllang=en_us

function! RenderMarkdown()
	silent ! mkdir -p __render; pandoc -o __render/%.html %; firefox ./__render/%.html
	redraw!
endfunction
:map <leader><leader>r :call RenderMarkdown()<enter>
