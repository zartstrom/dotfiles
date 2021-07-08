local utils = require('utils')

local cmd = vim.cmd
local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'scrolloff', 4 )
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('w', 'number', true)
-- utils.opt('w', 'relativenumber', true)
utils.opt('o', 'clipboard','unnamed,unnamedplus')

-- vim-airline
vim.g.airline_left_sep = ''
vim.g.airline_left_alt_sep = ''
vim.g.airline_right_sep = ''
vim.g.airline_right_alt_sep = ''
-- vim.g.airline#extensions#tabline#left_sep = ''
-- vim.g.airline#extensions#tabline#left_alt_sep = ''

vim.g.airline_symbols = {
    branch = '';
    readonly = '';
    linenr = '';
    maxlinenr = '≡';
}

-- Movement
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true, silent = true })

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
