-- compatibility
vim.cmd([[
set encoding=UTF-8
set nocompatible
set backspace=indent,eol,start
set shiftwidth=4
set tabstop=4
set number
set numberwidth=1
set ruler
set autoindent
set expandtab
set incsearch
set signcolumn=yes:1
set noshowmode
set cursorline
set scrolloff=4 " keep 3 lines below and above the cursor
]])


-- view related settings
vim.cmd([[
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview 
]])

vim.cmd([[
packadd termdebug                                     " enable debugger
autocmd TermOpen * setlocal nonumber                  " remove line numbers before terminal
autocmd TermOpen * setlocal scl=no                  " remove sign column
autocmd TermOpen * startinsert                        " enter insert mode in terminal directly
"autocmd BufWinEnter,WinEnter term://* startinsert
let g:termdebug_wide=1                                " Termdebug vertical split
let g:termdebugger="gdb"
]])

-- files
vim.cmd([[
" filetype plugin indent on
set autoread                " auto reload file
let fortran_do_enddo=1      " fortran language config
let fortran_free_source=1
let fortran_have_tabs=1
let fortran_more_precise=1
let fortran_indent_less=1
let fortran_linter=2
autocmd FileType fortran setlocal expandtab
autocmd FileType fortran setlocal shiftwidth=2
autocmd FileType fortran setlocal tabstop=2
autocmd BufNewFile,BufRead *.cuf set ft=fortran
autocmd BufNewFile,BufRead *.CUF set ft=fortran

" update time for file (also applied to vim-gitgutter, i.e., git diff)
set updatetime=1000
]])

