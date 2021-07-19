-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/completion-nvim' }

  -- Lua development
  use { 'tjdevries/nlua.nvim' }


  -- Vim dispatch
  use { 'tpope/vim-dispatch' }
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'

  -- Fugitive for Git
  use { 'tpope/vim-fugitive' }

  -- vim-airline
  use { 'vim-airline/vim-airline' }
  use { 'vim-airline/vim-airline-themes' }

  -- treesitter
   use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
   use { 'nvim-treesitter/nvim-treesitter-textobjects' }


  -- lua
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  -- 'nvim-telescope/telescope.nvim'

  -- Color
  use 'norcalli/nvim-colorizer.lua'
  use 'ful1e5/onedark.nvim'

  -- Hop
  use 'phaazon/hop.nvim'

end)
