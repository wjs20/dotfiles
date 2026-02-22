local r = require("user.repl")

vim.api.nvim_create_user_command("ReplStart", function() r.start() end, {})

vim.api.nvim_create_user_command("ReplSend", function(opts)
    local line1, line2 = opts.line1, opts.line2
    r.send_lines(line1, line2)
end, { range = true })
