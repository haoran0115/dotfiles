-- keybindings
vim.cmd([[
let mapleader=","   " leader key
map <Leader>t <CMD>ToggleTerm<CR>
tnoremap <Leader>t <CMD>ToggleTerm<CR>
nmap <Leader>d <CMD>NERDTreeToggle<CR>
nnoremap j gj
nnoremap k gk
nnoremap <TAB> :tabnext<CR>
nnoremap <S-TAB> :tabprevious<CR>
noremap <Leader>v :vert split
noremap <Leader>s :split
noremap <Leader>V :topleft vert split
noremap <Leader>source :source $MYVIMRC
noremap <Leader>rc :e $MYVIMRC
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-Up> :res +2<CR>
noremap <C-Down> :res -2<CR>
noremap <C-Left> :vert res +2<CR>
noremap <C-Right> :vert res -2<CR>
tnoremap <Esc> <C-\><C-n>
]])