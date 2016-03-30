"                           _
"     _ __   ___  _____   _(_)_ __ ___
"    | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
"    | | | |  __/ (_) \ V /| | | | | | |
"    |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"

filetype off

""" BASIC SETTINGS
set smarttab
set expandtab
set tabstop=4
set sw=4                " shift width
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME
set ai                  " always set autoindenting on
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                         " than 50 lines of registers
set history=1000        " keep 1000 lines of command line history
set undolevels=1000     " use many muchos levels of undo
set hlsearch
set incsearch           " show search matches as you type
set ruler               " show the cursor position all the time
set number
set cursorline
set cursorcolumn
set directory=~/.vimswap
set pastetoggle=<F2>
set mouse=a
set autoread            " Reload files when they are changed by another process.
set tw=0


if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif
"set encoding=utf-8

set wildignore=*.pyc
syntax on                  " syntax highlighting

let mapleader = ","


""" PYTHON
let g:python_host_prog = "/usr/bin/python2"


""" MOVEMENT
" Move between windows
:tnoremap <C-h> <C-\><C-n><C-w>h
:tnoremap <C-j> <C-\><C-n><C-w>j
:tnoremap <C-k> <C-\><C-n><C-w>k
:tnoremap <C-l> <C-\><C-n><C-w>l
:nnoremap <C-h> <C-w>h
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l
"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-l> <c-w>l
"map <c-h> <c-w>h
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
map <A-C-Left>  :bprevious<CR>
map <A-C-Right> :bnext<CR>

""" TERMINAL
:tnoremap <Esc> <C-\><C-n>


""" SOME CUSTOM HELPERS
" register stuff
:nnoremap <leader>rr :let @f=@% \| let @a=@" \| let @+=@" \| let @*=@"<CR>
:nnoremap <leader>rf :let @"=@% \| let @+=@% \| let @*=@%<CR>
:nnoremap <leader>rt :let @"=@*<CR>
:nnoremap <leader>rv :let @"=@+<CR>

" remove trailing whitespace
:nnoremap <leader>tr :%s/\s\+$//g<CR>


""" AUTOCMD
autocmd BufRead *.txt set tw=78
autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin
" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal g'\"" |
\ endif
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
" automatically close scratch window
autocmd CursorMovedI *  if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif
autocmd BufRead,BufNewFile *.conf setf dosini
"hi BadWhitespace ctermbg=red guibg=#FF0000
"autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
autocmd BufNewFile,BufRead *.js.vm   set syntax=python


