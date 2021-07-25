-- neovim config
-- github.com/ojroques

-------------------- HELPERS -------------------------------
local api, cmd, fn, g = vim.api, vim.cmd, vim.fn, vim.g
local opt, wo = vim.opt, vim.wo
local fmt = string.format

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-------------------- BOOTSTRAP -----------------------------
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-------------------- PLUGINS -------------------------------
require('plugins')


-------------------- OPTIONS -------------------------------
local indent, width = 4, 108
opt.colorcolumn = tostring(width)   -- Line length marker
opt.completeopt = {'menuone', 'noinsert', 'noselect'}  -- Completion options
opt.cursorcolumn = true             -- Highlight cursor column
opt.cursorline = true               -- Highlight cursor line
opt.expandtab = true                -- Use spaces instead of tabs
opt.formatoptions = 'crqnj'         -- Automatic formatting options
opt.hidden = true                   -- Enable background buffers
opt.ignorecase = true               -- Ignore case
opt.joinspaces = false              -- No double spaces with join
opt.list = true                     -- Show some invisible characters
opt.mouse = 'a'                     -- Add mouse support in _a_ll modes
opt.number = true                   -- Show line numbers
opt.pastetoggle = '<F2>'            -- Paste mode
-- opt.relativenumber = true           -- Relative line numbers
opt.scrolloff = 4                   -- Lines of context
opt.shiftround = true               -- Round indent
opt.shiftwidth = indent             -- Size of an indent
opt.sidescrolloff = 8               -- Columns of context
opt.signcolumn = 'yes'              -- Show sign column
opt.smartcase = true                -- Do not ignore case with capitals
opt.smartindent = true              -- Insert indents automatically
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new windows right of current
opt.tabstop = indent                -- Number of spaces tabs count for
opt.termguicolors = true            -- True color support
opt.textwidth = width               -- Maximum width of text
opt.updatetime = 100                -- Delay before swap file is saved
opt.wildmode = {'list', 'longest'}  -- Command-line completion mode
opt.wrap = false                    -- Disable line wrap
cmd 'colorscheme onedark'


-------------------- MAPPINGS ------------------------------
map('n', ',', '<leader>', {noremap = false})
map('', '<leader>c', '"+y')
map('i', '<C-u>', '<C-g>u<C-u>')
map('i', '<C-w>', '<C-g>u<C-w>')
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map('i', 'jj', '<ESC>')
map('n', '<C-l>', '<cmd>nohlsearch<CR>')
-- map('n', '<C-w>T', '<cmd>tabclose<CR>')
-- map('n', '<C-w>t', '<cmd>tabnew<CR>')
map('n', '<F3>', '<cmd>lua toggle_wrap()<CR>')
map('n', '<F4>', '<cmd>set scrollbind!<CR>')
map('n', '<F5>', '<cmd>checktime<CR>')
map('n', '<S-Down>', '<C-w>2<')
map('n', '<S-Left>', '<C-w>2-')
map('n', '<S-Right>', '<C-w>2+')
map('n', '<S-Up>', '<C-w>2>')
map('n', '<leader>s', ':%s//gcI<Left><Left><Left><Left>')
map('n', '<leader>t', '<cmd>terminal<CR>')
map('n', '<leader>u', '<cmd>update<CR>')
map('n', '<leader>x', '<cmd>conf qa<CR>')
-- map('n', 'Q', '<cmd>lua warn_caps()<CR>')
-- map('n', 'U', '<cmd>lua warn_caps()<CR>')
map('t', '<ESC>', '&filetype == "fzf" ? "\\<ESC>" : "\\<C-\\>\\<C-n>"' , {expr = true})
map('t', 'jj', '<ESC>', {noremap = false})
map('v', '<leader>s', ':s//gcI<Left><Left><Left><Left>')



-------------------- PLUGIN SETUP --------------------------

-------------------- LSP -----------------------------------
-- require'lspconfig'.pyright.setup{}
local lsp = require('lspconfig')
-- for ls, cfg in pairs({
--   bashls = {}, gopls = {}, ccls = {}, jsonls = {},
--   pyls = {root_dir = lsp.util.root_pattern('.git', fn.getcwd())},
-- }) do lsp[ls].setup(cfg) end

-- nvim-completion requires this:
-- require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}


