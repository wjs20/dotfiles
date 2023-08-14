ls = require"luasnip"
ls.filetype_extend("python", {"django"})
require("luasnip.loaders.from_vscode").lazy_load()


ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI"
}
