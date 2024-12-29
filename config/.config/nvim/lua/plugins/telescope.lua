return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files'},
            { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep'},
            { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find Buffers'},
            { '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = 'Find Diagnostics'},
            { '<leader>fs', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', desc = 'Find Workspace Symbols'}
        }
    }
}
