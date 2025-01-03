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

local terminal = augroup('terminal', { clear = true })
autocmd({ 'TermOpen' }, {
    group = terminal,
    callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
    end
})

local path_setup = augroup('path_setup', { clear = true })
autocmd({ 'BufNewFile', 'BufReadPost' }, {
    group = path_setup,
    callback = function()
        local vim_paths = vim.env.VIM_PATHS
        if vim_paths then
            vim.opt.path = vim_paths
        end
    end
})
