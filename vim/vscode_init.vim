"                           _
"     _ __   ___  _____   _(_)_ __ ___
"    | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
"    | | | |  __/ (_) \ V /| | | | | | |
"    |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"

call plug#begin('~/.vim/plugged')

" fork of easymotion plugin for vscode
" actual plugin is in repository 'asvetliakov/vim-easymotion', but this does
" not work in neovim, so I renamed it in `~/.vim`.
" cd ~/.vim/plugged
" git clone https://github.com/asvetliakov/vim-easymotion.git vim-easymotion-vscode
Plug 'asvetliakov/vim-easymotion-vscode'
map <Space> <Plug>(easymotion-prefix)

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

call plug#end()

