return {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    build = ":Neorg sync-parsers",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.dirman"] = {
                    -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/.norg/notes",
                            journal = "~/.norg/journal"
                        }
                    }
                },
                ["core.journal"] = {
                    -- Enable the journal to write to journal files
                    config = {
                        journal_folder = "journal",
                        workspace = "journal"
                    }
                }
            }
        }
    end
}
