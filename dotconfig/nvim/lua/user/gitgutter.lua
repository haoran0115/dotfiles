vim.cmd([[
let g:gitgutter_preview_win_floating=1

" set diff color
highlight link diffAdded   GitGutterAdd
highlight link diffChanged GitGutterChange
highlight link diffRemoved GitGutterDelete

"" check highlight group
"highlight GitGutterAdd              " default: links to DiffAdd
"highlight GitGutterAddLine          " default: links to DiffAdd
"highlight GitGutterChangeLine       " default: links to DiffChange
"highlight GitGutterDeleteLine       " default: links to DiffDelete
"highlight GitGutterChangeDeleteLine " default: links to GitGutterChangeLine
]])
