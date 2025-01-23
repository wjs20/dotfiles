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
-- 'bufclear'
map('n', '<leader>bc', '<cmd>up | %bd | e#<CR>')

map('n', '<leader>sl', ':.lua<CR>')
map('n', '<leader>sf', ':%lua<CR>')

map('n', '<leader>pt', '<cmd>vs term://pytest<CR>')

-- '/dev/null' like mapping. Deletes lines without putting them in unnamed reg
map('n', 'd_', '"_dd')
