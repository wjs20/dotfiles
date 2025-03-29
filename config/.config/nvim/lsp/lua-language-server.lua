return {
    cmd = { "lua-language-server" },
    root_markers = {},
    filetypes = { "lua" },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT"
            },
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
}
