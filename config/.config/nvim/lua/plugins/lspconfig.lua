return {
    {
        "neovim/nvim-lspconfig",
        dependancies = { 'saghen/blink.cmp' },
        opts = {
            servers = {
                lua_ls = {},
                ruff = {},
                pyright = {},
                emmet_language_server = {}
            }
        },
        config = function(_, opts)

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)

                    local client = vim.lsp.get_client_by_id(args.data.client_id)

                    local opts = { noremap=true, silent=true }
                    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
                    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
                    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
                    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
                    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local bufopts = { noremap=true, silent=true, buffer=bufnr }
                    vim.keymap.set('n', 'grn', vim.lsp.buf.rename, bufopts)
                    vim.keymap.set('n', 'gca', vim.lsp.buf.code_action, bufopts)
                    vim.keymap.set('n', 'grr', vim.lsp.buf.references, bufopts)
                    vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, bufopts)
                    vim.keymap.set('n', 'gO', vim.lsp.buf.document_symbol, bufopts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
                    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)

                    -- if client.supports_method('textDocument/implementation') then
                    --   -- Create a keymap for vim.lsp.buf.implementation
                    -- end
                end,
            })

            local lspconfig = require("lspconfig")

            for server, config in pairs(opts.servers) do
                -- passing config.capabilities to blink.cmp merges with the capabilities in your
                -- `opts[server].capabilities, if you've defined it
                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end

        end
    }
}
