local function fn(
    args,     -- text from i(2) in this example i.e. { { "456" } }
    parent,   -- parent snippet or parent node
    user_args -- user_args from opts.user_args
    )
    print(vim.inspect(args))
    return '[' .. args[1][1] .. user_args .. ']'
end


return {
    s("trig", {
        i(1), t '<-i(1) ',
        f(fn,  -- callback (args, parent, user_args) -> string
        {1, 2}, -- node indice(s) whose text is passed to fn, i.e. i(2)
        { user_args = { "user_args_value" }} -- opts
        ),
        t ' i(2)->', i(2), t '<-i(2) i(0)->', i(0)
    })
}
