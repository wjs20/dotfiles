vim.g.mapleader = ' '
local map = vim.keymap.set

-- window commands
map('n', '<leader>h', '<cmd>wincmd h<CR>')
map('n', '<leader>j', '<cmd>wincmd j<CR>')
map('n', '<leader>k', '<cmd>wincmd k<CR>')
map('n', '<leader>l', '<cmd>wincmd l<CR>')
map('n', '<leader>o', '<cmd>wincmd o<CR>')
map('n', '<leader>z', '<cmd>wincmd z<CR>')
map('n', '<leader>w', '<cmd>wincmd w<CR>')
map('n', '<leader>|', '<cmd>wincmd |<CR>')
map('n', '<leader>=', '<cmd>wincmd =<CR>')

-- open netrw
map('n', '<leader>ev', '<cmd>Vexplore<CR>')

-- make a file executable
map('n', '<leader>x', '<cmd>!chmod 700 %<CR>')

-- reload config file
map('n', '<leader>r', '<cmd>ru %<CR>')

-- reload snippets file
map('n', '<leader>rs', '<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>')

-- open vim fugitive
map('n', '<leader>g', '<cmd>vertical topleft Git<CR>')

-- convert html files to htmldjango filetype (for syntax highlighting)
map('n', '<leader>dj', '<cmd>set ft=htmldjango<CR>')

-- select last pasted text
map('n', 'gp', '`[v`]')

-- terminal mappings
map('n', '<leader>t', '<cmd>b term<CR>')
map('t', '<Esc>', '<C-\\><C-n>')

map('t', '<A-h>', '<C-\\><C-N><C-w>h')
map('t', '<A-j>', '<C-\\><C-N><C-w>j')
map('t', '<A-k>', '<C-\\><C-N><C-w>k')
map('t', '<A-l>', '<C-\\><C-N><C-w>l')

map('i', '<A-h>', '<C-\\><C-N><C-w>h')
map('i', '<A-j>', '<C-\\><C-N><C-w>j')
map('i', '<A-k>', '<C-\\><C-N><C-w>k')
map('i', '<A-l>', '<C-\\><C-N><C-w>l')

map('n', '<A-h>', '<C-w>h')
map('n', '<A-j>', '<C-w>j')
map('n', '<A-k>', '<C-w>k')
map('n', '<A-l>', '<C-w>l')

-- yanks to system clipbaord
map('v', 'Y', '"+y')

-- source lua lines/files
map('n', '<leader>sl', '<cmd>.lua<CR>')
map('n', '<leader>sf', '<cmd>%lua<CR>')

map('n', '<leader>pt', '<cmd>vs term://pytest<CR>')

-- open a terminal split
map('n', '\\', '<cmd>vs term://zsh<CR>')

-- toggle scrollbind
map('n', 'yos', "<cmd>setlocal scb! scb?<CR>")

map('n', ',w', '<cmd>wqall<CR>')

map('i', '<F2>', '<Esc>:w<CR>a')
