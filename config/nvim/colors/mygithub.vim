hi clear
if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

set background=light

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "mygithub"


" Colors
"
let s:fg            = "#24292e"
let s:bg            = "#ffffff"
let s:cursor_fg     = "#ffffff"
let s:cursor_bg     = "#000000"
let s:float         = "#f3f3f3"
let s:bg_dimmer     = "#d9d9d9"
let s:tabline       = "#f7f7f7"
let s:constant      = "#005cc5"
let s:function      = "#6F42C1"
let s:menu          = "#0099cc"
let s:errormsg      = "#e8192e"
let s:warningmsg    = "#ef7e04"
let s:keyword       = "#D73A49"
let s:string        = "green"
let s:grass         = "#22863a"
let s:comment       = "#6A737D"
let s:linenr        = "#BABBBD"
let s:incsearch     = "#F4C55F"
let s:search        = "#eff45f"
let s:cursorline    = "#F5F5F5"
let s:diff_delete   = "#ff9999"
let s:diff_add      = "#ccffcc"
let s:diff_change   = "#ffff1a"
let s:diff_text     = "#F4AF5F"
let s:statusline_bg = "#565555"
let s:statusline_fg = "#ffffff"
let s:visual        = "#90b0f4"

function! s:HL(group, fg, bg,gui) 
    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        let histring .= 'guifg=' . a:fg
    endif

    if strlen(a:bg)
        let histring .= ' guibg=' . a:bg
    endif

    if strlen(a:gui)
        let histring .= ' gui=' . a:gui
    endif

    execute histring
endfunction

call s:HL('Normal'      , s:fg      , s:bg     , '')
call s:HL('NormalFloat' , s:fg      , s:float  , '')
call s:HL('Folded'      , s:comment , s:float, 'none')
call s:HL('VertSplit'   , s:linenr  , s:bg     , 'none')

call s:HL('CursorLine'   , ''   , s:cursorline , 'none')
call s:HL('CursorLineNr' , s:fg , s:cursorline , 'none')
call s:HL('CursorColumn' , ''   , s:linenr     , '')
call s:HL('ColorColumn'  , ''   , s:linenr     , '')

" Tabline
call s:HL('TabLine'      , s:linenr        , s:tabline       , 'none')
call s:HL('TabLineFill'  , s:linenr        , s:tabline       , 'none')
call s:HL('TabLineSel'   , s:fg            , s:bg            , 'none')

call s:HL('MatchParen'   , s:bg            , s:visual        , '')

call s:HL('NonText'      , s:linenr        , s:bg            , '')
call s:HL('SpecialKey'   , s:linenr        , s:bg            , '')

call s:HL('Visual'       , s:bg            , s:visual        , '')
call s:HL('VisualNOS'    , ''              , s:visual        , '')

call s:HL('Search'       , s:bg            , s:search        , 'bold')
call s:HL('IncSearch'    , s:bg            , s:incsearch     , 'bold')

call s:HL('Underlined'   , s:fg            , ''              , 'underline')

call s:HL('StatusLine'   , s:statusline_fg , s:statusline_bg , 'none')
call s:HL('StatusLineNC' , s:comment       , s:bg_dimmer     , 'none')

call s:HL('Directory'    , s:function      , ''              , '')
call s:HL('Title'        , s:constant      , ''              , '')

call s:HL('ErrorMsg'     , s:bg            , s:errormsg         , '')
call s:HL('WarningMsg'   , s:bg            , s:warningmsg       , '')
call s:HL('MoreMsg'      , s:bg            , s:errormsg         , '')
call s:HL('ModeMsg'      , s:bg            , s:errormsg         , '')
call s:HL('Question'     , s:bg            , s:errormsg         , '')

call s:HL('NetrwTreeBar',  s:bg_dimmer, '', 'none')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call s:HL('Tag', '', '', 'bold')

" Gutter
call s:HL('LineNr'     , s:linenr , s:bg , '')
call s:HL('SignColumn' , ''       , s:bg , '')
call s:HL('FoldColumn' , s:linenr , s:bg , '')

" Cursor
call s:HL('Cursor',s:cursor_fg, s:cursor_bg, 'none')

" Syntax highlighting
call s:HL('Special'        , s:fg,'','')
call s:HL('Comment'        , s:comment,'','')
call s:HL('String'         , s:string,'','')
call s:HL('Statement'      , s:fg,'','')
call s:HL('Keyword'        , s:keyword,'','')
call s:HL('Conditional'    , s:keyword,'','')
call s:HL('Operator'       , s:fg,'','')
call s:HL('Label'          , s:fg,'','')
call s:HL('Repeat'         , s:keyword,'','')
call s:HL('Todo'           , s:constant,  s:bg, '')
call s:HL('SpecialComment' , s:constant,  s:bg, '')
call s:HL('Identifier'     , s:fg, '', 'none')
call s:HL('Function'       , s:function, '', 'none')

" Preprocessor stuff is lime, to make it pop.
call s:HL('PreProc'   , s:errormsg, '' , 'none')
call s:HL('Macro'     , s:function, '' , 'none')
call s:HL('Define'    , s:errormsg , '' , 'none')
call s:HL('PreCondit' , s:errormsg , '' , 'none')
call s:HL('Type'      , s:fg, '' , 'none')

