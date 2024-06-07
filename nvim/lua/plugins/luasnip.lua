return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = {
        "rafamadriz/friendly-snippets"
    },
    event = "InsertEnter",
    config = function()
        local luasnip = require("luasnip")
        luasnip.config.set_config(
            {
                history = true,
                updateevents = "TextChanged,TextChangedI",
                enable_autosnippets = true
            }
        )
        -- add vscode exported completions
        require("luasnip.loaders.from_vscode").lazy_load()
    end
}
