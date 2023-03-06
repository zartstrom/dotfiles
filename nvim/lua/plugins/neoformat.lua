-- Setup neoformat
return {
    "sbdchd/neoformat", -- Format buffer
    config = function()
        vim.api.nvim_exec(
            [[
		augroup fmt
		autocmd!
		autocmd BufWritePre *.py,*.lua,*.go undojoin | Neoformat
		augroup END
		let g:neoformat_enabled_python = ['black']
		let g:neoformat_python_black = {
		    \ 'exe': 'black',
		    \ 'stdin': 1,
		    \ 'args': ['--line-length', '108', '-q', '-'],
		    \ }
	]],
            true
        )
    end
}
