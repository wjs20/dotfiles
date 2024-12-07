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

-- open filename under cursor
map('n', 'gf', '<cmd>e <cfile><CR>')

-- reload snippets file
map('n', '<leader>rs',  '<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>')

map('n', '<F2>', vim.cmd.UndotreeToggle)
map('n', '<F3>', vim.cmd.Git)

-- convert html files to htmldjango filetype (for syntax highlighting)
map('n', '<leader>dj', '<cmd>set ft=htmldjango<CR>')

-- select last pasted text
map('n', 'gp', '`[v`]')

-- use Esc to switch to normal mode in vim terminal
map('t', '<Esc>', '<C-\\><C-n>')
