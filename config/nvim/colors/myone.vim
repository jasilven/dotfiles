
" SETUP
hi clear
syntax reset
let g:colors_name="myone"
set background="dark"

" COLORS
let s:sand         = "#eee8d5"
let s:color8       = "#fdf6e3"
let s:yellow       = "#d5992a"
let s:orange       = "#FF5F00"
let s:red          = "#e06c75"
let s:magenta      = "#c270db"
let s:violet       = "#6c71c4"
let s:blue         = "#61afef"
let s:cyan         = "#56b6c2"
let s:green        = "#98c379"
let s:fg           = "#b6bbc8"
" let s:bg           = "#282c34"
let s:bg           = "#21252b"
let s:cursorline   = "#2c313a"
" let s:pmenu        = "#373d48"
let s:pmenu        = "#434a56"
let s:comment      = "#7d889b"
let s:nontext      = "#657b83"
let s:statusline   = "#c5cad3"
let s:statuslinenc = "#424957"
let s:visual       = "#586274"
let s:linenr       = "#585858"
let s:keyword      = "#68A8E4"
let s:none         = "NONE"

" SYNTAX
exe "hi Comment guifg=" . s:comment
exe "hi StorageClass guibg=" . s:none
exe "hi Todo guifg=" . s:yellow . " guibg=" . s:cursorline
exe "hi helpExample guifg=" . s:cyan
exe "hi helpCommand guifg=" . s:blue
exe "hi helpHeader  guifg=" . s:blue
exe "hi! link Underlined  TSUnderline"
exe "hi! link Boolean TSBoolean" 
exe "hi! link Character TSCharacter" 
exe "hi! link Conditional TSConditional"
exe "hi! link Constant TSConstant"
exe "hi! link Define TSDefinition"
exe "hi! link Delimiter TSPunctDelimiter"
exe "hi! link Float TSFloat"
exe "hi! link Function TSFunction"
exe "hi! link Identifier TSSymbol"
exe "hi! link Include TSInclude"
exe "hi! link Keyword TSKeyword"
exe "hi! link Label TSLabel"
exe "hi! link Macro TSConstMacro"
exe "hi! link Number TSNumber"
exe "hi! link Operator TSOperator"
exe "hi! link PreProc TSConstMacro"
exe "hi! link Repeat TSRepeat"
exe "hi! link Special TSPunctSpecial"
exe "hi! link SpecialChar TSPunctSpecial"
" exe "hi! link Statement Normal"
exe "hi! link String TSString"
" exe "hi! link Structure Normal"
exe "hi! link Tag TSTag"
exe "hi! link Type TSType"
exe "hi! link Typedef TSType"

