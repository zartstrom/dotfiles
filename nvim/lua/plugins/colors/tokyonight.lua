return {
    "folke/tokyonight.nvim",
    lazy = false,
    -- lazy = true,
    priority = 1000,
    opts = {},
    init = function()
        -- Load the colorscheme here.
        -- Like many other themes, this one has different styles, and you could load
        -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
        -- vim.cmd.colorscheme "tokyonight-night"
        vim.cmd.colorscheme "dracula"

        -- You can configure highlights by doing something like:
        vim.cmd.hi "Comment gui=none"
    end
}
