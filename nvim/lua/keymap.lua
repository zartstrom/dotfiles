-- [[ Basic Keymaps ]]
local wk = require("which-key")
wk.add(
    {
        {"<leader>pv", "<cmd>VenvSelect<cr>", mode = "n", desc = "[p]ick [v]env", icon = ""},
        {"<leader>tm", "<cmd>Markview toggle<cr>", mode = "n", desc = "[t]oggle [m]arkdown preview", icon = "📝"},
        {
            "<leader>tc",
            "<cmd>CodeCompanionToggle<cr>",
            mode = {"n", "v"},
            desc = "[t]oggle [c]ode companion",
            icon = "🤖"
        },
        {
            "<leader>pc",
            require("telescope.builtin").colorscheme,
            mode = {"n", "v"},
            desc = "[p]ick [c]olorscheme",
            icon = "🎨"
        },
        -- vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, {desc = "[S]earch [F]iles"})
        {"<leader>tf", "<cmd>Neotree toggle<cr>", mode = {"n", "v"}, desc = "[t]oggle [f]ile tree", icon = "🌲"},
        {
            "<leader>ts",
            function()
                vim.opt.spell = not vim.opt.spell:get()
            end,
            mode = "n",
            desc = "[t]oggle [s]pell checking",
            icon = "🔤"
        },
        {
            "<leader>rg",
            "<cmd>GrugFar<cr>",
            mode = "n",
            desc = "[r]eplace with [g]rug-far",
            icon = "🔧"
        }
    }
)

vim.keymap.set({"n", "x"}, "s", "<Nop>")
-- vim.api.nvim_set_keymap("n", "s", "", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("o", "a", "", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("o", "d", "", {noremap = true, silent = true}) -- dd doesn't work with this
-- vim.api.nvim_set_keymap("o", "i", "", {noremap = true, silent = true}) -- ciw doesn't work with this
-- vim.api.nvim_set_keymap("o", "r", "", {noremap = true, silent = true})

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

vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, {desc = "[s]earch [d]iagnostics"})
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, {desc = "[s]earch by [g]rep"})
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, {desc = "[s]earch [f]iles"})
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, {desc = "[s]earch [h]elp"})
vim.keymap.set("n", "<leader>sk", require("telescope.builtin").keymaps, {desc = "[s]earch [k]eymaps"})
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, {desc = "[s]earch current [w]ord"})

-- toggle spelling
