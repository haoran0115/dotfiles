-- compatibility
vim.cmd([[
set nocompatible
set backspace=indent,eol,start
set shiftwidth=4
set tabstop=4
set number
set ruler
set autoindent
set expandtab
set incsearch
]])


-- appearance
vim.cmd([[
if (empty($TMUX))                   " 24bit true color
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
set cursorline " highlight current line
colorscheme onedark
set background=dark                 " dark background & remove background color
hi Normal   guibg=NONE ctermbg=NONE
hi Terminal guibg=NONE ctermbg=NONE
]])

-- view related settings
vim.cmd([[
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview 
]])

-- terminal & debugger
vim.cmd([[
packadd termdebug                                     " enable debugger
autocmd TermOpen * setlocal nonumber                  " remove line numbers before terminal
autocmd TermOpen * startinsert                        " enter insert mode in terminal directly
autocmd BufWinEnter,WinEnter term://* startinsert
let g:termdebug_wide=1                                " Termdebug vertical split
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
]])

