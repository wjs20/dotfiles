local ok, monokai = pcall(require, 'monokai')
if not ok then
  print('colourscheme could not be loaded')
  return
end

require('monokai').setup({ italics = false })
