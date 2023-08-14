local ok, _ = pcall(require, 'indent_blankline')
if not ok then
    print('indent_blankline could not be loaded')
    return
end
require('indent_blankline').setup {
    show_current_context = true,
    show_current_context_start = true,
}
