"General
filetype plugin indent on
set nocompatible
set hidden
set fileformat=unix
syntax enable

"Writing
set nospell

"Splits
set splitbelow
set splitright

"Mouse
" set mouse=a
" set mousehide

"Encoding
scriptencoding utf-8
set encoding=utf-8

"Indent
set autoindent
set smartindent

"Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab

"Visual
set laststatus=2
set scrolloff=2
set signcolumn=number
set showcmd
set noshowmode
set conceallevel=0
set number relativenumber
set showtabline=0
" set cursorline
" set wrap linebreak nolist
set nowrap
set list
" set listchars=eol:.,tab:>-,trail:~,extends:>,precedes:<
set listchars=tab:→\ ,trail:·,nbsp:¬
set cc=80
set textwidth=79

"Searching
set ignorecase
set smartcase
set incsearch
set hlsearch

"Folding
set nofoldenable
set foldmethod=indent
set foldminlines=4
set foldnestmax=4
" set foldlevel=2
" set foldlevelstart=0

"More CLI
set vb
set t_ut=""

"YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"Markdown
autocmd Bufread *.md setlocal textwidth=0

"Python
au BufNewFile,BufRead *.py
\ set tabstop=4
\ set softtabstop=4
\ set shiftwidth=4

"Colors
hi Normal guibg=NONE ctermbg=NONE
let g:terminal_ansi_colors = [
\ '#282828', '#cc241d', '#98971a', '#d79921',
\ '#458588', '#b16286', '#689d6a', '#a89984',
\ '#928374', '#fb4934', '#b8bb26', '#fabd2f',
\ '#83a598', '#d3869b', '#8ec07c', '#ebdbb2',
\]

"Languages <C-^>
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

"Mappings
let mapleader = "-"

nnoremap <CR> :noh<CR><CR>:<backspace>

noremap <F3> :Autoformat<CR>
" nnoremap <silent> <F4> :set cursorline!<CR>
noremap <F5> :!python3 %:p<CR>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"Others
set noerrorbells visualbell t_vb=
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set clipboard=unnamedplus
set shortmess+=c
set formatoptions-=cro

"Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

Plug 'sainnhe/everforest'
Plug 'sainnhe/edge'
Plug 'NLKNguyen/papercolor-theme'
Plug 'lifepillar/vim-solarized8'
Plug 'icymind/neosolarized'

Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'scrooloose/nerdtree'

Plug 'sheerun/vim-polyglot'
Plug 'chiel92/vim-autoformat'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'skywind3000/asyncrun.vim'
" Plug 'flazz/vim-colorschemes'

call plug#end()

"ALE
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

" =====================
" Colorscheme settings
" =====================
set t_Co=256
if has('termguicolors')
  set termguicolors
endif

" ===========
" Background
" ===========
set background=dark
" set background=light

" Everforest
" Set contrast: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'soft'
let g:everforest_better_performance = 1

" Edge
" Edge styles: 'default(default)', 'aura', 'neon'
let g:edge_style = 'aura'
let g:edge_better_performance = 1

" NeoSolarized
let g:neosolarized_contrast = "normal"
let g:neosolarized_visibility = "normal"
let g:neosolarized_vertSplitBgTrans = 1
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0
let g:neosolarized_termBoldAsBright = 1

" =====================
" Plugin colorschemes
" =====================
" colorscheme NeoSolarized
colorscheme everforest
" colorscheme edge
" colorscheme PaperColor
" colorscheme solarized8
" colorscheme solarized8_flat
" colorscheme solarized8_high
" colorscheme solarized8_low

" =========================
" Stand-alone colorschemes
" =========================
" colorscheme selenized
" colorscheme selenized_bw
" colorscheme OKSolar-dark
" colorscheme OKSolar-light
" colorscheme breeze
" colorscheme navajo-night
" colorscheme newspaper

" lightline
let g:lightline = {}

" ========================
" colorschemes lightlines
" ========================
let g:lightline.colorscheme = 'everforest'
" let g:lightline.colorscheme = 'edge'
" let g:lightline.colorscheme = 'PaperColor'

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \  'linter_unavailable': 'lightline#ale#unavailable',
      \ }
let g:lightline.component_type = {
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \ }
let g:lightline.active = {
            \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok', 'linter_unavailable' ],
            \            [ 'lineinfo' ],
            \            [ 'percent' ],
            \            [ 'fileformat', 'fileencoding', 'filetype'] ] }

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"
let g:lightline#ale#indicator_unavailable = "\uf05e"
