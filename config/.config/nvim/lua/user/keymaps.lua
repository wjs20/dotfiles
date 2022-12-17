vim.g.mapleader = ' '
local map = vim.keymap.set
map('n', '<leader>h', '<cmd>wincmd h<cr>')
map('n', '<leader>j', '<cmd>wincmd j<cr>')
map('n', '<leader>k', '<cmd>wincmd k<cr>')
map('n', '<leader>l', '<cmd>wincmd l<cr>')
map('n', '<leader>ff', '<cmd>Files<cr>')
map('n', '<leader>fg', '<cmd>GFiles<cr>')
map('n', '<leader>fa', '<cmd>Ag<cr>')
map('n', '<leader>fv', '<cmd>Ex<cr>')
map('n', 'B', '^')
map('n', 'E', '$')
map('n', '$', '<nop>')
map('n', '^', '<nop>')
map('n', '<leader>x', '<cmd>!chmod u+x %<cr>')


