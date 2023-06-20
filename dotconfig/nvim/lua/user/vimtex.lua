-- vimtex settings
vim.g.vimtex_view_method = 'zathura'
-- vim.g.vimtex_indent_enabled = 0
vim.cmd([[
let g:vimtex_indent_enabled = 0
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '--shell-escape',
    \ ],
    \}
]])
