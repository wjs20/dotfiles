return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })()
        end,
        lazy = false,
        config = function()
            require'nvim-treesitter.configs'.setup {
                -- Modules and its options go here
                ensure_installed = { 'python', 'lua' },
                highlight = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-i>",
                        node_incremental = "<C-i>",
                        scope_incremental = "grc",
                        node_decremental = "<C-d>",
                    }
                },
                textobjects = { enable = true },
            }
        end
    }

}
