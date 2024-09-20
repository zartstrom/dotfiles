return {
    "ptdewey/yankbank-nvim",
    vim.keymap.set("n", "<leader>py", "<cmd>YankBank<CR>", {noremap = true, desc = "[P]ick [Y]ank"}),
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
