local capabilities = vim.lsp.protocol.make_client_capabilities()

-- capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities({}, false))

capabilities = vim.tbl_deep_extend('force', capabilities, {
    textDocument = {
        semanticTokens = {
            multilineTokenSupport = true,
        }
    }
})

vim.lsp.config('*', {
    capabilities = capabilities,
    root_markers = { '.git' },
})

vim.lsp.enable({ 'lua-language-server', 'ruff', 'superhtml', 'pyright', 'texlab' })

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/implementation') then
            -- Create a keymap for vim.lsp.buf.implementation ...
        end

        -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
        if client:supports_method('textDocument/completion') then
            -- Optional: trigger autocompletion on EVERY keypress. May be slow!
            -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            -- client.server_capabilities.completionProvider.triggerCharacters = chars

            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end

        if client:supports_method('workspace/symbol') then
            vim.keymap.set('n', '<leader>fw', vim.lsp.buf.workspace_symbol)
        end
    end,
})

vim.cmd("set completeopt+=noselect")
