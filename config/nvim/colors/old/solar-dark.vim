" Setup
hi clear
syntax reset
set background=dark
let g:colors_name = "solar-dark"

" Colors
let s:fg  = "#93a1a1"
let s:bg  = "#002b36"
let s:cursorline  = "#073642"
let s:comment  = "#586e75"
let s:nontext  = "#657b83"
let s:statusline  = "#839496"
let s:statuslinenc  = "#003d4d"
let s:visual  = "#005266"
let s:linenr  ="#005266"
let s:none    = "NONE"
"
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

" Syntax
exe "hi Boolean guifg=" . s:cyan
exe "hi Character guifg=" . s:green
exe "hi Comment guifg=" . s:comment
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
exe "hi Macro guifg=" . s:violet
exe "hi Operator guifg=" . s:fg . " gui=" . s:none
exe "hi PreProc guifg=" . s:blue
exe "hi Repeat guifg=" . s:blue
exe "hi Special guifg=" . s:cyan
exe "hi SpecialChar guifg=" . s:magenta
exe "hi Statement guifg=" . s:none
exe "hi StorageClass guifg=" . s:yellow
exe "hi String guifg=" . s:green
exe "hi Structure guifg=" . s:none
exe "hi Tag guifg=" . s:yellow
exe "hi Todo guifg=" . s:yellow . " guibg=" . s:cursorline
exe "hi Type guifg=" . s:none . " gui=" . s:none
exe "hi Typedef guifg=" . s:yellow


" General
exe "hi Normal guifg=" . s:fg . " guibg=" . s:bg
exe "hi Bold gui=bold"
exe "hi Debug guifg=" . s:red
exe "hi Directory guifg=" . s:blue
exe "hi Error guifg=" . s:bg . " guibg=" . s:red
exe "hi ErrorMsg guifg=" . s:red . " guibg=" . s:bg
exe "hi Exception guifg=" . s:red
exe "hi FoldColumn guifg=" . s:cyan . " guibg=" . s:cursorline
exe "hi Folded guifg=" . s:nontext . " guibg=" . s:cursorline
exe "hi IncSearch guifg=" . s:cursorline . " guibg=" . s:orange . " gui=" . s:none
exe "hi Italic gui=" . s:none 
exe "hi MatchParen guibg=" . s:yellow . " guifg=" . s:bg
exe "hi ModeMsg guifg=" . s:green
exe "hi MoreMsg guifg=" . s:green
exe "hi Question guifg=" . s:blue
exe "hi Search guifg=" . s:cursorline . " guibg=" . s:yellow
exe "hi Substitute guifg=" . s:cursorline . " guibg=" . s:yellow . " gui=" . s:none
exe "hi SpecialKey guifg=" . s:nontext
exe "hi TooLong guifg=" . s:red
exe "hi Underlined  gui=underline"
exe "hi Visual guibg=" . s:visual . " gui=" . s:none
exe "hi VisualNOS guifg=" . s:red
exe "hi WarningMsg guifg=" . s:red
exe "hi WildMenu guifg=" . s:bg . " guibg=" . s:yellow
exe "hi Title guifg=" . s:blue . " gui=" . s:none
exe "hi Conceal guifg=" . s:blue . " guibg=" . s:bg
exe "hi Cursor guifg=" . "#ffffff" . " guibg=" . s:red. " gui=inverse"
exe "hi lCursor guifg=" . "#ffffff" . " guibg=" . s:yellow. " gui=inverse"
exe "hi NonText guifg=" . s:nontext
exe "hi LineNr guifg=" . s:linenr. " guibg=" . s:none
exe "hi SignColumn guifg=" . s:nontext . " guibg=" . s:none
exe "hi StatusLine guifg=" . s:bg . " guibg=" . s:statusline . " gui=" . s:none
exe "hi StatusLineNC guifg=" . s:nontext . " guibg=" . s:statuslinenc. " gui=" . s:none
exe "hi VertSplit guifg=" . s:comment . " guibg=" . s:none . " gui=" . s:none
exe "hi ColorColumn guibg=" . s:cursorline . " gui=" . s:none
exe "hi CursorColumn guibg=" . s:cursorline . " gui=" . s:none
exe "hi CursorLine guibg=" . s:cursorline . " gui=" . s:none
exe "hi CursorLineNr guifg=" s:yellow . " guibg=" . s:cursorline
exe "hi QuickFixLine guibg=" . s:cursorline . " gui=" . s:none
exe "hi PMenu guifg=" . s:fg . " guibg=" . s:cursorline . " gui=" . s:none
exe "hi PMenuSel guifg=" . s:cursorline . " guibg=" . s:fg
exe "hi TabLine guifg=" . s:nontext . " guibg=" . s:cursorline . " gui=" . s:none
exe "hi TabLineFill guifg=" . s:nontext . " guibg=" . s:cursorline . " gui=" . s:none
exe "hi TabLineSel guifg=" . s:green . " guibg=" . s:cursorline . " gui=" . s:none

