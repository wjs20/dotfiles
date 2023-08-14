local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

local highlight_group = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local whitespace = augroup('WhiteSpace', { clear = true })
autocmd({ 'BufWritePre' }, {
  command = [[:silent! %s#\($\n\s*\)\+\%$##]],
  group = whitespace,
  pattern = '*',
  desc = 'removes whitespace from the end of the file'
})
autocmd({ 'BufWritePre' }, {
  command =  [[:silent! %s/\s\+$//e]],
  group = whitespace,
  pattern = '*',
  desc = 'removes whitespace from the end of the line'
})


local indent = augroup('Indent', { clear = true })
autocmd({ 'BufWritePre' }, {
    command =  "normal ggVG=",
    group = indent,
    pattern = '*.html',
    desc = 'removes whitespace from the end of the line'
})


local python_group = augroup('Format', { clear = true })
autocmd({ 'BufWritePre' }, {
    callback = function()
        vim.cmd([[
            normal ma
            %!isort -
            silent! normal `a
        ]])
    end,
    group = python_group,
    pattern = '*.py'
})
autocmd({ 'BufWritePre' }, {
    callback = function()
        vim.cmd([[
            normal ma
            %!black - -q
            silent! normal `a
        ]])
    end,
    group = python_group,
    pattern = '*.py'
})
