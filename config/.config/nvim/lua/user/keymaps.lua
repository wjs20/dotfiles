vim.g.mapleader = ' '
local map = vim.keymap.set
map('n', '<leader>h', '<cmd>wincmd h<cr>')
map('n', '<leader>j', '<cmd>wincmd j<cr>')
map('n', '<leader>k', '<cmd>wincmd k<cr>')
map('n', '<leader>l', '<cmd>wincmd l<cr>')
map('n', '<leader>o', '<cmd>wincmd o<cr>')
map('n', '<leader>ff', '<cmd>Files<cr>')
map('n', '<leader>fg', '<cmd>GFiles<cr>')
map('n', '<leader>pv', '<cmd>Ex<cr>')
map('n', '<leader>x', '<cmd>!chmod 700 %<cr>')
map('n', '<C-w>', '<cmd>w<cr>')

-- plugin specific

-- reload snippets file
map('n', '<leader>rs',  '<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>')

-- toggle git window
map('n', '<leader>gw', vim.cmd.Git)

-- toggle undotree
map('n', '<leader>ut', vim.cmd.UndotreeToggle)

-- toggle symbols outline
map('n', '<leader>st', vim.cmd.SymbolsOutline)
