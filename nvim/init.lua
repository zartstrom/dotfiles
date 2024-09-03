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
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system {"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath}
    if vim.v.shell_error ~= 0 then
        error("Error cloning lazy.nvim:\n" .. out)
    end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        -- Useful plugin to show you pending keybinds.
        {
            "folke/which-key.nvim",
            event = "VimEnter",
            opts = {
                spec = {
                    {"<leader>c", group = "[C]ode", mode = {"n", "x"}},
                    {"<leader>d", group = "[D]ocument"},
                    {"<leader>r", group = "[R]ename"},
                    {"<leader>s", group = "[S]earch"},
                    {"<leader>w", group = "[W]orkspace"},
                    {"<leader>t", group = "[T]oggle"},
                    {"<leader>h", group = "Git [H]unk", mode = {"n", "v"}}
                }
            }
        },
        -- "gc" to comment visual regions/lines
        {"numToStr/Comment.nvim", opts = {}},
        -- Fuzzy Finder (files, lsp, etc)
        --
        -- Import big plugin groups
        {import = "lsp"},
        {import = "telescope"},
        {import = "treesitter"},
        -- Import small plugin groups
        {import = "plugins"},
        {import = "plugins.colors"}
    }
)

-- Remove padding around neovim instance (2024-08-01)
-- https://www.reddit.com/r/neovim/comments/1ehidxy/you_can_remove_padding_around_neovim_instance/
require("mini.misc").setup_termbg_sync()

require("keymap")
require("custom.ruff")
require("custom.highlight-on-yank")

vim.diagnostic.config({virtual_text = false})

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", {desc = "Move focus to the left window"})
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", {desc = "Move focus to the right window"})
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", {desc = "Move focus to the lower window"})
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", {desc = "Move focus to the upper window"})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
