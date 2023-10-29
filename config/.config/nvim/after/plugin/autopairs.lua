local ok, _ = pcall(require, 'nvim-autopairs')
if not ok then
  print('nvim-autopairs could not be loaded')
  return
end
require("nvim-autopairs").setup()
