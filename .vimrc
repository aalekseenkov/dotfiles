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
set cursorline
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
set t_Co=256
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
set termguicolors
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
nnoremap <silent> <F4> :set cursorline!<CR>
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

" Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
"For development
Plug 'chiel92/vim-autoformat'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'yggdroot/indentline'
Plug 'skywind3000/asyncrun.vim'

call plug#end()

"Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled = 0
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
let g:Powerline_symbols='unicode'
let g:airline#extensions#xkblayout#enabled = 0

"yggdroot/indentline'
let g:indentLine_char = '|'
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

"ALE
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

"Background
" set background=dark
" set background=light

"Gruvbox
" let g:gruvbox_contrast_dark='medium'
" let g:gruvbox_contrast_light='soft'
" colorscheme gruvbox

"Current colorschemes
colorscheme navajo-night
" colorscheme breeze
" colorscheme newspaper
" colorscheme dusk

"Backlog
"colorscheme ashen
"colorscheme aurora
"colorscheme base16-atelierdune
"colorscheme base16-atelierestuary
"colorscheme base16-atelierforest
"colorscheme base16-atelierheath
"colorscheme base16-atelierplateau
"colorscheme basic
"colorscheme blueprint
"colorscheme borland
"colorscheme breeze
"colorscheme colorsbox-material
"colorscheme colorzone
"colorscheme cthulhian
"colorscheme darkblue2
"colorscheme dawn
"colorscheme denim
"colorscheme deus
"colorscheme dusk
"colorscheme eclipse
"colorscheme fairyfloss
"colorscheme flattened_light
"colorscheme herokudoc
"colorscheme lakers_away
"colorscheme lightning
"colorscheme LightTan
"colorscheme lilac
"colorscheme materialbox
"colorscheme moria
"colorscheme navajo-night
"colorscheme neutron
"colorscheme newspaper
"colorscheme nord
"colorscheme nuvola
"colorscheme osx_like
"colorscheme PapayaWhip
"colorscheme pleasant
"colorscheme pyte
"colorscheme rainbow_autumn
"colorscheme rainbow_sea
"colorscheme seoul256
"colorscheme simple_b
"colorscheme solarized8_light_high
"colorscheme soso
"colorscheme spring-night
"colorscheme stackoverflow
"colorscheme sweater
"colorscheme tango-desert
"colorscheme tango-morning
"colorscheme tangoX
"colorscheme twilight256
"colorscheme xian
