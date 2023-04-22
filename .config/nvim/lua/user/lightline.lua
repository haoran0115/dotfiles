-- bottom bar
vim.cmd([[
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night_Eighties',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
set noshowmode
]])
