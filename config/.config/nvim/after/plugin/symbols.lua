
local ok, _ = pcall(require, 'symbols-outline')
if not ok then
  print('symbol outline could not be loaded')
  return
end
opts = {
    position = "left",
    width = "20"
}
require('symbols-outline').setup(opts)