-------------------- LSP SAGA ------------------------------
local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}

map('n', 'K', ':Lspsaga hover_doc<CR>', {silent = true})
map('n', 'gh', ':Lspsaga lsp_finder<CR>', {silent = true})
map('i', '<C-k>', '<CMD>Lspsaga signature_help<CR>')


-------------------- TREE-SITTER ---------------------------
require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = {enable = true},
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ['aa'] = '@parameter.outer', ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer', ['if'] = '@function.inner',
        ['ac'] = '@class.outer', ['ic'] = '@class.inner',
      },
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    swap = {
      enable = true,
      swap_next = {['<leader>a'] = '@parameter.inner'},
      swap_previous = {['<leader>A'] = '@parameter.inner'},
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {[']a'] = '@parameter.outer', [']f'] = '@function.outer', [']c'] = '@class.outer'},
      goto_next_end = {[']A'] = '@parameter.outer', ['<leader>ö'] = '@function.outer', [']C'] = '@class.outer'},
      goto_previous_start = {['[a'] = '@parameter.outer', ['[f'] = '@function.outer', ['[c'] = '@class.outer'},
      goto_previous_end = {['[A'] = '@parameter.outer', ['[F'] = '@function.outer', ['[C'] = '@class.outer'},
    },
  },
}
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
  install_info = {
    url = "https://github.com/vhyrro/tree-sitter-norg",
    files = { "src/parser.c" },
    branch = "main"
  },
}

-------------------- TELESCOPE -----------------------------
local telescope_builtin = require('telescope.builtin')

map('n', '<leader>ff', "<CMD>lua require('telescope.builtin').find_files()<CR>")
map('n', '<leader>fg', "<CMD>lua require('telescope.builtin').live_grep()<CR>")
map('n', '<leader>fb', "<CMD>lua require('telescope.builtin').buffers()<CR>")
map('n', '<leader>fh', "<CMD>lua require('telescope.builtin').help_tags()<CR>")

-------------------- Hop -----------------------------------

require('hop').setup{}
map('n', '<Space>j', ':HopLine<CR>')
map('n', '<Space>w', ':HopWord<CR>')
map('n', '<Space>f', ':HopChar1<CR>')
map('n', '<Space>F', ':HopChar2<CR>')

map('n', 'y<Space>j', 'y:HopLine<CR>')
map('n', 'y<Space>w', 'y:HopWord<CR>')
map('n', 'y<Space>f', 'y:HopChar1<CR>')
map('n', 'y<Space>F', 'y:HopChar2<CR>')

map('n', 'd<Space>j', 'd:HopLine<CR>')
map('n', 'd<Space>w', 'd:HopWord<CR>')
map('n', 'd<Space>f', 'd:HopChar1<CR>')
map('n', 'd<Space>F', 'd:HopChar2<CR>')

-------------------- colorizer -----------------------------
-- Use the `default_options` as the second parameter, which uses
-- `foreground` for every mode. This is the inverse of the previous
-- setup configuration.
require('colorizer').setup {
  '*'; -- Highlight all files, but customize some others.
  css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
  html = { names = false; } -- Disable parsing "names" like Blue or Gray
}

-------------------- Code Completion -----------------------
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
    neorg = true;
  };
}

-------------------- COMMANDS ------------------------------
function init_term()
  cmd 'setlocal nonumber norelativenumber'
  cmd 'setlocal nospell'
  cmd 'setlocal signcolumn=auto'
end

function toggle_wrap()
  wo.breakindent = not wo.breakindent
  wo.linebreak = not wo.linebreak
  wo.wrap = not wo.wrap
end

function warn_caps()
  cmd 'echohl WarningMsg'
  cmd 'echo "Caps Lock may be on"'
  cmd 'echohl None'
end

--vim.tbl_map(function(c) cmd(fmt('autocmd %s', c)) end, {
--  'TermOpen * lua init_term()',
--  'TextYankPost * lua vim.highlight.on_yank {timeout = 200, on_visual = false}',
--  'TextYankPost * if v:event.operator is "y" && v:event.regname is "+" | OSCYankReg + | endif',
--  'VimEnter * call deoplete#custom#var("omni", "input_patterns", {"tex": g:vimtex#re#deoplete})',
--})

require'settings'

