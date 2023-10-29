local ok, _ = pcall(require, 'colorizer')
if not ok then
  print('colorizer could not be loaded')
  return
end

require 'colorizer'.setup {
  'css';
  'javascript';
  html = {
    mode = 'foreground';
  }
}
