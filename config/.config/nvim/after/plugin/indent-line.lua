local ok, _ = pcall(require, 'ibl')
if not ok then
    print('indent_blankline could not be loaded')
    return
end
require("ibl").setup({
       debounce = 100,
       indent = { char = "│" },
       whitespace = { highlight = { "Whitespace", "NonText" } },
       scope = { exclude = { language = { "lua" } } },
})
