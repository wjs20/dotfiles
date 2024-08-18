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


local python = augroup('Format', { clear = true })
autocmd({ 'BufWritePre' }, {
    callback = function()
        vim.cmd([[
            normal ma
            %!isort -
            silent! normal `a
        ]])
    end,
    group = python,
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
    group = python,
    pattern = '*.py'
})


local skeletons = augroup('Skeletons', { clear = true })
autocmd({ 'BufNewFile' }, {
    command = "0r ~/.skeletons/bash.sh",
    group = skeletons,
    pattern = "*.sh"
})
autocmd({ 'BufNewFile' }, {
    command = "0r ~/.skeletons/pyproject.toml",
    group = skeletons,
    pattern = "pyproject.toml"
})
autocmd({ 'BufNewFile' }, {
    command = "0r ~/.skeletons/environment.yml",
    group = skeletons,
    pattern = "environment.yml"
})
autocmd({ 'BufNewFile' }, {
    command = "0r ~/.skeletons/README_template.md",
    group = skeletons,
    pattern = "README.md"
})
autocmd({ 'BufNewFile' }, {
    command = "0r ~/.skeletons/LICENSE.txt",
    group = skeletons,
    pattern = "LICENSE.txt"
})

local css_omnicomplete = augroup('CSSOmnicomplete', { clear = true })
autocmd({ 'BufNewFile' }, {
    command = "set omnifunc=csscomplete#CompleteCSS",
    group = css_omnicomplete,
    pattern = "*.css"
})
