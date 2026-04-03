return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        lazy = false,
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { '<leader>ff', '<cmd>Telescope find_files<cr>',                                     desc = '[F]ind [F]iles' },
            { '<leader>fg', '<cmd>Telescope live_grep<cr>',                                      desc = '[F]ind [G]rep' },
            { '<leader>fb', '<cmd>Telescope buffers sort_mru=true<cr>',                          desc = '[F]ind [B]uffers' },
            { '<leader>fd', '<cmd>Telescope diagnostics<cr>',                                    desc = '[F]ind [D]iagnostics' },
            { '<leader>fs', '<cmd>Telescope lsp_document_symbols ignore_symbols="variable"<cr>', desc = '[F]ind document [S]ymbols' },
            { '<leader>fk', '<cmd>Telescope keymaps<cr>',                                        desc = '[F]ind[K]eymaps' },
            { '<leader>ft', '<cmd>Telescope tagstack<cr>',                                       desc = '[T]ey[M]aps' }
        }
    }
}
