require('user')
require('config.lazy')

vim.o.background = "dark" -- or "light" for light mode

vim.cmd('colorscheme gruvbox')
vim.cmd('packadd! nohlsearch')
vim.cmd('packadd! nvim.difftool')


vim.diagnostic.config({
  float = {
    border = "rounded",
    source = "if_many",
    header = "",
    prefix = "",
  }
})
