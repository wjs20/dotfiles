local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

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
    command = [[:silent! %s/\s\+$//e]],
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

local terminal = augroup('Terminal', { clear = true })
autocmd({ 'TermOpen' }, {
    group = terminal,
    callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
    end
})

local repl = augroup('REPL', { clear = true })
autocmd({ 'TermOpen' }, {
    group = repl,
    callback = function()
        -- statusmsg will contain the command used to start the terminal
        local term_cmd = vim.fn.histget(':', -1)
        vim.api.nvim_set_var('term_cmd', term_cmd)
    end
})

local html_auto_format = augroup('HTMLAutoFormat', { clear = true })
autocmd({ 'BufEnter', 'BufWinEnter' }, {
    group = html_auto_format,
    pattern = { '*.html', '*.htmldjango' },
    callback = function()
        if os.execute("command -v superhtml >/dev/null 2>&1") == 0 then
            vim.opt_local.formatprg = 'superhtml fmt --stdin'
        end
    end
})
