return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim"
    },
    config = function()
        require("neo-tree").setup(
            {
                window = {
                    mappings = {
                        ["<space>"] = "noop",
                        ["i"] = {
                            function(state)
                                local node = state.tree:get_node()
                                print(node.path)
                            end,
                            desc = "print path"
                        }
                    }
                }
            }
        )
    end
}
