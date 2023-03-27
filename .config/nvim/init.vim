set nocompatible
set backspace=indent,eol,start

set shiftwidth=4
set tabstop=4
set number
set ruler
set autoindent
set expandtab
set incsearch

" " cursor
" set guicursor=
" highlight current line
set cursorline
" highlight vertical 80 characters bar
"set colorcolumn=80

" terminal & debugger
" enable debugger
packadd termdebug
" remove line numbers before terminal
autocmd TermOpen * setlocal nonumber norelativenumber
" enter insert mode in terminal directly
autocmd TermOpen * startinsert
autocmd BufWinEnter,WinEnter term://* startinsert
" map Esc to exit terminal mode
tnoremap <Esc> <C-\><C-n>
" Termdebug vertical split
let g:termdebug_wide=1

" auto realod
set autoread

" leader key
let mapleader=","


" " cuda debugger
" let g:termdebugger = 'cuda-gdb'

"" native word completion
"if has('unix')
"    set dictionary+=/usr/share/dict/words
"else
"    set dictionary+=~/AppData/Local/nvim/words
"endif
"set complete+=k

call plug#begin()
    Plug 'joshdick/onedark.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'preservim/NERDTree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'lervag/vimtex'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    "Plug 'voldikss/vim-floaterm'
    Plug 'akinsho/toggleterm.nvim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'bfrg/vim-cpp-modern'
    Plug 'tpope/vim-commentary'
    Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
call plug#end()

" toggleterm
lua require("toggleterm").setup()
map <Leader>t <CMD>ToggleTerm<CR>
tnoremap <Leader>t <CMD>ToggleTerm<CR>

"" vimtex settings
" vimtex default viewer
" let g:vimtex_view_general_viewer = "sumatrapdf.sh"
" let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_method = 'zathura'
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


" toggleterm

"" costum shortcuts
" NERDTree configuration
nmap <Leader>d <CMD>NERDTreeToggle<CR>
" j --> gj
" k --> gk
nnoremap j gj
nnoremap k gk
" map TAB to switch between tabs
nnoremap <TAB> :tabnext<CR>
nnoremap <S-TAB> :tabprevious<CR>
" " terminal commands
" noremap <Leader>vt
" " noremap <Leader>st :split terminal
" vertical split and split
noremap <Leader>v :vert split
noremap <Leader>s :split
noremap <Leader>V :topleft vert split

" edit vimrc & source vimrc shortcuts
noremap <Leader>source :source $MYVIMRC
noremap <Leader>rc :e $MYVIMRC

"" floaterm
"let g:floaterm_keymap_new = '<Leader>nt'
"let g:floaterm_keymap_toggle = '<Leader>t'

" " fzf
" noremap <Leader>f :Files<CR>
" tnoremap <Leader>f :Files<CR>
" adjust windows size
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-Up> :res +2<CR>
noremap <C-Down> :res -2<CR>
noremap <C-Left> :vert res +2<CR>
noremap <C-Right> :vert res -2<CR>
" noremap <C-Up> <C-w>+
" noremap <C-Down> <C-w>-
" noremap <C-Left> <C-w>>
" noremap <C-Right> <C-w><



" " map Ctrl to move entier row
" nnoremap <C-Down> :m .+1<CR>==
" nnoremap <C-Up> :m .-2<CR>==
" inoremap <C-Down> <Esc>:m .+1<CR>==gi
" inoremap <C-Up> <Esc>:m .-2<CR>==gi
" vnoremap <C-Down> :m '>+1<CR>gv=gv
" vnoremap <C-Up> :m '<-2<CR>gv=gv
"

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" colorschemes
syntax on
" onedark
colorscheme onedark
" " everforest
" if has('termguicolors')
"       set termguicolors
" endif
" set background=light
" let g:everforest_better_performance = 1
" colorscheme everforest
" dark background & remove background
set background=dark
hi Normal   guibg=NONE ctermbg=NONE
hi Terminal guibg=NONE ctermbg=NONE
" hi CursorLine cterm=underline term=underline ctermbg=NONE guibg=NONE

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" fortran language config
let fortran_do_enddo=1
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

" bottom bar
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
set noshowmode

" shift + TAB
" inoremap <S-TAB> <C-d>

""" coc.nvim
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

