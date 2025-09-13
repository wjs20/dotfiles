return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { '<leader>ff', '<cmd>Telescope find_files<cr>',                                     desc = '[F]ind [F]iles' },
            { '<leader>fg', '<cmd>Telescope live_grep<cr>',                                      desc = '[L]ive [G]rep' },
            { '<leader>fb', '<cmd>Telescope git_branches<cr>',                                   desc = '[L]ive [G]rep' },
            { '<leader>b',  '<cmd>Telescope buffers sort_mru=true<cr>',                          desc = '[F]ind [B]uffers' },
            { '<leader>fd', '<cmd>Telescope diagnostics<cr>',                                    desc = '[F]ind [D]iagnostics' },
            { '<leader>fs', '<cmd>Telescope lsp_document_symbols ignore_symbols="variable"<cr>', desc = '[F]ind [D]ocument symbols' },
            { '<leader>fw', '<cmd>Telescope lsp_workspace_symbols query=""<cr>',                 desc = '[F]ind [W]orkspace symbols' },
            { '<leader>fk', '<cmd>Telescope keymaps<cr>',                                        desc = '[K]ey[M]aps' }
        }
    }
}
