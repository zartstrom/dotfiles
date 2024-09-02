-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- TODO: maybe not needed
vim.g.have_nerd_font = false

-- Get options from `./lua/opts.lua`
require("opts")

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath
    }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require("lazy").setup(
    {
        -- NOTE: This is where your plugins related to LSP can be installed.
        --  The configuration is done below. Search for lspconfig to find it below.
        {
            -- LSP Configuration & Plugins
            "neovim/nvim-lspconfig",
            dependencies = {
                -- Automatically install LSPs to stdpath for neovim
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                -- Useful status updates for LSP
                -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
                {"j-hui/fidget.nvim", tag = "legacy", opts = {}}
                -- Additional lua configuration, makes nvim stuff amazing!
            }
        },
        -- Useful plugin to show you pending keybinds.
        {"folke/which-key.nvim", opts = {}},
        {
            -- Add indentation guides even on blank lines
            "lukas-reineke/indent-blankline.nvim",
            -- Enable `lukas-reineke/indent-blankline.nvim`
            -- See `:help indent_blankline.txt`
            main = "ibl",
            opts = {}
        },
        -- "gc" to comment visual regions/lines
        {"numToStr/Comment.nvim", opts = {}},
        -- Fuzzy Finder (files, lsp, etc)
        {"nvim-telescope/telescope.nvim", version = "*", dependencies = {"nvim-lua/plenary.nvim"}},
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
        },
        {
            -- Highlight, edit, and navigate code
            "nvim-treesitter/nvim-treesitter",
            dependencies = {
                "nvim-treesitter/nvim-treesitter-textobjects"
            },
            config = function()
                pcall(require("nvim-treesitter.install").update {with_sync = true})
            end
        },
        -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
        --       These are some example plugins that I've included in the kickstart repository.
        --       Uncomment any of the lines below to enable them.
        -- require 'kickstart.plugins.autoformat',
        -- require 'kickstart.plugins.debug',

        -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
        --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
        --    up-to-date with whatever is in the kickstart repo.
        --
        --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
        --
        --    An additional note is that if you only copied in the `init.lua`, you can just comment this line
        --    to get rid of the warning telling you that there are not plugins in `lua/custom/plugins/`.
        {import = "lsp"},
        {import = "plugins"},
        {import = "plugins.colors"}
    },
    {}
)

-- Remove padding around neovim instance (2024-08-01)
-- https://www.reddit.com/r/neovim/comments/1ehidxy/you_can_remove_padding_around_neovim_instance/
require("mini.misc").setup_termbg_sync()

vim.cmd.colorscheme "tokyonight"
vim.diagnostic.config({virtual_text = false})

-- [[ Basic Keymaps ]]
local wk = require("which-key")
wk.add(
    {
        {"<leader>tv", "<cmd>VenvSelect<cr>", mode = "n", desc = "Pick Python venv", icon = ""},
        {"<leader>tm", "<cmd>Markview toggle<cr>", mode = "n", desc = "Toggle markdown preview", icon = "📝"},
        {"<leader>tc", "<cmd>CodeCompanionToggle<cr>", mode = {"n", "v"}, desc = "Toggle CodeCompanion", icon = "🤖"},
        {"<leader>tf", "<cmd>Neotree toggle<cr>", mode = {"n", "v"}, desc = "Toggle file tree", icon = "🌲"},
        {"<leader>st", "<cmd>TodoTelescope<cr>", mode = "n", desc = "Search TODOs", icon = "📝"}
    }
)

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({"n", "v"}, "<Space>", "<Nop>", {silent = true})

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true})
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true})

-- Markview
--
-- vim.keymap.set("n", "<leader>tm", ":Markview toggle<CR>", {desc = "Toggle markdown preview"})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", {clear = true})
vim.api.nvim_create_autocmd(
    "TextYankPost",
    {
        callback = function()
            vim.highlight.on_yank()
        end,
        group = highlight_group,
        pattern = "*"
    }
)

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false
            }
        }
    }
}

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, {desc = "[?] Find recently opened files"})
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, {desc = "[ ] Find existing buffers"})
vim.keymap.set(
    "n",
    "<leader>/",
    function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require("telescope.builtin").current_buffer_fuzzy_find(
            require("telescope.themes").get_dropdown {
                winblend = 10,
                previewer = false
            }
        )
    end,
    {desc = "[/] Fuzzily search in current buffer"}
)

vim.keymap.set("n", "<leader>f", require("telescope.builtin").find_files, {desc = "Search [F]iles"})
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, {desc = "[S]earch [H]elp"})
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, {desc = "[S]earch current [W]ord"})
vim.keymap.set("n", "<leader>g", require("telescope.builtin").live_grep, {desc = "Search by [G]rep"})
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, {desc = "[S]earch [D]iagnostics"})

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`

-- Setup neovim lua configuration

-- gitsigns
require("gitsigns").setup()

require("python.ruff")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
