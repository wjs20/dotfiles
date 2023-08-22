vim.g.mapleader = ' '
local map = vim.keymap.set
map('n', '<leader>h', '<cmd>wincmd h<CR>')
map('n', '<leader>j', '<cmd>wincmd j<CR>')
map('n', '<leader>k', '<cmd>wincmd k<CR>')
map('n', '<leader>l', '<cmd>wincmd l<CR>')
map('n', '<leader>o', '<cmd>wincmd o<CR>')
map('n', '<leader>ff', '<cmd>Files<CR>')
map('n', '<leader>fg', '<cmd>GFiles<CR>')
map('n', '<leader>pv', '<cmd>Ex<CR>')
map('n', '<leader>x', '<cmd>!chmod 700 %<CR>')
map('n', 'gf', '<cmd>e <cfile><CR>')
map('n', '<leader>dd', 'ggdG')
map('i', '<C-w>', '<esc><cmd>w<cr>')

-- plugin specific

-- reload snippets file
map('n', '<leader>rs',  '<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>')

-- toggle git window
map('n', '<leader>gw', vim.cmd.Git)

-- toggle undotree
map('n', '<leader>ut', vim.cmd.UndotreeToggle)

-- toggle symbols outline
map('n', '<leader>st', vim.cmd.SymbolsOutline)
