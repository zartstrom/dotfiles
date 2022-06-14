-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP
  use  'neovim/nvim-lspconfig'
  use  'glepnir/lspsaga.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- Code Completion
  -- use  'nvim-lua/completion-nvim'
  use 'hrsh7th/nvim-compe'

  -- Lua development
  use  'tjdevries/nlua.nvim'

  -- Formatting
  use 'mhartington/formatter.nvim'
  -- use 'andrejlevkovitch/vim-lua-format'

  -- Neorg
  -- use {
  --   "vhyrro/neorg",
  --   config = function()
  --     require('neorg').setup {
  --       -- Tell Neorg what modules to load
  --       load = {
  --         ["core.defaults"] = {}, -- Load all the default modules
  --         ["core.norg.concealer"] = {}, -- Allows for use of icons
  --         ["core.norg.dirman"] = { -- Manage your directories with Neorg
  --           config = {
  --             workspaces = {
  --               my_workspace = "~/.neorg"
  --             }
  --           }
  --         }
  --       },
  --     }
  --   end,
  --   requires = "nvim-lua/plenary.nvim"
  -- }

  -- Justfile
  use 'NoahTheDuke/vim-just'

  -- Tpope goodies
  use 'tpope/vim-abolish'
  use 'tpope/vim-commentary'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  -- use 'tpope/vim-sensible' -- try it out some time
  use 'tpope/vim-surround'


  -- vim-airline
  use  'vim-airline/vim-airline'
  use  'vim-airline/vim-airline-themes'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- Color
  use 'norcalli/nvim-colorizer.lua'
  use 'ful1e5/onedark.nvim'

  -- Hop
  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

end)
