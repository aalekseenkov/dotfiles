" 1. Auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 2. Plugins
call plug#begin('~/.vim/plugged')

" Themes
Plug 'sainnhe/everforest'
Plug 'mhartington/oceanic-next'
Plug 'cocopon/iceberg.vim'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'lifepillar/vim-solarized8'
Plug 'icymind/neosolarized'

" Tools
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'
Plug 'chiel92/vim-autoformat'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'skywind3000/asyncrun.vim'

call plug#end()

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
set showtabline=0
set laststatus=2
set cmdheight=1
set scrolloff=6
set sidescrolloff=6
set sidescroll=1
set lazyredraw
set ttyfast
set signcolumn=number
set showcmd
set noshowmode
set conceallevel=0
set number relativenumber
" set cursorline
" set wrap linebreak nolist
set nowrap
set list
set listchars=tab:→\ ,trail:·,nbsp:¬,extends:»,precedes:«
set cc=80
set textwidth=79
" for helm
set foldmethod=indent
set foldlevel=99
set foldcolumn=1

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

" YAML & Kubernetes
augroup VimDevOps
  autocmd!
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0#
  autocmd FileType yaml setlocal list listchars=tab:\|\ ,trail:·,nbsp:¬
augroup END

" ALE settings for YAML (yamllint)
let g:ale_yaml_yamllint_options = '-d "{extends: relaxed, rules: {line-length: {max: 120}}}"'

" Bash: make a script executable
augroup VimBash
  autocmd!
  autocmd BufWritePost *.sh silent! !chmod +x %
augroup END

" Docker
au BufNewFile,BufRead Dockerfile* set filetype=dockerfile

"Markdown
autocmd Bufread *.md setlocal textwidth=0

" Python Configuration
augroup VimPython
  autocmd!
  autocmd FileType python highlight ColorColumn guibg=#4F5B66
  autocmd BufNewFile,BufRead *.py
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal expandtab |
    \ setlocal autoindent |
    \ setlocal fileformat=unix
augroup END
autocmd BufWritePre *.py :%s/\s\+$//e

" ripgrep
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', <bang>0), <bang>0)

"Colors for MARIANA
let g:terminal_ansi_colors = [
\ '#343D46', '#EC5F67', '#99C794', '#FAC863',
\ '#6699CC', '#C594C5', '#5FB3B3', '#D8DEE9',
\ '#65737E', '#EC5F67', '#99C794', '#FAC863',
\ '#6699CC', '#C594C5', '#5FB3B3', '#FFFFFF',
\]

"Languages <C-^>
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

"Mappings
nnoremap <Space> <Nop>
let mapleader = " "

nnoremap <CR> :noh<CR><CR>:<backspace>

noremap <F3> :Autoformat<CR>
" nnoremap <silent> <F4> :set cursorline!<CR>
noremap <F5> :!python3 %:p<CR>

" no arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" fzf mapping
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>w :Rg <C-R><C-W><CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>s :BTags<CR>

" Toggle NERDTree with Ctrl+n
nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 25
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"Others
set noerrorbells
set novisualbell
set t_vb=
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set clipboard=unnamedplus
set shortmess+=c
set formatoptions-=cro

" Remember the last place in the file
augroup ResCur
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

"ALE OLD
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_sign_error = '✘'
" let g:ale_sign_warning = '⚠'
" let g:ale_lint_on_text_changed = 'never'

"ALE MARIANNA
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['✖ %d', '⚠ %d', '']

let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'normal'

" Colorscheme settings
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Background
set background=dark
" set background=light

" Everforest
let g:everforest_background = 'soft'
let g:everforest_better_performance = 1
let g:everforest_show_eob = 0

" NeoSolarized
let g:neosolarized_contrast = "normal"
let g:neosolarized_visibility = "normal"
let g:neosolarized_vertSplitBgTrans = 1
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0
let g:neosolarized_termBoldAsBright = 1

" Plugin colorschemes
silent! colorscheme mariana
" colorscheme everforest
" colorscheme NeoSolarized
" colorscheme PaperColor
" colorscheme solarized8
" colorscheme solarized8_flat
" colorscheme solarized8_high
" colorscheme solarized8_low

" Stand-alone colorschemes
" colorscheme selenized
" colorscheme selenized_bw
" colorscheme OKSolar-dark
" colorscheme OKSolar-light
" colorscheme breeze
" colorscheme navajo-night
" colorscheme newspaper

