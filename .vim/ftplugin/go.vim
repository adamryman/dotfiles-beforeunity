" Build go files quickly
map <leader>b :GoBuild<Return>

" Lets get those imports
map <leader>i :GoImports<Return>

" Go def and return
map <leader><Return> :GoDef<Return>
map <leader>\ <c-t>

" Go to next error in quickfix message
map <leader>j :cn<Return>
map <leader>k :cp<Return>

" Run!
map <leader>a :GoRun<Return>
