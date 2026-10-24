return {
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        keys = {
            {
                "<Tab>", 
                function()
                    local ls = require('luasnip')
                    if ls.expand_or_jumpable() then
                        ls.expand_or_jump()
                    else
                        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", true)
                    end
                end, 
                mode = {"i", "s"}, 
                desc="Expand or jump"
            },
            {
                "<S-Tab>", 
                function()
                    local ls = require('luasnip')
                    if ls.jumpable(-1) then ls.jump(-1) end
                end, 
                mode = {"i", "s"}, 
                desc="Expand or jump (insert)"
            },
        },
    }
}