""" PLUGIN SECTION
call plug#begin('~/.vim/plugged')

" ag aka the_silver_searcher
Plug 'rking/ag.vim'


" git
Plug 'tpope/vim-fugitive'


" repeat
Plug 'tpope/vim-repeat'


" vim-easymotion
Plug 'Lokaltog/vim-easymotion'

map <Space> <Plug>(easymotion-prefix)


" LaTeX-Box
Plug 'LaTeX-Box-Team/LaTeX-Box'

let g:LatexBox_latexmk_options = "-pvc -pdfps"
let g:LatexBox_latexmk_async = 1
nnoremap <leader>ll :Latexmk<CR>


" surround.vim - quotes, brackets and (html-)tags
Plug 'tpope/vim-surround'


" abolish - develish good
Plug 'tpope/vim-abolish'


" NERDCommenter
Plug 'scrooloose/nerdcommenter'

map <leader>cc <leader>cl

" js-beautify
Plug 'maksimr/vim-jsbeautify'
Plug 'einars/js-beautify'

" autocmd FileType javascript vnoremap <buffer>  <C-f> :call RangeJsBeautify()<cr>
" autocmd FileType html vnoremap <buffer> <C-f> :call RangeHtmlBeautify()<cr>
" autocmd FileType css vnoremap <buffer> <C-f> :call RangeCSSBeautify()<cr>
" for js
autocmd FileType javascript noremap <leader>b :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <leader>b :call HtmlBeautify()<cr>

" taglist.vim
Plug 'vim-scripts/taglist.vim'

" python tagbar
Plug 'majutsushi/tagbar'

nmap <F8> :TagbarToggle<CR>


" restructured text
Plug 'Rykka/riv.vim'


" R
Plug 'jcfaria/Vim-R-plugin'


" tern_for_vim
Plug 'marijnh/tern_for_vim'


" supertab
Plug 'ervandew/supertab'


" UltiSnips
Plug 'SirVer/ultisnips'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<s-tab>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-e>"
let g:UltiSnipsJumpForwardTrigger = "<c-n>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"


" vim-snippets
Plug 'honza/vim-snippets'


" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme='dark'
"let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline_section_x = 'reg:%{v:register}'
"let g:airline_section_x = ''
"let g:airline_symbols = get(g:, 'airline_symbols', {})
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols

" powerline symbols
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = ''

let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"let g:airline_symbols.space = "\ua0"
"let g:airline_symbols.space = " "
set laststatus=2


" vimwiki
Plug 'vimwiki/vimwiki'

nnoremap <leader>wa :VimwikiAll2HTML<CR><CR>:e<CR>
let vimwiki_path='/home/philipp/vimwiki/'
let vimwiki_export_path='/home/philipp/vimwiki_html/'
let wiki_settings={
\ 'template_path': vimwiki_path.'templates/',
\ 'template_default': 'default',
\ 'template_ext': '.html',
\ 'auto_export': 0,
\ 'nested_syntaxes': {'js': 'javascript', 'python': 'python'}
\ }

let wiki=copy(wiki_settings)
let wiki.path = vimwiki_path
let wiki.path_html = vimwiki_export_path
let wiki.diary_index = 'index'
let wiki.diary_rel_path = 'diary/'
" call add(g:vimwiki_list, wiki)
let g:vimwiki_list = [wiki]


" CtrlP-Plugin
Plug 'kien/ctrlp.vim'

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svndoc|.ropeproject|backend.egg-info|node_modules)$',
  \ 'file': '\v\.(pyc|class)$',
  \ }


" Python-Mode
Plug 'klen/python-mode'

let g:pymode_virtualenv = 1
let g:pymode_run = 0        " disable run code
let g:pymode_folding = 0    " disable folding
let g:pymode_syntax = 1
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
let g:pymode_motion = 1
let g:pymode_trim_whitespace = 1
let g:pymode_lint = 1
let g:pymode_lint_signs = 1
"let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe', 'pep257']
let g:pymode_lint_checkers = ['pylint', 'pep8']
"let g:pymode_lint_checkers = ['pylint']
let g:pymode_lint_mccabe_complexity = 10
let g:pymode_lint_ignore = "E501,E127,E126,E265,I,C0110,C0111,D102,D202,D401"
let g:pymode_lint_maxheight = 5
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_write = 1
let g:pymode_lint_on_fly = 0
let g:pymode_lint_cwindow = 1
let g:pymode_lint_message = 1
let g:pymode_lint_sort = ['E', 'W', 'C', 'I']
" disable rope, we use YCM
let g:pymode_rope = 0
let ropevim_enable_shortcuts = 0
let g:pymode_rope_vim_completion = 0
"let g:pymode_rope_goto_def_newwin = "1"
let g:pymode_options_max_line_length = 120
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
map <leader>p :PymodeLint<CR>

" neomake
Plug 'benekastah/neomake'

" grep
Plug 'yegappan/grep'

let Grep_Skip_Files = '*.pyc'


" JSHint
Plug 'walm/jshint.vim'

autocmd BufWritePost *.js :JSHint


" vim-scala
Plug 'derekwyatt/vim-scala'


" sbt-vim
Plug 'ktvoelker/sbt-vim'


" vim-scripts/scala.vim - syntax highlighting
Plug 'vim-scripts/scala.vim'

au BufRead,BufNewFile *.scala set filetype=scala
au! Syntax scala source ~/.vim/plugged/scala.vim/syntax/scala.vim


" vim-xpath
Plug 'actionshrimp/vim-xpath'
nnoremap <leader>xp :XPathSearchPrompt<CR>


" virtualenv
"Plug 'jmcantrell/vim-virtualenv'


" YouCompleteMe
Plug 'Valloric/YouCompleteMe'

let g:ycm_goto_same_buffer = 0
let g:ycm_goto_buffer_command = 'same-buffer'
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_semantic_triggers =  {}
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'

nnoremap <leader>jD :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>


" vim-yaml
Plug 'stephpy/vim-yaml'


" NERD
Plug 'scrooloose/nerdtree'
let NERDTreeIgnore = ['\.pyc$', '\.class$']
map <leader>n :NERDTreeToggle<CR>


" base16 colors
"Plug 'chriskempson/base16-vim'


" dgbPavim - PHP debugger
Plug 'brookhong/DBGPavim'

"let g:dbgPavimBreakAtEntry = 0
let g:dbgPavimPort = 9000


" cycle colorschemes
Plug 'vim-scripts/CycleColor'


" Add plugins to &runtimepath
call plug#end()


" End plugin section
filetype plugin indent on


""" COLOR
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme ron
" further settings for colorscheme morning:
hi CursorLine cterm=none ctermbg=234 ctermfg=none
hi CursorColumn cterm=none ctermbg=234 ctermfg=none
"set colorcolumn=120
hi ColorColumn cterm=none ctermbg=53 ctermfg=none
hi Search cterm=NONE ctermbg=190

au BufRead,BufNewFile *.py set colorcolumn=120
