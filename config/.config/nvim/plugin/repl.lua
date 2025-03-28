local map = vim.keymap.set

-- Used when term_send activated from visual mode
-- 'v' marks start of visual selection and '.' marks the cursor position
--
-- The result of getpos is a |List| with four numbers: [bufnum, lnum, col, off]
-- off is only relevant for virtualedit mode so usually not relevant

local get_selection = function(mode)
    local valid_modes = { n = true, v = true, V = true, ['\22'] = true }

    if not valid_modes[mode] then
        vim.print('mode not recognised')
        return
    end

    local start_pos, end_pos

    if mode == 'n' then
        start_pos = vim.fn.getpos('.')
        local col = vim.fn.col('$')
        end_pos = { start_pos[1], start_pos[2], col, start_pos[4] }
    else
        -- if not in normal mode we are in one of the visual modes
        start_pos = vim.fn.getpos('v')
        end_pos = vim.fn.getpos('.')
        -- if in visual line mode we need to set the end pos the line end
        if mode == 'V' then
            end_pos[3] = vim.fn.col('$') -- change col to be end of line where cursor positioned
        end
    end

    local lines
    if mode ~= 'n' then
        lines = vim.fn.getregion(start_pos, end_pos, {type = mode})
    else
        -- 'n' is not a valid 'type'
        lines = vim.fn.getregion(start_pos, end_pos)
    end
    local selection = table.concat(lines, '\n')
    return selection

end

local get_term_chan = function ()
    local chans = vim.api.nvim_list_chans()
    local term_chans = {}
    for _, chan in ipairs(chans) do
        if chan['mode'] == 'terminal' then
            table.insert(term_chans, chan)
        end
    end

    if #term_chans == 0 then
        vim.print("No terminals available")
        return
    end
    -- we don't know which term to use if there are multiple
    if #term_chans > 1 then
        vim.print("ambiguous; more than one term")
        return
    end

    local term_chan = term_chans[1]
    return term_chan
end

local term_send = function()
    local term_chan = get_term_chan()
    if term_chan == nil then
        vim.print('unable to find a terminal channel')
        return
    end

    local term_chan_id = term_chan['id']
    local mode = vim.api.nvim_get_mode()['mode']
    local selection = get_selection(mode)

    if selection == nil then
        vim.print('Could not send selection')
        return
    end

    vim.api.nvim_chan_send(term_chan_id, selection .. "\n")

    -- if mode['mode'] == 'n' then
    --     local current_line = vim.api.nvim_get_current_line()
    --     vim.api.nvim_chan_send(term_chan_id, current_line .. "\n")
    -- elseif mode['mode'] == 'v' or mode['mode'] == 'V' then
    --     local selection = get_selection('v')
    --     vim.api.nvim_chan_send(term_chan_id, selection .. "\n")
    -- elseif mode['mode'] == '\22' then
    --     vim.print('matched!!!')
    --     local selection = get_selection('\22')
    --     vim.api.nvim_chan_send(term_chan_id, selection .. "\n")
    -- else
    --     vim.print('mode not recognised')
    --     vim.print(mode)
    -- end
end

local term_restart = function ()
    local term_chan = get_term_chan()
    if term_chan == nil then
        vim.print('unable to find a terminal channel')
    else
        local term_chan_id = term_chan['id']
        local term_buf_id = term_chan['buffer']
        -- remove terminal
        vim.api.nvim_chan_send(term_chan_id, '\004')
        vim.api.nvim_buf_delete(term_buf_id, { force = true })
        local term_cmd = vim.api.nvim_get_var('term_cmd')
        vim.cmd(term_cmd)
        vim.api.nvim_set_var('term_cmd', term_cmd)
    end
end

-- -- commands
-- vim.api.nvim_create_user_command('TermSend', term_send, {})
-- vim.api.nvim_create_user_command('TermRestart', term_restart, {})
--
-- -- keymaps
-- vim.keymap.set('n', '[s', '<cmd>TermSend<cr>j')
-- vim.keymap.set('v', '[s', '<cmd>TermSend<cr>')
--
-- vim.keymap.set('n', '[r', '<cmd>TermRestart<cr>')
