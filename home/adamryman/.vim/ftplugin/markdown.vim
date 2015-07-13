"Spell checking
:setlocal spell spelllang=en_us

function! RenderMarkdown()
	silent ! mkdir -p render; pandoc -o render/%.html %; firefox render/%.html
	redraw!
endfunction
:map <leader><leader>r :call RenderMarkdown()<enter>