call s:HL('Constant'     , s:constant,'','')
call s:HL('Character'    , s:constant,'','')
call s:HL('Boolean'      , s:constant,'','')
call s:HL('Number'       , s:constant,'','')
call s:HL('Float'        , s:constant,'','')
call s:HL('SpecialChar'  , s:constant,'','')
call s:HL('StorageClass' , s:constant,'','')
call s:HL('Structure'    , s:constant,'','')
call s:HL('Typedef'      , s:constant,'','')
call s:HL('Exception'    , s:errormsg, '','')

" Misc
call s:HL('Error'  , 'Red'     , 'White' , '')
call s:HL('Debug'  , s:errormsg   , ''      , '')
call s:HL('Ignore' , s:comment , ''      , '')

" Completion Menu
call s:HL('Pmenu'      , s:fg , s:tabline, '')
call s:HL('PmenuSel'   , s:bg , s:menu, '')
call s:HL('PmenuSbar'  , ''   , s:bg_dimmer , '')
call s:HL('PmenuThumb' , ''   , s:constant  , '')

" Diffs
call s:HL('DiffDelete' , '' , s:diff_delete , '')
call s:HL('DiffAdd'    , '' , s:diff_add    , '')
call s:HL('DiffChange' , '' , s:diff_change , '')
call s:HL('DiffText'   , '' , s:diff_text   , '')

" Spelling
 if has("spell")
     call s:HL('SpellCap'   , s:errormsg , s:bg , 'undercurl,bold')
     call s:HL('SpellBad'   , ''      , s:bg , 'undercurl'     )
     call s:HL('SpellLocal' , ''      , ''   , 'undercurl'     )
     call s:HL('SpellRare'  , ''      , ''   , 'undercurl'     )
 endif

" Vim
call s:HL('vimCommand'   , s:keyword  , '' , '')
call s:HL('vimIsCommand' , s:constant , '' , '')
call s:HL('vimNotFunc'   , s:keyword  , '' , '')
call s:HL('vimLet'       , s:keyword  , '' , '')
call s:HL('vimUserFunc'  , s:function , '' , '')
call s:HL('vimParenSep'  , s:fg       , '' , '')
call s:HL('vimOption'    , s:constant , '' , '')
call s:HL('vimSet'       , s:constant , '' , '')

" JavaScript
call s:HL('jsVariableDef'       , s:fg       , '' , '')
call s:HL('jsGlobalNodeObjects' , s:constant , '' , '')
call s:HL('jsThis'              , s:constant , '' , '')
call s:HL('jsThis'              , s:constant , '' , '')
call s:HL('jsStorageClass'      , s:errormsg    , '' , '')
call s:HL('jsImport'            , s:errormsg    , '' , '')
call s:HL('jsFrom'              , s:errormsg    , '' , '')
call s:HL('jsModuleAs'          , s:errormsg    , '' , '')
call s:HL('jsClassDefinition'   , s:function , '' , '')
call s:HL('jsDocType'           , s:function , '' , '')
call s:HL('jsClassFuncName'     , s:function , '' , '')
call s:HL('jsFuncCall'          , s:function , '' , '')
call s:HL('jsExceptions'        , s:function , '' , '')
call s:HL('jsGlobalObjects'     , s:function , '' , '')

" Markdown
call s:HL('htmlH1'       , s:keyword, '' , '')
call s:HL('htmlH2'       , s:keyword, '' , '')
call s:HL('htmlH3'       , s:keyword, '' , '')
call s:HL('htmlH4'       , s:keyword, '' , '')
call s:HL('htmlH5'       , s:fg       , '' , '')
call s:HL('htmlH6'       , s:fg       , '' , '')
call s:HL('mkdURL'       , s:constant , '' , '')
call s:HL('mkdLineBreak' , s:fg       , '' , '')
call s:HL('mkdHeading'   , s:keyword  , '' , '')

" Go
call s:HL('goType'         , s:errormsg    , '' , '')
call s:HL('goMethodCall'   , s:constant , '' , '')
call s:HL('goFunctionCall' , s:constant , '' , '')
call s:HL('goTypeName'     , s:fg       , '' , '')
call s:HL('goBlock'        , s:fg       , '' , '')
call s:HL('goOperator'     , s:fg       , '' , '')
call s:HL('goField'        , s:fg       , '' , '')
call s:HL('goTypeName'     , s:fg       , '' , '')

" JSON
call s:HL('jsonBraces'  , s:fg     , '' , '')
call s:HL('jsonKeyword' , s:string , '' , '')

" CSS
call s:HL('cssTagName'        , s:keyword  , '' , '')
call s:HL('cssPseudoClassId'  , s:function , '' , '')
call s:HL('cssUnitDecorators' , s:errormsg    , '' , '')

" YAML
call s:HL('yamlKey', s:keyword,'','')

" LSP
call s:HL('LspDiagnosticsError '      , s:errormsg   , '' , '')
call s:HL('LspDiagnosticsWarning'     , s:warningmsg , '' , '')
call s:HL('LspDiagnosticsHint'        , s:linenr  , '' , '')
call s:HL('LspDiagnosticsInformation' , s:linenr  , '' , '')

" RUST
call s:HL('rustquestionmark' , s:keyword, '' , '')
call s:HL('rustmodpath'      , s:fg, '' , '')
call s:HL('rustassert'       , s:function, '' , '')
