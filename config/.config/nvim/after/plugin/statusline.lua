local ok, lualine = pcall(require, 'lualine')
if not ok then
    print('statusline could not be loaded')
end


require('lualine').setup {
    options = {
        theme = "gruvbox_dark",
    },
    sections = {
        lualine_a = {
            {
                "buffers",
                mode = 4,
                use_mode_colors = true,
                buffers_color = {
                    active = {bg="#fe8019", fg="#080808"}
                },
            }
        }
    }
}
