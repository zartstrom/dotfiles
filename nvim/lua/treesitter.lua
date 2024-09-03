return {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects"
    },
    config = function()
        pcall(require("nvim-treesitter.install").update {with_sync = true})
        require("nvim-treesitter.configs").setup {
            -- Add languages to be installed here that you want installed for treesitter
            ensure_installed = {
                "bash",
                "dart",
                "go",
                "hcl",
                "html",
                "java",
                "lua",
                "python",
                "rust",
                "scala",
                "typescript",
                "help",
                "vim",
                "yaml"
            },
            -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
            auto_install = false,
            ignore_install = {},
            sync_install = false,
            highlight = {enable = true},
            -- indent = {enable = true, disable = {"python"}},
            indent = {enable = true},
            modules = {},
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm"
                }
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner"
                    }
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>a"] = "@parameter.inner"
                    },
                    swap_previous = {
                        ["<leader>A"] = "@parameter.inner"
                    }
                }
            }
        }
    end
}
