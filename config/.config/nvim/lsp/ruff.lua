return {
    cmd = { "ruff", "server" },
    root_markers = {
        "pyproject.toml", "ruff.toml", ".ruff.toml"
    },
    filetypes = { 'python' },
    capabilities = {
        general = {
            positionEncodings = { "utf-16" }
        }
    }
}
