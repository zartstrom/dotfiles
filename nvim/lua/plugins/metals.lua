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
        map("n", "gds", vim.lsp.buf.document_symbol)
        map("n", "gws", vim.lsp.buf.workspace_symbol)
        map("n", "<leader>cl", vim.lsp.codelens.run)
        map("n", "<leader>sh", vim.lsp.buf.signature_help)
        map("n", "<leader>rn", vim.lsp.buf.rename)
        map("n", "<leader>f", vim.lsp.buf.formatting)
        map("n", "<leader>ca", vim.lsp.buf.code_action)

        map(
            "n",
            "<leader>ws",
            function()
                require("metals").hover_worksheet()
            end
        )

        -- all workspace diagnostics
        map("n", "<leader>aa", vim.diagnostic.setqflist)

        -- all workspace errors
        map(
            "n",
            "<leader>ae",
            function()
                vim.diagnostic.setqflist({severity = "E"})
            end
        )

        -- all workspace warnings
        map(
            "n",
            "<leader>aw",
            function()
                vim.diagnostic.setqflist({severity = "W"})
            end
        )

        -- buffer diagnostics only
        map("n", "<leader>d", vim.diagnostic.setloclist)

        map(
            "n",
            "[c",
            function()
                vim.diagnostic.goto_prev({wrap = false})
            end
        )

        map(
            "n",
            "]c",
            function()
                vim.diagnostic.goto_next({wrap = false})
            end
        )

        -- Example mappings for usage with nvim-dap. If you don't use that, you can
        -- skip these
        map(
            "n",
            "<leader>dc",
            function()
                require("dap").continue()
            end
        )

        map(
            "n",
            "<leader>dr",
            function()
                require("dap").repl.toggle()
            end
        )

        map(
            "n",
            "<leader>dK",
            function()
                require("dap.ui.widgets").hover()
            end
        )

        map(
            "n",
            "<leader>dt",
            function()
                require("dap").toggle_breakpoint()
            end
        )

        map(
            "n",
            "<leader>dso",
            function()
                require("dap").step_over()
            end
        )

        map(
            "n",
            "<leader>dsi",
            function()
                require("dap").step_into()
            end
        )

        map(
            "n",
            "<leader>dl",
            function()
                require("dap").run_last()
            end
        )
    end
}
