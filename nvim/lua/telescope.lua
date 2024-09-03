return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = {"nvim-lua/plenary.nvim"},
        setup = {
            defaults = {
                mappings = {
                    i = {
                        ["<C-u>"] = false,
                        ["<C-d>"] = false
                    }
                }
            }
        },
        config = function()
            -- Enable telescope fzf native, if installed
            pcall(require("telescope").load_extension, "fzf")
        end
    },
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = "make",
        cond = function()
            return vim.fn.executable "make" == 1
        end
    }
}
