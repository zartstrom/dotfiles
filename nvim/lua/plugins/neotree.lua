return {
    {
        "nvim-tree/nvim-web-devicons" -- not strictly required, but recommended
    },
    {
        "MunifTanjim/nui.nvim"
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        keys = {
            {"<leader>tf", "<cmd>Neotree toggle<cr>", desc = "NeoTree"}
        },
        config = function()
            require("neo-tree").setup()
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim"
        }
    }
}
