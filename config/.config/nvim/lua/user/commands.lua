local map = vim.keymap.set

local get_selection = function(type)
    local lines = vim.fn.getregion(vim.fn.getpos('v'), vim.fn.getpos('.'), {type = type})
    local selection = table.concat(lines, '\n')
    return selection
end


local send_to_active_term = function()

    -- fetch terminal buffer
    local chans = vim.api.nvim_list_chans()
    local term_chans = {}
    for _, chan in ipairs(chans) do
        if chan['mode'] == 'terminal' then
            table.insert(term_chans, chan)
        end
    end

    -- we don't know which term to use if there are multiple
    if #term_chans > 1 then
        vim.print("Ambiguous; more than one term")
        return
    end

    local term_chan = term_chans[1]['id']

    local mode = vim.api.nvim_get_mode()
    if mode['mode'] == 'n' then
        local current_line = vim.api.nvim_get_current_line():gsub("^%s+", "")
        vim.api.nvim_chan_send(term_chan, current_line .. "\n")
    elseif mode['mode'] == 'v' then
        local selection = get_selection('v')
        vim.api.nvim_chan_send(term_chan, selection .. "\n")
    elseif mode['mode'] == 'V' then
        local selection = get_selection('V')
        vim.api.nvim_chan_send(term_chan, selection .. "\n")
    end
end


vim.keymap.set('n', '[s', send_to_active_term)
vim.keymap.set('v', '[s', send_to_active_term)
