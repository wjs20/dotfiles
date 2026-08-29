require('user')
require('config.lazy')

vim.o.background = "dark" -- or "light" for light mode

vim.cmd('colorscheme gruvbox')
vim.cmd('packadd! nohlsearch')
vim.cmd('packadd! nvim.difftool')
vim.cmd('packadd! nvim.undotree')