" GENERAL
exe "hi Bold gui=bold"
exe "hi ColorColumn guibg=" . s:cursorline . " gui=" . s:none
exe "hi Conceal guifg=" . s:blue . " guibg=" . s:bg
exe "hi Cursor guifg=" . "#ffffff" . " guibg=" . s:red. " gui=inverse"
exe "hi CursorColumn guibg=" . s:cursorline . " gui=" . s:none
exe "hi CursorLine guibg=" . s:cursorline . " gui=" . s:none
exe "hi CursorLineNr guifg=" s:yellow . " guibg=" . s:cursorline
exe "hi Debug guifg=" . s:red
exe "hi Directory guifg=" . s:blue
exe "hi Error guifg=" . s:bg . " guibg=" . s:red
exe "hi ErrorMsg guifg=" . s:red . " guibg=" . s:bg
exe "hi Exception guifg=" . s:red
exe "hi FoldColumn guifg=" . s:cyan . " guibg=" . s:cursorline
exe "hi Folded guifg=" . s:nontext . " guibg=" . s:cursorline
exe "hi IncSearch guifg=" . s:cursorline . " guibg=" . s:orange . " gui=" . s:none
exe "hi Italic gui=" . s:none 
exe "hi LineNr guifg=" . s:linenr. " guibg=" . s:none
exe "hi MatchParen gui=bold guibg=" . s:yellow . " guifg=" . s:red
exe "hi ModeMsg guifg=" . s:green
exe "hi MoreMsg guifg=" . s:green
exe "hi NonText guifg=" . s:nontext
exe "hi Statement guifg=" . s:fg
exe "hi Structure guifg=" . s:fg
exe "hi Normal guifg=" . s:fg . " guibg=" . s:bg
exe "hi PMenu guifg=" . s:fg . " guibg=" . s:pmenu. " gui=" . s:none
exe "hi PMenuSel guifg=" . s:pmenu. " guibg=" . s:fg
exe "hi Question guifg=" . s:blue
exe "hi QuickFixLine guibg=" . s:cursorline . " gui=" . s:none
exe "hi Search guifg=" . s:cursorline . " guibg=" . s:yellow
exe "hi SignColumn guifg=" . s:nontext . " guibg=" . s:none
exe "hi SpecialKey guifg=" . s:nontext
exe "hi StatusLine guifg=" . s:bg . " guibg=" . s:statusline . " gui=" . s:none
exe "hi StatusLineNC guifg=" . s:comment . " guibg=" . s:statuslinenc. " gui=" . s:none
exe "hi Substitute guifg=" . s:cursorline . " guibg=" . s:yellow . " gui=" . s:none
exe "hi TabLine guifg=" . s:nontext . " guibg=" . s:cursorline . " gui=" . s:none
exe "hi TabLineFill guifg=" . s:nontext . " guibg=" . "#000000" . " gui=" . s:none
exe "hi TabLineSel guifg=" . s:green . " guibg=" . s:bg . " gui=" . s:none
exe "hi Title guifg=" . s:blue . " gui=" . s:none
exe "hi TooLong guifg=" . s:red
exe "hi VertSplit guifg=" . s:comment . " guibg=" . s:none . " gui=" . s:none
exe "hi Visual guibg=" . s:visual . " gui=" . s:none
exe "hi VisualNOS guifg=" . s:red
exe "hi WarningMsg guifg=" . s:red
exe "hi WildMenu guifg=" . s:bg . " guibg=" . s:yellow
exe "hi lCursor guifg=" . "#ffffff" . " guibg=" . s:yellow. " gui=inverse"

" TREESITTER
exe "hi TSAnnotation    guifg=" . s:blue
exe "hi TSAttribute     guifg=" . s:blue
exe "hi TSBoolean       guifg=" . s:cyan
exe "hi TSCharacter     guifg=" . s:green
exe "hi TSConditional   guifg=" . s:keyword
exe "hi TSConstBuiltin  guifg=" . s:cyan
exe "hi TSConstMacro    guifg=" . s:violet
exe "hi TSConstant      guifg=" . s:fg
exe "hi TSConstructor   guifg=" . s:cyan
exe "hi TSCurrentScope  guifg=" . s:cursorline
exe "hi TSDanger        guifg=" . s:red
exe "hi TSDefinition    guifg=" . s:cursorline . " guibg=" . s:yellow
exe "hi TSDefinitionUsage  guibg=" . s:visual
exe "hi TSEmphasis      gui=italic"
exe "hi TSEnviroment    guifg=" . s:fg
exe "hi TSEnviromentName  guifg=" . s:none
exe "hi TSException     guifg=" . s:red
exe "hi TSField         guifg=" . s:none
exe "hi TSFloat         guifg=" . s:cyan
exe "hi TSFuncBuiltin   guifg=" . s:cyan
exe "hi TSFuncMacro     guifg=" . s:cyan
exe "hi TSFunction      guifg=" . s:cyan
exe "hi TSInclude       guifg=" . s:none
exe "hi TSKeyword       guifg=" . s:keyword
exe "hi TSKeywordFunction  guifg=" . s:keyword
exe "hi TSKeywordOperator  guifg=" . s:keyword
exe "hi TSLabel         guifg=" . s:yellow
exe "hi TSLiteral       guifg=" . s:green
exe "hi TSMath          guifg=" . s:cyan
exe "hi TSMethod        guifg=" . s:red
exe "hi TSNamespace     guifg=" . s:none
exe "hi TSNone          guifg=" . s:fg
exe "hi TSNote          guifg=" . s:cyan
exe "hi TSNumber        guifg=" . s:cyan
exe "hi TSOperator      guifg=" . s:fg
exe "hi TSParameter     guifg=" . s:magenta
exe "hi TSParameterReference  guifg=" . s:none
exe "hi TSProperty      guifg=" . s:none
exe "hi TSPunctBracket  guifg=" . s:none
exe "hi TSPunctDelimiter  guifg=" . s:none 
exe "hi TSPunctSpecial  guifg=" . s:none
exe "hi TSRepeat        guifg=" . s:keyword
exe "hi TSStrike        gui=strikethrough"
exe "hi TSString        guifg=" . s:green
exe "hi TSStringEscape  guifg=" . s:cyan
exe "hi TSStringRegex   guifg=" . s:green
exe "hi TSStrong        gui=bold"
exe "hi TSSymbol        guifg=" . s:fg
exe "hi TSTag           guifg=" . s:yellow
exe "hi TSTagDelimiter  guifg=" . s:none
exe "hi TSText          guifg=" . s:none
exe "hi TSTextReference  guifg=" . s:yellow
exe "hi TSTitle         guifg=" . s:blue
exe "hi TSType          guifg=" . s:fg
exe "hi TSTypeBuiltin   guifg=" . s:none
exe "hi TSURI           gui=underline" 
exe "hi TSUnderline     gui=underline"
exe "hi TSUnderline  gui=underline ctermfg=none guisp=" . s:fg . " guifg=" . s:fg
exe "hi TSVariableBuiltin  guifg=" . s:cyan
exe "hi TSWarning       guifg=" . s:yellow . " guibg=" . s:cursorline

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

