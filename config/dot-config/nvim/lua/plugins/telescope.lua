return {
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        keys = {
            { '<leader>fb', '<cmd>Telescope buffers sort_mru=true<cr>',                          desc = '[F]ind [B]uffers' },
            { '<leader>fd', '<cmd>Telescope diagnostics<cr>',                                    desc = '[F]ind [D]iagnostics' },
            { '<leader>ff', '<cmd>Telescope find_files<cr>',                                     desc = '[F]ind [F]iles' },
            { '<leader>ff', '<cmd>Telescope find_files<cr>',                                     desc = '[F]ind [F]iles' },
            { '<leader>fg', '<cmd>Telescope live_grep<cr>',                                      desc = '[F]ind [G]rep' },
            { '<leader>fi', '<cmd>Telescope lsp_incoming_calls<cr>',                             desc = '[F]ind [I]ncoming' },
            { '<leader>fk', '<cmd>Telescope keymaps<cr>',                                        desc = '[F]ind [K]eymaps' },
            { '<leader>fm', '<cmd>Telescope marks<cr>',                                          desc = '[F]ind [M]arks' },
            { '<leader>fr', '<cmd>Telescope lsp_references<cr>',                                 desc = '[F]ind [R]eferences' },
            { '<leader>fs', '<cmd>Telescope lsp_document_symbols<cr>',                           desc = '[F]ind document [S]ymbols' },
            { '<leader>ft', '<cmd>Telescope tagstack<cr>',                                       desc = '[F]ind [T]ags' },
            { '<leader>fw', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',                  desc = '[F]ind [W]orkspace symbols' },
        }
    }
}
