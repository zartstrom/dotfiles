return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "SmiteshP/nvim-navbuddy",
            dependencies = {
                "SmiteshP/nvim-navic",
                "MunifTanjim/nui.nvim"
            },
            opts = {lsp = {auto_attach = true}}
        }
    },
    config = function()
        local navbuddy = require("nvim-navbuddy")
        -- local actions = require("nvim-navbuddy.actions")

        navbuddy.setup {
            lsp = {
                auto_attach = false, -- If set to true, you don't need to manually use attach function
                preference = nil -- list of lsp server names in order of preference
            }
        }
    end
}
