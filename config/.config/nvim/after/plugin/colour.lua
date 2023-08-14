local ok, _ = pcall(require, 'tokyonight')
if not ok then
  print('colourscheme could not be loaded')
  return
end

require("tokyonight").setup({
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = false },
        keywords = { italic = false }
    },
})

vim.cmd([[colorscheme tokyonight-moon]]) -- nightxx colors have a weird effect on indent-blankline plugin
