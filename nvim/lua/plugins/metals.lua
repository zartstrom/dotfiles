return {
    "scalameta/nvim-metals",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        vim.cmd([[autocmd FileType scala,sbt lua require("metals").initialize_or_attach({})]])
        local map = vim.keymap.set
        ----------------------------------
        -- OPTIONS -----------------------
        ----------------------------------
        -- global
        vim.opt_global.completeopt = {"menuone", "noinsert", "noselect"}

        -- LSP mappings
        map("n", "gD", vim.lsp.buf.definition)
        map("n", "K", vim.lsp.buf.hover)
        map("n", "gi", vim.lsp.buf.implementation)
        map("n", "gr", vim.lsp.buf.references)
    end
}
