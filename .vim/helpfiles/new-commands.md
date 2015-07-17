#Vim commands and descriptions as I learn them

As I have learned more and more vim commands I find myself having to search though docs to see something that I have learned. So I am going to add them here as a reference.

To get here with my `.vimrc` just press `<leader>h`

##Commands

 Command    | Context          | Result
---------   | ---------        | --------------------------------------------------------
 do         | diff             | Take from change from other window into current window
 t*c*, T*c* | normal           | move cursor to character before next, previous instance of character *c*
 gq         | visual selection | Wraps lines to set line wrap about default 80 characters. Well do comments too
 gqq        | normal           | ^^^ but only on current line
