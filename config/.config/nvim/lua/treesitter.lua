require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "lua", "rust", "vim" },
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
}
