" Vim color file
" Name:         Mariana Plus
" Description:  Complete port of Mariana (Sublime Text) for Vim with plugin support
" Maintainer:   Custom Build

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "mariana"

" ==========================================
" Palette (HEX)
" ==========================================
" Background: #343D46 | Foreground: #D8DEE9
" Gray:       #65737E | Selection:  #4F5B66
" Red:        #EC5F67 | Orange:     #F9AE58
" Yellow:     #FAC863 | Green:      #99C794
" Teal:       #5FB3B3 | Blue:       #6699CC
" Purple:     #C594C5 | Comments:   #A7ADBA

" ==========================================
" Core UI & Interface
" ==========================================
hi Normal       guifg=#D8DEE9 guibg=#343D46 gui=NONE
hi Cursor       guifg=#343D46 guibg=#D8DEE9 gui=NONE
hi CursorLine   guibg=#4F5B66 gui=NONE
hi CursorColumn guibg=#4F5B66 gui=NONE
hi ColorColumn  guibg=#4F5B66 gui=NONE
hi LineNr       guifg=#65737E guibg=#343D46 gui=NONE
hi CursorLineNr guifg=#D8DEE9 guibg=#4F5B66 gui=bold
hi VertSplit    guifg=#4F5B66 guibg=#4F5B66 gui=NONE
hi Visual       guibg=#4F5B66 gui=NONE
hi Search       guifg=#343D46 guibg=#FAC863 gui=NONE
hi IncSearch    guifg=#343D46 guibg=#F9AE58 gui=NONE
hi NonText      guifg=#65737E gui=NONE
hi SpecialKey   guifg=#65737E gui=NONE
hi Directory    guifg=#6699CC gui=NONE
hi Title        guifg=#D8DEE9 gui=bold
hi MatchParen   guifg=#FAC863 guibg=#4F5B66 gui=bold
hi SignColumn   guibg=#343D46 gui=NONE

" StatusLine
hi StatusLine   guifg=#D8DEE9 guibg=#4F5B66 gui=NONE
hi StatusLineNC guifg=#A7ADBA guibg=#343D46 gui=NONE
hi WildMenu     guifg=#343D46 guibg=#99C794 gui=bold

" ==========================================
" Generic Syntax
" ==========================================
hi Comment      guifg=#A7ADBA gui=italic
hi Constant     guifg=#F9AE58 gui=NONE
hi String       guifg=#99C794 gui=NONE
hi Number       guifg=#F9AE58 gui=NONE
hi Boolean      guifg=#F9AE58 gui=NONE
hi Identifier   guifg=#EC5F67 gui=NONE
hi Function     guifg=#6699CC gui=NONE
hi Statement    guifg=#C594C5 gui=italic
hi Operator     guifg=#F9AE58 gui=NONE
hi Keyword      guifg=#C594C5 gui=italic
hi PreProc      guifg=#5FB3B3 gui=NONE
hi Type         guifg=#FAC863 gui=NONE
hi StorageClass guifg=#F9AE58 gui=italic
hi Special      guifg=#EB606B gui=NONE
hi Error        guifg=#EC5F67 guibg=NONE gui=bold
hi Todo         guifg=#FAC863 guibg=NONE gui=bold

" ==========================================
" Plugin: NERDTree & Netrw
" ==========================================
hi NERDTreeDirSlash guifg=#65737E
hi NERDTreeDir      guifg=#6699CC
hi NERDTreeFile     guifg=#D8DEE9
hi NERDTreeExecFile guifg=#FAC863
hi NERDTreeOpenable guifg=#F9AE58
hi NERDTreeClosable guifg=#F9AE58
hi netrwDir         guifg=#6699CC

" ==========================================
" Plugin: GitGutter / SignColumn
" ==========================================
hi GitGutterAdd    guifg=#99C794 guibg=NONE
hi GitGutterChange guifg=#FAC863 guibg=NONE
hi GitGutterDelete guifg=#EC5F67 guibg=NONE

" ==========================================
" Plugin: fzf / Telescope-like
" ==========================================
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

" ==========================================
" Language Specific (Python, JS, HTML)
" ==========================================
hi pythonBuiltin    guifg=#5FB3B3
hi pythonImport     guifg=#C594C5 gui=italic
hi jsObjectKey      guifg=#5FB3B3
hi jsFunction       guifg=#C594C5 gui=italic
hi htmlTag          guifg=#5FB3B3
hi htmlTagName      guifg=#EB606B
hi htmlArg          guifg=#F9AE58 gui=italic

" ==========================================
" Popup Menu & Tabs
" ==========================================
hi Pmenu        guifg=#D8DEE9 guibg=#4F5B66
hi PmenuSel     guifg=#343D46 guibg=#99C794
hi TabLine      guifg=#A7ADBA guibg=#4F5B66 gui=NONE
hi TabLineFill  guibg=#343D46
hi TabLineSel   guifg=#D8DEE9 guibg=#343D46 gui=bold
