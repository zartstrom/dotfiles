"                           _
"     _ __   ___  _____   _(_)_ __ ___
"    | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
"    | | | |  __/ (_) \ V /| | | | | | |
"    |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"

call plug#begin('~/.vim/plugged_vscode')

let mapleader = ","

Plug 'asvetliakov/vim-easymotion'
" Easy motion - Neovim motions on speed!
" fork of easymotion plugin for vscode
" Plug 'asvetliakov/vim-easymotion-vscode'
map <Space> <Plug>(easymotion-prefix)

"Plug 'phaazon/hop.nvim'
" does currently not work with vscode
"map <Space>j :HopLine<CR>
"map <Space>w :HopWord<CR>
"map <Space>f :HopChar1<CR>
"map <Space>F :HopChar2<CR>



" abolish - develish good
Plug 'tpope/vim-abolish'

" repeat
Plug 'tpope/vim-repeat'

" surround.vim - quotes, brackets and (html-)tags
Plug 'tpope/vim-surround'

" Easy Align
Plug 'junegunn/vim-easy-align'

" colorizer
Plug 'norcalli/nvim-colorizer.lua'

" Nerd Commenter
Plug 'preservim/nerdcommenter'
map <leader>cc <leader>cl

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Unicode emojis
Plug 'yazgoo/unicodemoji'
nmap <leader>u :Unicodemoji<CR>


call plug#end()

