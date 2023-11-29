local ok, _ = pcall(require, 'gruvbox')
if not ok then
  print('colourscheme could not be loaded')
  return
end

require("gruvbox").setup({})

vim.cmd([[colorscheme gruvbox]]) -- nightxx colors have a weird effect on indent-blankline plugin
