return {
    cmd = { "pyright-langserver", "--stdio" },
    root_markers = { "pyproject.toml" },
    filetypes = { 'python' },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'openFilesOnly',
            },
        },
    },
    capabilities = {
        general = {
            positionEncodings = { "utf-16" }
        }
    }
}
