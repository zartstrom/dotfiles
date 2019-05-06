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
set clipboard+=unnamedplus
set guioptions+=a

let g:did_install_default_menus = 1  " avoid stupid menu.vim (saves ~100ms)

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif
"set encoding=utf-8

set wildignore=*.pyc
syntax on                  " syntax highlighting

let mapleader = ","
let maplocalleader = "-"

""" PYTHON
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'


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
" convert tabs to four spaces
:nnoremap <leader>ts :%s/\t/    /g<CR>


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
autocmd BufNewFile,BufRead *Jenkinsfile*   set syntax=groovy
autocmd FileType pony setlocal shiftwidth=2 tabstop=2


""" PLUGIN SECTION
call plug#begin('~/.vim/plugged')

" ag aka the_silver_searcher
Plug 'rking/ag.vim'

" neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" 'pumvisible' read: popup menu visible
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Configuration for coc.nvim

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
"set cmdheight=2

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)

" Remap for do action format
nnoremap <silent> F :call CocAction('format')<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
Plug 'ryanoasis/vim-devicons'

" git
Plug 'tpope/vim-fugitive'

" repeat
Plug 'tpope/vim-repeat'

" vim-easymotion
Plug 'Lokaltog/vim-easymotion'
map <Space> <Plug>(easymotion-prefix)

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

" UltiSnips
"Plug 'SirVer/ultisnips'

""" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<s-tab>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

""" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<c-e>"
"let g:UltiSnipsJumpForwardTrigger = "<c-n>"
"let g:UltiSnipsJumpBackwardTrigger = "<c-p>"

"let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme='kalisi'
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
"let g:airline_left_sep = ' '
"let g:airline_left_alt_sep = ' '
"let g:airline_right_sep = ' '
"let g:airline_right_alt_sep = ' '
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = '≡'
"let g:airline_symbols.maxlinenr = '☰' " evil U2630

"let g:airline_symbols.space = "\ua0"
"let g:airline_symbols.space = " "
set laststatus=2

" CtrlP-Plugin
Plug 'kien/ctrlp.vim'

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svndoc|.ropeproject|backend.egg-info|node_modules)$',
  \ 'file': '\v\.(pyc|class)$',
  \ }

" Easy Align
Plug 'junegunn/vim-easy-align'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Python-Mode
Plug 'python-mode/python-mode', { 'branch': 'develop' }

let g:pymode_python = 'python3'

" linting
let g:pymode_lint = 1
let g:pymode_lint_unmodified = 1
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 1
" Values may be chosen from: `pylint`, `pep8`, `mccabe`, `pep257`, `pyflakes`.
let g:pymode_lint_checkers = ['pylint', 'mccabe', 'pyflakes']
"let g:pymode_lint_ignore = 'E501,E127,E126,E265,I,C0110,C0111,D102,D202,D401'
let g:pymode_lint_sort = ['E', 'W', 'C', 'I']
let g:pymode_lint_signs = 1

" linter options
let g:pymode_lint_options_mccabe = { 'complexity': 5 }
"let g:pymode_lint_options_pep8 = {'max_line_length': 120}
let g:pymode_lint_options_pylint = {'max-line-length': 120}

let g:pymode_virtualenv = 1
let g:pymode_run = 0        " disable run code
let g:pymode_folding = 0    " disable folding
let g:pymode_syntax = 1
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 10
let g:pymode_motion = 1
let g:pymode_trim_whitespace = 1

let g:pymode_lint_maxheight = 5
let g:pymode_lint_on_write = 1
let g:pymode_lint_cwindow = 1
let g:pymode_rope = 1
let ropevim_enable_shortcuts = 1
let g:pymode_rope_vim_completion = 1
"let g:pymode_rope_goto_def_newwin = "1"
map <leader>p :PymodeLint<CR>

" idris
Plug 'idris-hackers/idris-vim'

" JSHint
Plug 'walm/jshint.vim'

autocmd BufWritePost *.js :JSHint


" pony vim syntax
Plug 'dleonard0/pony-vim-syntax'

" vim-scala
Plug 'derekwyatt/vim-scala'

au BufRead,BufNewFile *.sbt set filetype=scala

" vim language server protocol
"Plug 'natebosch/vim-lsc'

"let g:lsc_enable_autocomplete = v:false
"let g:lsc_server_commands = {
"  \ 'scala': 'metals-vim'
"  \}
"let g:lsc_auto_map = {
"    \ 'GoToDefinition': 'gd',
"    \}

" vim-autoformat
Plug 'Chiel92/vim-autoformat'
noremap <F5> :Autoformat<CR>
"let g:formatdef_scalafmt = "'scalafmt --config ~/.config/scalafmt/.scalafmt.conf --stdin'"
let g:formatdef_scalafmt = "'scalafmt --stdin'"
let g:formatters_scala = ['scalafmt']

" vim-yaml
Plug 'stephpy/vim-yaml'

" NERD
Plug 'scrooloose/nerdtree'
let NERDTreeIgnore = ['\.pyc$', '\.class$']
map <leader>n :NERDTreeToggle<CR>

Plug 'Xuyuanp/nerdtree-git-plugin'

" Colorschemes
"" solarized colorscheme
"Plug 'altercation/vim-colors-solarized'

"" oceanic-next colorscheme
"Plug 'mhartington/oceanic-next'

"" vim-kalisi colorscheme
"Plug 'freeo/vim-kalisi'

"" vim-scripts/peaksea colorscheme
"Plug 'vim-scripts/peaksea'

" colorschemes
Plug 'flazz/vim-colorschemes'

" LineDiff
Plug 'AndrewRadev/linediff.vim'

" 'vmchale/just-vim' Syntax highlighting for justfiles
Plug 'vmchale/just-vim'

" startify
Plug 'mhinz/vim-startify'

" terraform
Plug 'hashivim/vim-terraform'

" unicode vim
Plug 'chrisbra/unicode.vim'

" End plugins
call plug#end()

" End plugin section
filetype plugin indent on

""" COLOR
"syntax enable
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"colorscheme OceanicNext
"set background=dark
set background=light
colorscheme kalisi
"colorscheme peaksea

hi ColorColumn cterm=NONE ctermbg=168 ctermfg=NONE
hi Search cterm=NONE ctermbg=190
hi NeomakeErrorMsg cterm=NONE ctermbg=168
hi NeomakeWarningMsg cterm=NONE ctermbg=148

au BufRead,BufNewFile *.py set colorcolumn=120
