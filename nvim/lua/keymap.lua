-- [[ Basic Keymaps ]]
local wk = require("which-key")
wk.add(
    {
        {"<leader>tv", "<cmd>VenvSelect<cr>", mode = "n", desc = "Pick Python [v]env", icon = ""},
        {"<leader>tm", "<cmd>Markview toggle<cr>", mode = "n", desc = "Toggle [m]arkdown preview", icon = "📝"},
        {"<leader>tc", "<cmd>CodeCompanionToggle<cr>", mode = {"n", "v"}, desc = "Toggle [c]ode companion", icon = "🤖"},
        {"<leader>tf", "<cmd>Neotree toggle<cr>", mode = {"n", "v"}, desc = "Toggle file tree", icon = "🌲"},
        {"<leader>st", "<cmd>TodoTelescope<cr>", mode = "n", desc = "[S]earch [T]odos", icon = "📝"}
    }
)

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({"n", "v"}, "<Space>", "<Nop>", {silent = true})

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true})
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true})

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

vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, {desc = "[S]earch [F]iles"})
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, {desc = "[S]earch [H]elp"})
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, {desc = "[S]earch current [W]ord"})
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, {desc = "[S]earch by [G]rep"})
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, {desc = "[S]earch [D]iagnostics"})
