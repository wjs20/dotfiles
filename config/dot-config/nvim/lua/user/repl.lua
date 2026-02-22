local M = { chan = nil, cmd_key = nil, bufnr = nil }

local function is_valid_chan(chan_id)
    local chans = vim.api.nvim_list_chans()
    for _, chan in ipairs(chans) do
        if chan["id"] == chan_id then
            return true
        end
    end
    return false
end

local function pick_cmd_for_current_buffer()
    local ft = vim.bo.filetype
    if ft == "python" then
        if vim.fn.executable("ipython") == 1 then
            return { "ipython", "--no-autoindent" }, "ipython"
        elseif vim.fn.executable("python3") == 1 then
            return { "python3" }, "python3"
        elseif vim.fn.executable("python") == 1 then
            return { "python" }, "python"
        else
            local sh = vim.o.shell
            return { sh }, "shell"
        end
    else
        local sh = vim.o.shell
        return { sh }, "shell"
    end
end

local function start_term(cmd, cmd_key)
    vim.cmd("botright split | resize 12")
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(0, buf)
    local chan = vim.fn.termopen(cmd)
    M.chan, M.cmd_key, M.bufnr = chan, cmd_key, buf
    vim.cmd("startinsert")
end

local function ensure_repl_for_current_buffer()
    local cmd, cmd_key = pick_cmd_for_current_buffer()
    local ok = M.chan and is_valid_chan(M.chan)
    if ok and M.cmd_key == cmd_key then return end
    start_term(cmd, cmd_key)
end

local function needs_blank_terminator(lines)
    for i = #lines, 1, -1 do
        local line = lines[i]
        if line:match("%S") then return line:match(":%s*$") ~= nil end
    end
    return false
end

local function send_text(text)
    ensure_repl_for_current_buffer()
    vim.fn.chansend(M.chan, text)
end

function M.start()
    ensure_repl_for_current_buffer()
end

function M.send_lines(a, b)
    local lines = vim.api.nvim_buf_get_lines(0, a - 1, b, false)
    local text = table.concat(lines, "\n") .. "\n"
    if vim.bo.filetype == "python" and needs_blank_terminator(lines) then
        text = text .. "\n"
    end
    send_text(text)
end

function M.send_visual()
    local _, ls = unpack(vim.fn.getpos("'<"))
    local _, le = unpack(vim.fn.getpos("'>"))
    M.send_lines(ls, le)
end

return M
