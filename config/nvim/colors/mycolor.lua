local Color, c, Group, g, s = require('colorbuddy').setup()
local colors = require('colors')

vim.g.colors_name = 'mycolor'

-- COLORS
if vim.o.background == 'dark' then
    Color.new('black',     colors.black)
    Color.new('white',     colors.white)
    Color.new('red',       colors.salmon)
    Color.new('orange',    colors.darkorange)
    Color.new('yellow',    colors.goldenrod)
    Color.new('green',     colors.lightgreen)
    Color.new('cyan',      colors.mediumturquoise)
    Color.new('blue',      colors.steelblue)
    Color.new('lightblue', colors.steelblue)
    Color.new('purple',    colors.darkviolet)
    Color.new('gray',      colors.darkgray)
    Color.new('brown',     colors.darkkhaki)
    Group.new('Normal',c.white:dark(0.15), c.black:light(0.18))
else
    Color.new('black',     colors.black)
    Color.new('white',     colors.white)
    Color.new('red',       colors.darkred)
    Color.new('orange',    colors.darkorange)
    Color.new('yellow',    colors.goldenrod)
    Color.new('green',     colors.darkgreen)
    Color.new('cyan',      colors.darkcyan)
    Color.new('blue',      colors.navy)
    Color.new('lightblue', colors.steelblue)
    Color.new('purple',    colors.darkviolet)
    Color.new('gray',      colors.darkgray)
    -- Color.new('brown',     colors.saddlebrown)
    Color.new('brown',     colors.tan)
    Group.new('Normal',c.black, c.white:dark(0.03))
end

-- SPECS
Group.new('Comment'       ,c.brown, nil, s.italic)
Group.new('Constant'      ,nil,nil,nil)
Group.new('Number'        ,c.cyan,nil,s.bold)
Group.new('String'        ,c.green,nil,nil)
Group.new('Character'     ,g.String,g.String,g.String)
Group.new('Identifier'    ,nil,nil,nil)
Group.new('Function'      ,nil,nil,s.bold)
Group.new('Statement'     ,nil,nil,s.bold)
Group.new('Keyword'       ,nil,nil,s.bold)
Group.new('PreProc'       ,g.Normal.fg:light(0.5),nil,nil)
Group.new('Macro'         ,g.Normal.fg:light(0.5),nil,nil)
Group.new('Type'          ,nil,nil,nil)
Group.new('Special'       ,nil,nil,nil)
Group.new('SpecialChar'   ,c.orange, nil, s.bold)
Group.new('Underlined'    ,nil, nil, s.underline)
Group.new('Ignore'        ,g.Normal.bg, c.red, nil)
Group.new('Error'         ,c.red, nil,  s.bold+s.reverse)
Group.new('Todo'          ,g.Normal.bg, g.Comment.fg, s.bold)
Group.new('Delimiter'     ,nil,nil,nil)
Group.new('StorageClass'  ,nil,nil,nil)
Group.new('Operator'      ,nil,nil,s.bold)
Group.new('Include'       ,nil,nil,nil)
Group.new('helpExample'   ,c.blue,nil,nil)
Group.new('SpecialKey'    ,g.Normal.fg:light(0.1), nil, s.bold)
Group.new('NonText'       ,c.gray, nil, s.bold)
Group.new('Conceal'       ,g.Normal.fg:light(0.2), g.Normal.bg:dark(0.1), s.bold)
Group.new('MatchParen'    ,c.orange,nil, s.bold + s.underline)
Group.new('ModeMsg'       ,nil,nil,s.bold)
Group.new('MoreMsg'       ,c.cyan,nil, s.bold)
Group.new('WarningMsg'    ,c.orange,nil, s.bold)
Group.new('ErrorMsg'      ,c.red,nil, s.bold)
Group.new('Question'      ,g.MoreMsg, g.MoreMsg, g.MoreMsg)
Group.new('Title'         ,c.blue, nil, s.bold)
Group.new('IncSearch'     ,c.white,c.green, s.bold )
Group.new('Search'        ,c.white,c.orange, s.bold)
Group.new('WildMenu'      ,c.orange, g.Normal.bg, s.reverse)
Group.new('Directory'     ,g.Title,g.Title,g.Title)
Group.new('DiffAdd'       ,c.green,g.Normal.bg:light(0.1), s.bold)
Group.new('DiffChange'    ,c.yellow,g.Normal.bg:light(0.1), s.bold, c.yellow)
Group.new('DiffDelete'    ,c.red, g.Normal.bg:light(0.1), s.bold)
Group.new('DiffText'      ,c.blue, g.Normal.bg:light(0.1), s.bold+s.undercurl, c.blue)
Group.new('SpellBad'      ,nil,nil,s.undercurl, c.red)
Group.new('SpellCap'      ,nil,nil,s.undercurl, c.blue)
Group.new('SpellRare'     ,nil,nil,s.undercurl, c.purple)
Group.new('SpellLocal'    ,nil,nil,s.undercurl, c.cyan)
Group.new('Pmenu'         ,g.Normal.fg, g.Normal.bg:dark(0.05))
Group.new('PmenuSel'      ,g.Normal.bg,g.Normal.fg,s.bold)
Group.new('PmenuSbar'     ,g.Normal.bg:light(0.5))
Group.new('PmenuThumb'    ,nil,g.Normal.fg)
Group.new('LineNr'        ,c.gray,nil,s.italic)
Group.new('CursorLine'    ,nil,g.Normal.bg:dark(0.03))
Group.new('CursorLineNr'  ,g.Normal.fg,g.Cursorline.bg,s.bold)
Group.new('CursorColumn'  ,nil,g.Normal.bg:dark(0.1))
Group.new('VertSplit'     ,g.Normal.bg:dark(0.2))
Group.new('SignColumn'    ,nil,nil,nil)
Group.new('Folded'        ,c.cyan, g.Normal.bg:dark(0.05),s.bold)
Group.new('Cursor'        ,c.white, c.lightblue,s.bold)
Group.new('lCursor'       ,c.white, c.purple,s.bold)

