local ok, nvim_treesitter = pcall(require, 'nvim-treesitter')
if not ok then
  print('could not load treesitter')
  return
end

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "help", "python", "lua", "rust", "vim", "sql", "bash" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
