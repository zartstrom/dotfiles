-- Setup neoformat
return {
    "sbdchd/neoformat", -- Format buffer
    config = function()
        vim.api.nvim_exec2(
            [[
		augroup fmt
		autocmd!
		autocmd BufWritePre *.py,*.lua,*.go,*.scala undojoin | Neoformat
		augroup END
		let g:neoformat_enabled_scala = ['scalafmt']
		let g:neoformat_enabled_python = ['black']
		let g:neoformat_python_black = {
		    \ 'exe': 'black',
		    \ 'stdin': 1,
		    \ 'args': ['--line-length', '108', '-q', '-'],
		    \ }
	    ]],
            {}
        )
    end
}
