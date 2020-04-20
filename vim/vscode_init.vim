"                           _
"     _ __   ___  _____   _(_)_ __ ___
"    | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
"    | | | |  __/ (_) \ V /| | | | | | |
"    |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"



call plug#begin('~/.vim/plugged')

" abolish - develish good
Plug 'tpope/vim-abolish'

" repeat
Plug 'tpope/vim-repeat'

" surround.vim - quotes, brackets and (html-)tags
Plug 'tpope/vim-surround'

" cd ~/.vim/plugged
" git clone https://github.com/asvetliakov/vim-easymotion.git vim-easymotion-vscode
Plug 'asvetliakov/vim-easymotion-vscode'
map <Space> <Plug>(easymotion-prefix)

" End plugins
call plug#end()



hi ColorColumn cterm=NONE ctermbg=168 ctermfg=NONE
hi Search cterm=NONE ctermbg=190
hi NeomakeErrorMsg cterm=NONE ctermbg=168
hi NeomakeWarningMsg cterm=NONE ctermbg=148

au BufRead,BufNewFile *.py set colorcolumn=120

