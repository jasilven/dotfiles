" Setup
hi clear
syntax reset
let g:colors_name = "solar"

" Colors
let s:color1  = "#002b36"
let s:color2  = "#073642"
let s:color3  = "#586e75"
let s:color4  = "#657b83"
let s:color5  = "#839496"
let s:color6  = "#93a1a1"
let s:color7  = "#eee8d5"
let s:color8  = "#fdf6e3"
let s:yellow  = "#b58900"
let s:orange  = "#cb4b16"
let s:red     = "#cb4b16"
" let s:red     = "#dc322f"
let s:magenta = "#d33682"
let s:violet  = "#6c71c4"
let s:blue    = "#268bd2"
let s:cyan    = "#2aa198"
let s:green   = "#859900"
"
let s:visual  = "#005266"
let s:none    = "NONE"
let s:linenr  ="#005266"

" Syntax
exe "hi Boolean guifg=" . s:cyan
exe "hi Character guifg=" . s:green
exe "hi Comment guifg=" . s:color3
exe "hi Conditional guifg=" . s:blue
exe "hi Constant guifg=" . s:cyan
exe "hi Define  guifg=" . s:violet . " gui=" . s:none
exe "hi Delimiter guifg=" . s:none
exe "hi Float guifg=" . s:cyan
exe "hi Function guifg=" . s:none
exe "hi Identifier guifg=" . s:none . " gui=" . s:none
exe "hi Include guifg=" . s:none
exe "hi Keyword guifg=" . s:blue
exe "hi Label guifg=" . s:yellow
exe "hi Number guifg=" . s:cyan
exe "hi Macro guifg=" . s:blue
exe "hi Operator guifg=" . s:color6 . " gui=" . s:none
exe "hi PreProc guifg=" . s:blue
exe "hi Repeat guifg=" . s:blue
exe "hi Special guifg=" . s:cyan
exe "hi SpecialChar guifg=" . s:magenta
exe "hi Statement guifg=" . s:none
exe "hi StorageClass guifg=" . s:yellow
exe "hi String guifg=" . s:green
exe "hi Structure guifg=" . s:none
exe "hi Tag guifg=" . s:yellow
exe "hi Todo guifg=" . s:yellow . " guibg=" . s:color2
exe "hi Type guifg=" . s:none . " gui=" . s:none
exe "hi Typedef guifg=" . s:yellow


" Neovim terminal colours
let g:terminal_color_0 =  "s:color1"
let g:terminal_color_1 =  "s:red"
let g:terminal_color_2 =  "s:green"
let g:terminal_color_3 =  "s:yellow"
let g:terminal_color_4 =  "s:blue"
let g:terminal_color_5 =  "s:violet"
let g:terminal_color_6 =  "s:cyan"
let g:terminal_color_7 =  "s:color6"
let g:terminal_color_8 =  "s:color4"
let g:terminal_color_9 =  "s:red"
let g:terminal_color_10 = "s:green"
let g:terminal_color_11 = "s:yellow"
let g:terminal_color_12 = "s:blue"
let g:terminal_color_13 = "s:violet"
let g:terminal_color_14 = "s:cyan"
let g:terminal_color_15 = "s:color8"
let g:terminal_color_background = g:terminal_color_0
let g:terminal_color_foreground = g:terminal_color_5
if &background == "light"
  let g:terminal_color_background = g:terminal_color_7
  let g:terminal_color_foreground = g:terminal_color_2
endif

