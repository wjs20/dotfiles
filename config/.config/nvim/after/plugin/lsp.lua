local ok, lsp = pcall(require, 'lsp-zero')
if not ok then
  print('could not load lsp_zero')
  return
end

local lsp = require('lsp-zero')
lsp.preset('recommended')

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  experimental = {
      ghost_text = true,
  },
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', 'rn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', ']d', function() vim.lsp.buf.goto_next() end, opts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', '<C-k>', function() vim.lsp.buf.definition() end, opts)
end)

lsp.setup()
