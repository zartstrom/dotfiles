-- [[ Setting options ]]
-- See `:help vim.opt`
-- Set cursor highlight
vim.opt.cursorcolumn = true
vim.opt.cursorline = true

vim.opt.expandtab = true
vim.opt.smartindent = true

-- Set highlight on search
vim.opt.hlsearch = false

-- Make line numbers default
vim.opt.number = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 2

-- Enable mouse mode
vim.opt.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(
    function()
        vim.opt.clipboard = "unnamedplus"
    end
)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true

vim.opt.title = true
vim.opt.showmode = false

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = {tab = "» ", trail = "·", nbsp = "␣"}

vim.opt.spelllang = "en_us"
vim.opt.spell = false