" COC
exe "hi CocHintSign gui=underline" . " guifg=" . s:none 

" Diff
exe "hi DiffAdd" . " guifg=" . s:green . " guibg=" . s:bg
exe "hi DiffChange" . " guifg=" . s:nontext . " guibg=" . s:bg
exe "hi DiffDelete" . " guifg=" . s:red . " guibg=" . s:bg
exe "hi DiffText" . " guifg=" . s:blue . " guibg=" . s:bg
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

" TELESCOPE
exe "hi TelescopeSelection guibg="  . s:cursorline . " guifg=" . s:yellow  . " gui=bold"
exe "hi TelescopeSelectionCaret guifg=" . s:yellow . " gui=bold"
exe "hi TelescopeMultiSelection guifg=" . s:orange
exe "hi TelescopeNormal guifg=" . s:comment . " guibg=" . s:cursorline
exe "hi TelescopeBorder guifg=" . s:fg . " guibg=" . s:cursorline
exe "hi TelescopePromptBorder guifg=" . s:fg . " guibg=" . s:cursorline
exe "hi TelescopeResultsBorder guifg=" . s:fg . " guibg=" . s:cursorline
exe "hi TelescopePreviewBorder guifg=" . s:fg . " guibg=" . s:cursorline
exe "hi TelescopeMatching guifg=" . s:yellow . " gui=underline guisp=" . s:yellow
exe "hi TelescopePromptPrefix guifg=" . s:comment

" MARKDOWN
exe "hi markdownCode guifg=" . s:green
exe "hi markdownLinkText gui=underline guifg=" . s:cyan
exe "hi markdownUrl guifg=" . s:cyan
exe "hi markdownH1 gui=bold guifg=" . s:blue
exe "hi markdownH2 gui=bold guifg=" . s:blue
exe "hi markdownH3 guifg=" . s:blue

" GITSIGNS
exe "hi GitSignsAdd guibg=NONE guifg=" s:green
exe "hi GitSignsChange guifg=" s:yellow
exe "hi GitSignsDelete guibg=NONE guifg=" . s:red

" YAML
exe "hi YamlBlockMappingKey guifg=" . s:blue

" TERMINAL
let g:terminal_color_0 = s:fg
let g:terminal_color_8 = s:bg
let g:terminal_color_1 = s:red
let g:terminal_color_9 = s:red
let g:terminal_color_2 = s:green
let g:terminal_color_10 = s:green
let g:terminal_color_3 = s:yellow
let g:terminal_color_11 = s:yellow
let g:terminal_color_4 = s:blue
let g:terminal_color_12 = s:blue
let g:terminal_color_5 = s:magenta
let g:terminal_color_13 = s:magenta
let g:terminal_color_6 = s:cyan
let g:terminal_color_14 = s:cyan
let g:terminal_color_7 = s:fg
let g:terminal_color_15 = s:fg
