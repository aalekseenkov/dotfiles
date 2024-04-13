
" If you are distributing this theme, please replace this comment
" with the appropriate license attributing the original VS Code
" theme author.


" Solarized (light) - A nice  theme

" ==========> Reset
set background=

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'solarized-light'

" ==========> Highlight function
function! s:h(face, guibg, guifg, ctermbg, ctermfg, gui)
  let l:cmd="highlight " . a:face
  
  if a:guibg != ""
    let l:cmd = l:cmd . " guibg=" . a:guibg
  endif

  if a:guifg != ""
    let l:cmd = l:cmd . " guifg=" . a:guifg
  endif

  if a:ctermbg != ""
    let l:cmd = l:cmd . " ctermbg=" . a:ctermbg
  endif

  if a:ctermfg != ""
    let l:cmd = l:cmd . " ctermfg=" . a:ctermfg
  endif

  if a:gui != ""
    let l:cmd = l:cmd . " gui=" . a:gui
  endif

  exec l:cmd
endfun


" ==========> Colors dictionary

" GUI colors dictionary (hex)
let s:hex = {}
" Terminal colors dictionary (256)
let s:bit = {}

let s:hex.color0="#f8f5ec"
let s:hex.color1="#657377"
let s:hex.color2="#cbc8bf"
let s:hex.color3="#eeebe2"
let s:hex.color4="#c6c3ba"
let s:hex.color5="#e4e1d8"
let s:hex.color6="#b2afa6"
let s:hex.color7="#ddd5be"
let s:hex.color8="#475e65"
let s:hex.color9="#c4bca5"
let s:hex.color10="#2e454c"
let s:hex.color11="#adaaa1"
let s:hex.color12="#c09714"
let s:hex.color13="#dad7ce"
let s:hex.color14="#475559"
let s:hex.color15="#5b696d"
let s:hex.color16="#d5d2c9"
let s:hex.color17="#8faaab"
let s:hex.color18="#ac8300"
let s:hex.color19="#2b90d8"
let s:hex.color20="#819500"
let s:hex.color21="#259d94"
let s:hex.color22="#7d80d1"

let s:bit.color18="32"
let s:bit.color20="36"
let s:bit.color19="100"
let s:bit.color21="104"
let s:bit.color17="109"
let s:bit.color12="136"
let s:bit.color6="145"
let s:bit.color7="187"
let s:bit.color13="188"
let s:bit.color10="238"
let s:bit.color14="239"
let s:bit.color8="240"
let s:bit.color15="241"
let s:bit.color1="242"
let s:bit.color11="248"
let s:bit.color9="249"
let s:bit.color4="250"
let s:bit.color2="251"
let s:bit.color16="252"
let s:bit.color5="253"
let s:bit.color3="254"
let s:bit.color0="255"


" ==========> General highlights 
call s:h("Normal", s:hex.color0, s:hex.color1, s:bit.color0, s:bit.color1, "none")
call s:h("Cursor", s:hex.color1, "", s:bit.color1, "", "none")
call s:h("Visual", s:hex.color2, "", s:bit.color2, "", "none")
call s:h("ColorColumn", s:hex.color3, "", s:bit.color3, "", "none")
call s:h("LineNr", "", s:hex.color4, "", s:bit.color4, "none")
call s:h("CursorLine", s:hex.color5, "", s:bit.color5, "", "none")
call s:h("CursorLineNr", "", s:hex.color6, "", s:bit.color6, "none")
call s:h("CursorColumn", s:hex.color5, "", s:bit.color5, "", "none")
call s:h("StatusLineNC", s:hex.color7, s:hex.color8, s:bit.color7, s:bit.color8, "none")
call s:h("StatusLine", s:hex.color9, s:hex.color10, s:bit.color9, s:bit.color10, "none")
call s:h("VertSplit", "", s:hex.color11, "", s:bit.color11, "none")
call s:h("Folded", s:hex.color5, s:hex.color12, s:bit.color5, s:bit.color12, "none")
call s:h("Pmenu", s:hex.color13, s:hex.color14, s:bit.color13, s:bit.color14, "none")
call s:h("PmenuSel", s:hex.color3, s:hex.color15, s:bit.color3, s:bit.color15, "none")
call s:h("EndOfBuffer", s:hex.color0, s:hex.color16, s:bit.color0, s:bit.color16, "none")
call s:h("NonText", s:hex.color0, s:hex.color16, s:bit.color0, s:bit.color16, "none")


" ==========> Syntax highlights
call s:h("Comment", "", s:hex.color17, "", s:bit.color17, "none")
call s:h("Constant", "", s:hex.color18, "", s:bit.color12, "none")
call s:h("Special", "", s:hex.color18, "", s:bit.color12, "none")
call s:h("Identifier", "", s:hex.color19, "", s:bit.color18, "none")
call s:h("Function", "", s:hex.color18, "", s:bit.color12, "none")
call s:h("Statement", "", s:hex.color20, "", s:bit.color19, "none")
call s:h("PreProc", "", s:hex.color20, "", s:bit.color19, "none")
call s:h("Type", "", s:hex.color20, "", s:bit.color19, "none")
call s:h("String", "", s:hex.color21, "", s:bit.color20, "none")
call s:h("Number", "", s:hex.color22, "", s:bit.color21, "none")

highlight link cStatement Statement
highlight link cSpecial Special


" Generated using https://github.com/nice/themeforge
" Feel free to remove the above URL and this line.