" LSP
exe "hi lspdiagnosticsDefaultError" . " guifg=" . s:comment
exe "hi lspdiagnosticsDefaultErrorfloating" . " guifg=" . s:fg
exe "hi lspdiagnosticsDefaultHint" . " guifg=" . s:comment
exe "hi lspdiagnosticsDefaultHintfloating" . " guifg=" . s:fg
exe "hi lspdiagnosticsDefaultInformation" . " guifg=" . s:comment
exe "hi lspdiagnosticsDefaultInformationfloating" . " guifg=" . s:fg
exe "hi lspdiagnosticsDefaultWarning" . " guifg=" . s:comment
exe "hi lspdiagnosticsDefaultWarningfloating" . " guifg=" . s:fg
exe "hi lspdiagnosticsSignError" . " guifg=" . s:red
exe "hi lspdiagnosticsSignHint" . " guifg=" . s:fg
exe "hi lspdiagnosticsSignInformation" . " guifg=" . s:fg
exe "hi lspdiagnosticsSignWarning" . " guifg=" . s:yellow
exe "hi lspdiagnosticsUnderlineError gui=underline" . " guifg=" . s:none 
exe "hi lspdiagnosticsUnderlineHint gui=underline" . " guifg=" . s:none 
exe "hi lspdiagnosticsUnderlineInformation gui=underline" . " guifg=" . s:none 
exe "hi lspdiagnosticsUnderlineWarning gui=underline" . " guifg=" . s:none 

" Diff
exe "hi DiffAdd" . " guifg=" . s:green . " guibg=" . s:cursorline
exe "hi DiffChange" . " guifg=" . s:nontext . " guibg=" . s:cursorline
exe "hi DiffDelete" . " guifg=" . s:red . " guibg=" . s:cursorline
exe "hi DiffText" . " guifg=" . s:blue . " guibg=" . s:cursorline
exe "hi DiffAdded" . " guifg=" . s:green . " guibg=" . s:bg
exe "hi DiffFile" . " guifg=" . s:red . " guibg=" . s:bg
exe "hi DiffNewFile" . " guifg=" . s:green . " guibg=" . s:bg
exe "hi DiffLine" . " guifg=" . s:blue . " guibg=" . s:bg
exe "hi DiffRemoved" . " guifg=" . s:red . " guibg=" . s:bg

" Spell
exe "hi SpellBad gui=undercurl guisp=" . s:red
exe "hi SpellLocal gui=undercurl guisp=" . s:cyan
exe "hi SpellCap gui=undercurl guisp=" . s:blue
exe "hi SpellRare gui=undercurl guisp=" . s:violet

" Neovim terminal colours
let g:terminal_color_0 =  "s:bg"
let g:terminal_color_1 =  "s:red"
let g:terminal_color_2 =  "s:green"
let g:terminal_color_3 =  "s:yellow"
let g:terminal_color_4 =  "s:blue"
let g:terminal_color_5 =  "s:violet"
let g:terminal_color_6 =  "s:cyan"
let g:terminal_color_7 =  "s:fg"
let g:terminal_color_8 =  "s:nontext"
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
" hi cssBraces guifg=s:fg
" hi cssClassName guifg=s:violet
" hi cssColor guifg=s:cyan
" hi gitcommitOverflow guifg=s:red
" hi gitcommitSummary guifg=s:green
" hi gitcommitComment guifg=s:nontext
" hi gitcommitUntracked guifg=s:nontext
" hi gitcommitDiscarded guifg=s:nontext
" hi gitcommitSelected guifg=s:nontext
" hi gitcommitHeader guifg=s:violet
" hi gitcommitSelectedType guifg=s:blue
" hi gitcommitUnmergedType guifg=s:blue
" hi gitcommitDiscardedType guifg=s:blue
" hi gitcommitBranch guifg=s:orange gui=bold
" hi gitcommitUntrackedFile guifg=s:yellow
" hi gitcommitUnmergedFile guifg=s:red gui=bold
" hi gitcommitDiscardedFile guifg=s:red gui=bold
" hi gitcommitSelectedFile guifg=s:green gui=bold
" hi GitGutterAdd guifg=s:green guibg=s:cursorline
" hi GitGutterChange guifg=s:blue guibg=s:cursorline
" hi GitGutterDelete guifg=s:red guibg=s:cursorline
" hi GitGutterChangeDelete guifg=s:violet guibg=s:cursorline
" hi htmlBold guifg=s:yellow
" hi htmlItalic guifg=s:violet
" hi htmlEndTag guifg=s:fg
" hi htmlTag guifg=s:fg
" hi javaScript guifg=s:fg
" hi javaScriptBraces guifg=s:fg
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
" hi markdownError guifg=s:fg guibg=s:bg
" hi markdownCodeBlock guifg=s:green
" hi markdownHeadingDelimiter guifg=s:blue
" hi NERDTreeDirSlash guifg=s:blue
" hi NERDTreeExecFile guifg=s:fg
" hi phpMemberSelector guifg=s:fg
" hi phpComparison guifg=s:fg
" hi phpParent guifg=s:fg
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
" hi SignifySignAdd guifg=s:green guibg=s:cursorline
" hi SignifySignChange guifg=s:blue guibg=s:cursorline
" hi SignifySignDelete guifg=s:red guibg=s:cursorline
" hi StartifyBracket guifg=s:nontext
" hi StartifyFile guifg=s:color8
" hi StartifyFooter guifg=s:nontext
" hi StartifyHeader guifg=s:green
" hi StartifyNumber guifg=s:orange
" hi StartifyPath guifg=s:nontext
" hi StartifySection guifg=s:violet
" hi StartifySelect guifg=s:cyan
" hi StartifySlash guifg=s:nontext
" hi StartifySpecial guifg=s:nontext
" hi javaOperator guifg=s:blue
