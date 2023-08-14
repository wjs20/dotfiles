local ok, lualine = pcall(require, 'lualine')
if not ok then
    print('statusline could not be loaded')
end

require('lualine').setup({
    options = {
        theme = 'tokyonight'
    }
})