" Mariana highlights
highlight FoldColumn guibg=NONE guifg=#4F5B66
highlight SignColumn guibg=NONE guifg=#4F5B66
highlight Folded guibg=#4F5B66 guifg=#5FB3B3 gui=italic
highlight ALEErrorSign guifg=#EC5F67 guibg=#343D46
highlight ALEWarningSign guifg=#FAC863 guibg=#343D46
highlight ExtraWhitespace ctermbg=red guibg=#EC5F67
match ExtraWhitespace /\s\+$/
match ErrorMsg / \+\ze\t/

" lightline
" let g:lightline.colorscheme = 'OceanicNext'
" let g:lightline.colorscheme = 'embark'
" let g:lightline.colorscheme = 'everforest'
" let g:lightline.colorscheme = 'PaperColor'

" =============================================================================
" 1. LIGHTLINE MARIANA COLOR PALETTE
" =============================================================================
let s:bg    = '#343D46' " Background (Dark)
let s:gray  = '#4F5B66' " Separators (Selection)
let s:fg    = '#D8DEE9' " Text (Foreground)
let s:blue  = '#6699CC' " Normal Mode
let s:green = '#99C794' " Insert Mode
let s:purp  = '#C594C5' " Visual Mode
let s:red   = '#EC5F67' " Replace Mode
let s:yel   = '#FAC863' " Warning/Yellow

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

" Color settings for different modes [guifg, guibg]
let s:p.normal.left     = [ [ s:bg, s:blue ], [ s:fg, s:gray ] ]
let s:p.normal.middle   = [ [ s:fg, s:bg ] ]
let s:p.normal.right    = [ [ s:bg, s:blue ], [ s:fg, s:gray ] ]

let s:p.insert.left     = [ [ s:bg, s:green ], [ s:fg, s:gray ] ]
let s:p.visual.left     = [ [ s:bg, s:purp ], [ s:fg, s:gray ] ]
let s:p.replace.left    = [ [ s:bg, s:red ], [ s:fg, s:gray ] ]

let s:p.inactive.left   = [ [ s:gray, s:bg ], [ s:gray, s:bg ] ]
let s:p.inactive.middle = [ [ s:gray, s:bg ] ]
let s:p.inactive.right  = [ [ s:gray, s:bg ], [ s:gray, s:bg ] ]

let s:p.tabline.left    = [ [ s:fg, s:gray ] ]
let s:p.tabline.tabsel  = [ [ s:bg, s:blue ] ]
let s:p.tabline.middle  = [ [ s:gray, s:bg ] ]
let s:p.tabline.right   = [ [ s:bg, s:blue ] ]

let s:p.normal.error    = [ [ s:bg, s:red ] ]
let s:p.normal.warning  = [ [ s:bg, s:yel ] ]

let g:lightline#colorscheme#mariana#palette = lightline#colorscheme#fill(s:p)

" =============================================================================
" 2. LIGHTLINE MAIN CONFIGURATION
" =============================================================================
let g:lightline = {
      \ 'colorscheme': 'mariana',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
      \              [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightlineGitBranch',
      \ },
      \ 'component_expand': {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_infos': 'lightline#ale#infos',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \ }
      \ }

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c"

" =============================================================================
" 3. COMPONENT FUNCTIONS (GIT & LINTER)
" =============================================================================

" Git Branch Function (requires tpope/vim-fugitive)
function! LightlineGitBranch()
  if exists('*FugitiveHead')
    let branch = FugitiveHead()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

" ALE Linter Errors (requires dense-analysis/ale)
function! LightlineLinterErrors() abort
  if !exists('*ale#statusline#Count') | return '' | endif
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  return l:all_errors > 0 ? printf('✖ %d', l:all_errors) : ''
endfunction

" ALE Linter Warnings
function! LightlineLinterWarnings() abort
  if !exists('*ale#statusline#Count') | return '' | endif
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_warnings = l:counts.warning + l:counts.style_warning
  return l:all_warnings > 0 ? printf('⚠ %d', l:all_warnings) : ''
endfunction

" Force update lightline when ALE finishing linting
autocmd User ALELintPost call lightline#update()

" fzf settings
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } } " Окно по центру, 60% высоты
let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'

" fzf aka Mariana
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Function'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Keyword'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
