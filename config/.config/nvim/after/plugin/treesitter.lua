local ok, nvim_treesitter = pcall(require, 'nvim-treesitter')
if not ok then
  print('could not load treesitter')
  return
end

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "lua", "rust", "vim", "bash" },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    disable = { "gitignore" },
    additional_vim_regex_highlighting = false,
  },
}
