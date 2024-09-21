-- Setup neoformat
return {
    "sbdchd/neoformat", -- Format buffer
    config = function()
        -- NOTE: for scalafmt to work provide a .scalafmt.conf file.
        vim.api.nvim_exec2(
            [[
		augroup fmt
		autocmd!
		autocmd BufWritePre *.py,*.lua,*.go,*.rs,*.scala,*.ts,*.html undojoin | Neoformat
		augroup END
		let g:neoformat_enabled_scala = ['scalafmt']
		let g:neoformat_enabled_python = ['ruff']
	    ]],
            {}
        )
    end
}