-- Group.new('GColumn'   ,'bg=orange')
-- Group.new('FoldColumn'    ,'fg=bg1 bg=bg3')
--
-- PLUGINS
-- Group.new('lualine_c_normal'                  ,g.Normal.bg, c.lightblue)
Group.new('GitSignsAdd'                       ,c.green, nil, s.bold)
Group.new('GitSignsChange'                    ,c.yellow,nil, s.bold)
Group.new('GitSignsDelete'                    ,c.red,nil, s.bold)
Group.new('GitSignsSelectionCaret'            ,c.black)
Group.new('TelescopeNormal'                   ,g.Normal.fg:light(0.35))
Group.new('TelescopeSelection'                ,c.red,nil, s.bold + s.underline)
Group.new('TelescopeMatching'                 ,g.TelescopeSelection.fg,nil, s.bold)
Group.new('TelescopeBorder'                   ,g.VertSplit,g.VertSplit)
Group.new('yamlTSField'                       ,g.Normal.fg,nil,s.bold)
Group.new('yamlBlockMappingKey'               ,c.blue)
Group.new('tomlTSTypeBuiltin'                 ,c.blue)
Group.new('tomlTSProperty'                    ,g.Normal.fg:light(0.1))
Group.new('MarkdownCode'                      ,c.purple)
Group.new('MarkdownLinkText'                  ,c.cyan)
Group.new('MarkdownUrl'                       ,nil, nil, s.italic)
Group.new('MarkdownListMarker'                ,c.red)
Group.new('MarkdownH1'                        ,g.Normal.fg,nil, s.bold)
Group.new('MarkdownH2'                        ,g.MarkdownH1.fg:light(0.3),nil,s.bold+s.italic)
Group.new('MarkdownH3'                        ,c.cyan,nil,s.italic+s.bold)
Group.new('MarkdownH1Delimiter'               ,g.MarkdownH1.fg,nil,s.bold)
Group.new('MarkdownH2Delimiter'               ,g.MarkdownH2.fg,nil,s.italic)
Group.new('MarkdownH3Delimiter'               ,g.MarkdownH3.fg,nil,s.italic)
Group.new('HopNextKey'                        ,c.red,nil, s.bold + s.underline)
Group.new('HopNextKey1'                       ,c.red,nil, s.bold + s.underline)
Group.new('BufferCurrent'                     ,g.Normal.fg,nil,s.bold)
Group.new('BufferCurrentIndex'                ,g.Normal.fg,nil,s.bold)
Group.new('BufferCurrentMod'                  ,g.Normal.fg,nil,s.bold)
Group.new('BufferCurrentSign'                 ,g.Normal.fg,nil,s.bold)
Group.new('BufferTabpageFill'                 ,nil,g.Normal.bg:light(0.3))
Group.new('BufferInactive'                    ,nil,g.Normal.bg:light(0.2))
Group.new('BufferInactiveIndex'               ,nil,g.Normal.bg:light(0.2))
Group.new('BufferInactiveSign'                ,nil,g.Normal.bg:light(0.2))
Group.new('TSProperty'                        ,g.Normal.fg:light(0.1))
Group.new('TSTagDelimiter'                    ,g.Normal.fg:light(0.1))
Group.new('TSInclude'                         ,nil,nil,s.bold)
Group.new('TSRepeat'                          ,nil,nil,s.bold)
Group.new('TSNamespace'                       ,nil,nil,nil)
Group.new('TSVariable'                        ,nil,nil,nil)
Group.new('TSPunctDelimiter'                  ,c.gray)
Group.new('TSPunctSpecial'                    ,nil,nil,s.bold)
Group.new('TSAnnotation'                      ,nil,nil,s.bold)
Group.new('TSAttribute'                       ,nil,nil,s.bold)
Group.new('TSConstMacro'                      ,c.cyan,nil,s.bold)
Group.new('TSDefinitionUsage'                 ,c.orange,g.Normal.bg:dark(0.05),s.bold)
Group.new('TSFuncMacro'                       ,g.Normal.fg)
Group.new('RustTSKeywordOperator'             ,nil, nil, s.bold)
Group.new('RustTSKeywordFunction'             ,nil, nil, s.bold)
Group.new('NeogitStagedchanges'               ,c.red,nil,s.bold)
Group.new('NeogitUnstagedchanges'             ,c.yellow,nil,s.bold)
Group.new('NeogitUntrackedfiles'              ,c.cyan,nil,s.bold)
Group.new('NeogitHunkHeader'                  ,c.black,nil,s.bold)
Group.new('LspDiagnosticsDefaultError'        ,c.red,nil,s.bold)
Group.new('LspDiagnosticsDefaultWarning'      ,c.orange,nil,s.bold)
Group.new('LspDiagnosticsDefaultInfo'         ,c.cyan,nil,s.bold)
Group.new('LspDiagnosticsDefaultHint'         ,c.cyan,nil,s.bold)
Group.new('LspDiagnosticsUnderlineError'      ,nil,nil,s.undercurl,c.red)
Group.new('LspDiagnosticsUnderlineWarning'   ,nil,nil,s.undercurl,c.yellow)
Group.new('LspDiagnosticsUnderlineInformation',nil,nil,s.undercurl,c.cyan)
Group.new('LspDiagnosticsUnderlineHint'       ,nil,nil,s.undercurl,c.cyan)
Group.new('FocusedSymbol'                     ,nil,c.yellow)
Group.new('NvimTreeNormal'                    ,nil,g.Normal.bg:dark(0.05))