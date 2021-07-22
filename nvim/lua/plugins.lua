-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/completion-nvim' }

  -- Lua development
  use { 'tjdevries/nlua.nvim' }


  -- tpope goodies
  use 'tpope/vim-abolish'
  use 'tpope/vim-commentary'
  use 'tpope/vim-dadbot'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  -- use 'tpope/vim-sensible' -- try it out some time
  use 'tpope/vim-surround'

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
  use {
  'phaazon/hop.nvim',
  as = 'hop',
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end
}

end)
