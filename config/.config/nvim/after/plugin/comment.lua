local ok, _ = pcall(require, 'Comment')
if not ok then
  print('Comment could not be loaded')
  return
end
require('Comment').setup()