" General
exe "hi Normal guifg=" . s:color6 . " guibg=" . s:color1
exe "hi Bold gui=bold"
exe "hi Debug guifg=" . s:red
exe "hi Directory guifg=" . s:blue
exe "hi Error guifg=" . s:color1 . " guibg=" . s:red
exe "hi ErrorMsg guifg=" . s:red . " guibg=" . s:color1
exe "hi Exception guifg=" . s:red
exe "hi FoldColumn guifg=" . s:cyan . " guibg=" . s:color2
exe "hi Folded guifg=" . s:color4 . " guibg=" . s:color2
exe "hi IncSearch guifg=" . s:color2 . " guibg=" . s:orange . " gui=" . s:none
exe "hi Italic gui=" . s:none 
exe "hi MatchParen guibg=" . s:yellow . " guifg=" . s:color1
exe "hi ModeMsg guifg=" . s:green
exe "hi MoreMsg guifg=" . s:green
exe "hi Question guifg=" . s:blue
exe "hi Search guifg=" . s:color2 . " guibg=" . s:yellow
exe "hi Substitute guifg=" . s:color2 . " guibg=" . s:yellow . " gui=" . s:none
exe "hi SpecialKey guifg=" . s:color4
exe "hi TooLong guifg=" . s:red
exe "hi Underlined  gui=underline"
exe "hi Visual guibg=" . s:visual . " gui=" . s:none
exe "hi VisualNOS guifg=" . s:red
exe "hi WarningMsg guifg=" . s:red
exe "hi WildMenu guifg=" . s:color1 . " guibg=" . s:yellow
exe "hi Title guifg=" . s:blue . " gui=" . s:none
exe "hi Conceal guifg=" . s:blue . " guibg=" . s:color1
exe "hi Cursor guifg=" . s:color1 . " guibg=LightGreen"
exe "hi NonText guifg=" . s:color4
exe "hi LineNr guifg=" . s:linenr. " guibg=" . s:none
exe "hi SignColumn guifg=" . s:color4 . " guibg=" . s:none
exe "hi StatusLine guifg=" . s:color1 . " guibg=" . s:color5 . " gui=" . s:none
exe "hi StatusLineNC guifg=" . s:color4 . " guibg=" . s:color2 . " gui=" . s:none
exe "hi VertSplit guifg=" . s:color3 . " guibg=" . s:none . " gui=" . s:none
exe "hi ColorColumn guibg=" . s:color2 . " gui=" . s:none
exe "hi CursorColumn guibg=" . s:color2 . " gui=" . s:none
exe "hi CursorLine guibg=" . s:color2 . " gui=" . s:none
exe "hi CursorLineNr guifg=LightGreen" . " guibg=" . s:color2
exe "hi QuickFixLine guibg=" . s:color2 . " gui=" . s:none
exe "hi PMenu guifg=" . s:color6 . " guibg=" . s:color2 . " gui=" . s:none
exe "hi PMenuSel guifg=" . s:color2 . " guibg=" . s:color6
exe "hi TabLine guifg=" . s:color4 . " guibg=" . s:color2 . " gui=" . s:none
exe "hi TabLineFill guifg=" . s:color4 . " guibg=" . s:color2 . " gui=" . s:none
exe "hi TabLineSel guifg=" . s:green . " guibg=" . s:color2 . " gui=" . s:none

" LSP
exe "hi lspdiagnosticserrorsign" . " guifg=" . s:red
exe "hi lspdiagnosticswarningsign" . " guifg=" . s:yellow
exe "hi lspdiagnosticserror" . " guifg=" . s:color3
exe "hi lspdiagnosticswarning" . " guifg=" . s:color3
exe "hi lspdiagnosticswarningfloating" . " guifg=" . s:color6
exe "hi lspdiagnosticserrorfloating" . " guifg=" . s:color6
exe "hi lspdiagnosticsunderline gui=underline" . " guifg=" . s:none 

" Diff
exe "hi DiffAdd" . " guifg=" . s:green . " guibg=" . s:color2
exe "hi DiffChange" . " guifg=" . s:color4 . " guibg=" . s:color2
exe "hi DiffDelete" . " guifg=" . s:red . " guibg=" . s:color2
exe "hi DiffText" . " guifg=" . s:blue . " guibg=" . s:color2
exe "hi DiffAdded" . " guifg=" . s:green . " guibg=" . s:color1
exe "hi DiffFile" . " guifg=" . s:red . " guibg=" . s:color1
exe "hi DiffNewFile" . " guifg=" . s:green . " guibg=" . s:color1
exe "hi DiffLine" . " guifg=" . s:blue . " guibg=" . s:color1
exe "hi DiffRemoved" . " guifg=" . s:red . " guibg=" . s:color1

" Spell
exe "hi SpellBad gui=undercurl guisp=" . s:red
exe "hi SpellLocal gui=undercurl guisp=" . s:cyan
exe "hi SpellCap gui=undercurl guisp=" . s:blue
exe "hi SpellRare gui=undercurl guisp=" . s:violet

