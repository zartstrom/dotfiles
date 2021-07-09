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
set termguicolors

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
let g:python_host_prog = '/usr/bin/python'
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
" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal g'\"" |
\ endif

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

" git
Plug 'tpope/vim-fugitive'

" repeat
Plug 'tpope/vim-repeat'

" Easy motion - Neovim motions on speed!
Plug 'phaazon/hop.nvim'
map <Space>j :HopLine<CR>
map <Space>w :HopWord<CR>
map <Space>f :HopChar1<CR>
map <Space>F :HopChar2<CR>

" surround.vim - quotes, brackets and (html-)tags
Plug 'tpope/vim-surround'

" abolish - develish good
Plug 'tpope/vim-abolish'

" NERDCommenter
Plug 'preservim/nerdcommenter'
map <leader>cc <leader>cl

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme='kalisi'
"let g:airline_theme='onedark'
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

" Python
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Plug 'dense-analysis/ale'

" Plug 'psf/black', { 'branch': 'stable' }
" autocmd BufWritePre *.py execute ':Black'

" vim-yaml
Plug 'stephpy/vim-yaml'

" NERD
Plug 'scrooloose/nerdtree'
let NERDTreeIgnore = ['\.pyc$', '\.class$']
map <leader>n :NERDTreeToggle<CR>

Plug 'Xuyuanp/nerdtree-git-plugin'

" colorizer
Plug 'norcalli/nvim-colorizer.lua'

" colorschemes
Plug 'flazz/vim-colorschemes'

" colorscheme onedark
Plug 'joshdick/onedark.vim'

" 'vmchale/just-vim' Syntax highlighting for justfiles
Plug 'vmchale/just-vim'

" startify
Plug 'mhinz/vim-startify'

" terraform
" Plug 'hashivim/vim-terraform'

" unicode vim
Plug 'chrisbra/unicode.vim'

" Try out this icons stuff
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/adelarsq/vim-devicons-emoji'

" Emoticons (fzf is dependency of the unicodemoji plugin)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Fuzzy Finder

Plug 'yazgoo/unicodemoji'
nmap <leader>u :Unicodemoji<CR>

Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'


" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'


" End plugins
call plug#end()

" lsp

"lua << EOF
"require'lspinstall'.setup()

"local servers = require'lspinstall'.installed_servers()
"for _, server in pairs(servers) do
"  require'lspconfig'[server].setup{}
"end
"EOF

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function",
        },
      },
    },
  },
}
EOF
lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },
}
EOF

" End plugin section
filetype plugin indent on

""" COLOR
lua require'colorizer'.setup()
"syntax enable
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"colorscheme OceanicNext
"set background=dark
"set background=light
" colorscheme kalisi
colorscheme onedark

hi ColorColumn cterm=NONE ctermbg=168 ctermfg=NONE
hi Search cterm=NONE ctermbg=190
hi NeomakeErrorMsg cterm=NONE ctermbg=168
hi NeomakeWarningMsg cterm=NONE ctermbg=148

au BufRead,BufNewFile *.py set colorcolumn=120

