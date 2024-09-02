return {
    "ptdewey/yankbank-nvim",
    vim.keymap.set("n", "<leader>yb", "<cmd>YankBank<CR>", {noremap = true, desc = "YankBank"}),
    config = function()
        require("yankbank").setup(
            {
                max_entries = 9,
                sep = "-----",
                num_behavior = "jump",
                focus_gain_poll = true,
                keymaps = {
                    paste = "<CR>",
                    paste_back = "P"
                },
                registers = {
                    yank_register = "+"
                }
            }
        )
    end
}
