-- Terminal
return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		-- tnoremap <Esc> <C-\><C-n>
		vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
		require("toggleterm").setup()
		vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>")
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
-- vim: ts=2 sts=2 sw=2 et