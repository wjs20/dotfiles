vim.g.mapleader = ' '
local map = vim.keymap.set
map('n', '<leader>h', '<cmd>wincmd h<CR>')
map('n', '<leader>j', '<cmd>wincmd j<CR>')
map('n', '<leader>k', '<cmd>wincmd k<CR>')
map('n', '<leader>l', '<cmd>wincmd l<CR>')
map('n', '<leader>o', '<cmd>wincmd o<CR>')
map('n', '<leader>\\', '<cmd>wincmd |<CR>')
map('n', '<leader>=', '<cmd>wincmd =<CR>')
map('n', '<leader>ff', '<cmd>Files<CR>')
map('n', '<leader>fg', '<cmd>GFiles<CR>')

-- open netrw
map('n', '<leader>pv', '<cmd>Ex<CR>')

-- make a file executable
map('n', '<leader>x', '<cmd>!chmod 700 %<CR>')

-- open filename under cursor
map('n', 'gf', '<cmd>e <cfile><CR>')

-- reload snippets file
map('n', '<leader>rs',  '<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>')

-- toggle git window
map('n', '<leader>gw', vim.cmd.Git)

-- toggle undotree
map('n', '<leader>ut', vim.cmd.UndotreeToggle)

-- toggle symbols outline
map('n', '<leader>so', vim.cmd.SymbolsOutline)

-- convert html files to htmldjango filetype (for syntax highlighting)
map('n', '<leader>dj', '<cmd>set ft=htmldjango<CR>')
