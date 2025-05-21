local default_ft_runners = {
    python = "python"
}

local get_or_create_scratch = function()
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.fn.bufname(bufnr) == "scratch" then
            return bufnr
        end
    end

    local bufnr = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_name(bufnr, "scratch")
    return bufnr
end

local writer = function(err, data)
    if data then
        vim.schedule(function()
            local bufnr = get_or_create_scratch()
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, vim.split(data, "\n"))
        end)
    end
end

local pipe_command = function(command, bufnr)
    vim.system(command, {
        stdout = writer,
        stderr = writer
    })
end

local get_command = function()
    local ft = vim.bo.filetype
    local runner = default_ft_runners[ft]
    return { runner, vim.fn.expand("%") }
end

local repl = function()
    local command = get_command()
    vim.cmd.write()
    pipe_command(command)
end

-- creates a 'scratch' buffer where the output of the script with appear
-- you need to open this manually
vim.keymap.set('n', '<F3>', repl)

-- print(vim.inspect(vim.api.nvim_list_bufs()))
-- vim.api.nvim_buf_set_lines(3, 0, -1, true, {'foo'} )
-- Runs synchronously:
-- local obj = vim.system({'echo', 'hello'}, { text = true }):wait()
-- { code = 0, signal = 0, stdout = 'hello', stderr = '' }
