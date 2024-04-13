
" If you are distributing this theme, please replace this comment
" with the appropriate license attributing the original VS Code
" theme author.


" Solarized (dark) - A nice  theme

" ==========> Reset
set background=

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'solarized-dark'

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

let s:hex.color0="#002d38"
let s:hex.color1="#98a8a8"
let s:hex.color2="#D30102"
let s:hex.color3="#00000b"
let s:hex.color4="#00232e"
let s:hex.color5="#000006"
let s:hex.color6="#001924"
let s:hex.color7="#000000"
let s:hex.color8="#000d17"
let s:hex.color9="#7b9697"
let s:hex.color10="#627d7e"
let s:hex.color11="#c09714"
let s:hex.color12="#000f1a"
let s:hex.color13="#7a8a8a"
let s:hex.color14="#8e9e9e"
let s:hex.color15="#000a15"
let s:hex.color16="#5b7279"
let s:hex.color17="#ac8300"
let s:hex.color18="#2b90d8"
let s:hex.color19="#819500"
let s:hex.color20="#259d94"
let s:hex.color21="#7d80d1"

let s:bit.color3="16"
let s:bit.color13="32"
let s:bit.color15="36"
let s:bit.color8="66"
let s:bit.color14="100"
let s:bit.color10="102"
let s:bit.color16="104"
let s:bit.color9="136"
let s:bit.color2="160"
let s:bit.color6="232"
let s:bit.color5="233"
let s:bit.color4="234"
let s:bit.color0="235"
let s:bit.color12="242"
let s:bit.color7="245"
let s:bit.color11="246"
let s:bit.color1="247"


" ==========> General highlights 
call s:h("Normal", s:hex.color0, s:hex.color1, s:bit.color0, s:bit.color1, "none")
call s:h("Cursor", s:hex.color2, "", s:bit.color2, "", "none")
call s:h("Visual", s:hex.color3, "", s:bit.color3, "", "none")
call s:h("ColorColumn", s:hex.color4, "", s:bit.color4, "", "none")
call s:h("LineNr", "", s:hex.color5, "", s:bit.color3, "none")
call s:h("CursorLine", s:hex.color6, "", s:bit.color5, "", "none")
call s:h("CursorLineNr", "", s:hex.color7, "", s:bit.color3, "none")
call s:h("CursorColumn", s:hex.color6, "", s:bit.color5, "", "none")
call s:h("StatusLineNC", s:hex.color8, s:hex.color9, s:bit.color6, s:bit.color7, "none")
call s:h("StatusLine", s:hex.color7, s:hex.color10, s:bit.color3, s:bit.color8, "none")
call s:h("VertSplit", "", s:hex.color7, "", s:bit.color3, "none")
call s:h("Folded", s:hex.color6, s:hex.color11, s:bit.color5, s:bit.color9, "none")
call s:h("Pmenu", s:hex.color12, s:hex.color13, s:bit.color5, s:bit.color10, "none")
call s:h("PmenuSel", s:hex.color4, s:hex.color14, s:bit.color4, s:bit.color11, "none")
call s:h("EndOfBuffer", s:hex.color0, s:hex.color15, s:bit.color0, s:bit.color6, "none")
call s:h("NonText", s:hex.color0, s:hex.color15, s:bit.color0, s:bit.color6, "none")


" ==========> Syntax highlights
call s:h("Comment", "", s:hex.color16, "", s:bit.color12, "none")
call s:h("Constant", "", s:hex.color17, "", s:bit.color9, "none")
call s:h("Special", "", s:hex.color17, "", s:bit.color9, "none")
call s:h("Identifier", "", s:hex.color18, "", s:bit.color13, "none")
call s:h("Function", "", s:hex.color17, "", s:bit.color9, "none")
call s:h("Statement", "", s:hex.color19, "", s:bit.color14, "none")
call s:h("PreProc", "", s:hex.color19, "", s:bit.color14, "none")
call s:h("Type", "", s:hex.color19, "", s:bit.color14, "none")
call s:h("String", "", s:hex.color20, "", s:bit.color15, "none")
call s:h("Number", "", s:hex.color21, "", s:bit.color16, "none")

highlight link cStatement Statement
highlight link cSpecial Special


" Generated using https://github.com/nice/themeforge
" Feel free to remove the above URL and this line.
