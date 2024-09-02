function RuffCheck()
    local current_file = vim.fn.expand("%")
    vim.cmd("silent !ruff check --select I --fix " .. current_file)
end

vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern = {"python"},
        callback = function()
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<leader>ri",
                ":lua RuffCheck()<CR>",
                {desc = "[r]uff sort [i]mports", noremap = true, silent = true}
            )
        end
    }
)
