local ok, oil = pcall(require, 'oil')
if not ok then
  print('oil plugin could not be loaded')
  return
end


oil.setup{}

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
