return {
    -- Set lualine as statusline
    "nvim-lualine/lualine.nvim",
    -- See `:help lualine.txt`
    opts = {
        options = {
            icons_enabled = false,
            -- theme = "nightfly",
            -- theme = "catppuccin",
            theme = "tokyonight",
            -- theme = "cobalt2",
            -- theme = "oxocarbon",
            component_separators = "|",
            section_separators = ""
        }
    }
}
