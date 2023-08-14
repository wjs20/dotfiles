local ok, _ = pcall(require, 'nvim-surround')
if not ok then
  print('nvim-surround could not be loaded')
  return
end
require('nvim-surround').setup()