" Other
" hi cOperator guifg=s:cyan
" hi cPreCondit guifg=s:violet
" hi csClass guifg=s:yellow
" hi csAttribute guifg=s:yellow
" hi csModifier guifg=s:violet
" hi csType guifg=s:red
" hi csUnspecifiedStatement guifg=s:blue
" hi csContextualStatement guifg=s:violet
" hi csNewDecleration guifg=s:red
" hi cssBraces guifg=s:color6
" hi cssClassName guifg=s:violet
" hi cssColor guifg=s:cyan
" hi gitcommitOverflow guifg=s:red
" hi gitcommitSummary guifg=s:green
" hi gitcommitComment guifg=s:color4
" hi gitcommitUntracked guifg=s:color4
" hi gitcommitDiscarded guifg=s:color4
" hi gitcommitSelected guifg=s:color4
" hi gitcommitHeader guifg=s:violet
" hi gitcommitSelectedType guifg=s:blue
" hi gitcommitUnmergedType guifg=s:blue
" hi gitcommitDiscardedType guifg=s:blue
" hi gitcommitBranch guifg=s:orange gui=bold
" hi gitcommitUntrackedFile guifg=s:yellow
" hi gitcommitUnmergedFile guifg=s:red gui=bold
" hi gitcommitDiscardedFile guifg=s:red gui=bold
" hi gitcommitSelectedFile guifg=s:green gui=bold
" hi GitGutterAdd guifg=s:green guibg=s:color2
" hi GitGutterChange guifg=s:blue guibg=s:color2
" hi GitGutterDelete guifg=s:red guibg=s:color2
" hi GitGutterChangeDelete guifg=s:violet guibg=s:color2
" hi htmlBold guifg=s:yellow
" hi htmlItalic guifg=s:violet
" hi htmlEndTag guifg=s:color6
" hi htmlTag guifg=s:color6
" hi javaScript guifg=s:color6
" hi javaScriptBraces guifg=s:color6
" hi javaScriptNumber guifg=s:orange
" hi jsOperator guifg=s:blue
" hi jsStatement guifg=s:violet
" hi jsReturn guifg=s:violet
" hi jsThis guifg=s:red
" hi jsClassDefinition guifg=s:yellow
" hi jsFunction guifg=s:violet
" hi jsFuncName guifg=s:blue
" hi jsFuncCall guifg=s:blue
" hi jsClassFuncName guifg=s:blue
" hi jsClassMethodType guifg=s:violet
" hi jsRegexpString guifg=s:cyan
" hi jsGlobalObjects guifg=s:yellow
" hi jsGlobalNodeObjects guifg=s:yellow
" hi jsExceptions guifg=s:yellow
" hi jsBuiltins guifg=s:yellow
" hi mailQuoted1 guifg=s:yellow
" hi mailQuoted2 guifg=s:green
" hi mailQuoted3 guifg=s:violet
" hi mailQuoted4 guifg=s:cyan
" hi mailQuoted5 guifg=s:blue
" hi mailQuoted6 guifg=s:yellow
" hi mailURL guifg=s:blue
" hi mailEmail guifg=s:blue
" hi markdownCode guifg=s:green
" hi markdownError guifg=s:color6 guibg=s:color1
" hi markdownCodeBlock guifg=s:green
" hi markdownHeadingDelimiter guifg=s:blue
" hi NERDTreeDirSlash guifg=s:blue
" hi NERDTreeExecFile guifg=s:color6
" hi phpMemberSelector guifg=s:color6
" hi phpComparison guifg=s:color6
" hi phpParent guifg=s:color6
" hi phpMethodsVar guifg=s:cyan
" hi pythonOperator guifg=s:violet
" hi pythonRepeat guifg=s:violet
" hi pythonInclude guifg=s:violet
" hi pythonStatement guifg=s:violet
" hi rubyAttribute guifg=s:blue
" hi rubyConstant guifg=s:yellow
" hi rubyInterpolationDelimiter guifg=s:magenta
" hi rubyRegexp guifg=s:cyan
" hi rubySymbol guifg=s:green
" hi rubyStringDelimiter guifg=s:green
" hi sassidChar guifg=s:red
" hi sassClassChar guifg=s:orange
" hi sassInclude guifg=s:violet
" hi sassMixing guifg=s:violet
" hi sassMixinName guifg=s:blue
" hi SignifySignAdd guifg=s:green guibg=s:color2
" hi SignifySignChange guifg=s:blue guibg=s:color2
" hi SignifySignDelete guifg=s:red guibg=s:color2
" hi StartifyBracket guifg=s:color4
" hi StartifyFile guifg=s:color8
" hi StartifyFooter guifg=s:color4
" hi StartifyHeader guifg=s:green
" hi StartifyNumber guifg=s:orange
" hi StartifyPath guifg=s:color4
" hi StartifySection guifg=s:violet
" hi StartifySelect guifg=s:cyan
" hi StartifySlash guifg=s:color4
" hi StartifySpecial guifg=s:color4
" hi javaOperator guifg=s:blue
