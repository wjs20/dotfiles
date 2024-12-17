vim.g.mapleader = ' '
local map = vim.keymap.set

-- window commands
map('n', '<leader>h', '<cmd>wincmd h<CR>')
map('n', '<leader>j', '<cmd>wincmd j<CR>')
map('n', '<leader>k', '<cmd>wincmd k<CR>')
map('n', '<leader>l', '<cmd>wincmd l<CR>')
map('n', '<leader>o', '<cmd>wincmd o<CR>')
map('n', '<leader>z', '<cmd>wincmd z<CR>')
map('n', '<leader>|', '<cmd>wincmd |<CR>')
map('n', '<leader>=', '<cmd>wincmd =<CR>')

-- open netrw
map('n', '<leader>ev', '<cmd>Vexplore<CR>')

-- make a file executable
map('n', '<leader>x', '<cmd>!chmod 700 %<CR>')

-- reload snippets file
map('n', '<leader>rs',  '<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>')

-- toggle undotree
map('n', '<F2>', '<cmd>UndoTreeToggle<CR>')

-- open vim fugitive
map('n', '<leader>g', '<cmd>vertical topleft Git<CR>')

-- convert html files to htmldjango filetype (for syntax highlighting)
map('n', '<leader>dj', '<cmd>set ft=htmldjango<CR>')

-- select last pasted text
map('n', 'gp', '`[v`]')

-- use Esc to switch to normal mode in vim terminal
map('t', '<Esc>', '<C-\\><C-n>')

-- yanks to system clipbaord
map('v', 'Y', '"+y')
map('n', 'gb', '<cmd>up | %bd | e#<CR>')
