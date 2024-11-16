-- keybindings
vim.g.mapleader = ","
-- toogle term
vim.keymap.set('n', '<Leader>t', '<CMD>ToggleTerm<CR>')
vim.keymap.set('t', '<Leader>t', '<CMD>ToggleTerm<CR>')
-- j --> gj, k --> gk
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
-- map TAB to move around buffers
vim.keymap.set('n', '<TAB>', '<CMD>bn<CR>')
vim.keymap.set('n', '<S-TAB>', '<CMD>bp<CR>')
-- split
vim.keymap.set('n', '<Leader>v', ':vert split')
vim.keymap.set('n', '<Leader>V', ':topleft vert split')
vim.keymap.set('n', '<Leader>s', ':split')
-- move between splits
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
-- adjust window size
vim.keymap.set('n', '<C-Up>', '<CMD>res +2<CR>')
vim.keymap.set('n', '<C-Down>', '<CMD>res -2<CR>')
vim.keymap.set('n', '<C-Left>', '<CMD>vert res +2<CR>')
vim.keymap.set('n', '<C-Right>', '<CMD>vert res -2<CR>')
-- remap <ESC>
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')
-- vimrc
vim.keymap.set('n', '<Leader>rc', ':e $MYVIMRC')
vim.keymap.set('n', '<Leader>so', ':so $MYVIMRC')
-- nvim-tree
vim.keymap.set('n', '<Leader>d',  '<CMD>NvimTreeToggle<CR>')
-- shift TAB
vim.keymap.set('i', '<S-Tab>', '<C-D>')
-- delete buffer
vim.keymap.set('n', '<Leader>q',  ':bd <CR>')
-- save file
vim.keymap.set('n', '<Leader>w',  ':w <CR>')
-- remove search highlight
vim.keymap.set('n', '<Leader>h', ':noh <CR>')

