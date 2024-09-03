return {
    "github/copilot.vim",
    config = function()
        vim.keymap.set(
            "i",
            "<c-i>",
            'copilot#Accept("\\<CR>")',
            {
                expr = true,
                replace_keycodes = false
            }
        )
        vim.g.copilot_no_tab_map = true
        vim.keymap.set(
            "i",
            "<M-Right>",
            "<Plug>(copilot-accept-word)",
            {desc = "Accept the next word of the current suggestion."}
        )
    end
}
