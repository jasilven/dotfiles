" highlight clear
" if exists('syntax_on')
"   syntax reset
" endif

set background=light
let g:colors_name = 'mymonolight'

command! -bang -nargs=+ Base16Highlight call base16#highlight(<q-bang>=='!', <f-args>)

let g:base16_hex_colors = {
    \ 'background':    '#e0e0e0',
    \ 'bg3':           '#d5d5d5',
    \ 'bg2':           '#cccccc',
    \ 'bg1':           '#b3b3b3',
    \ 'fg1':           '#595959',
    \ 'fg2':           '#333333',
    \ 'fg3':           '#1a1a1a',
    \ 'foreground':    '#000000',
    \ 'darkred':       '#8b0000',
    \ 'darkorange':    '#FF8C00',
    \ 'goldenrod':     '#DAA520',
    \ 'darkgreen':     '#006400',
    \ 'darkcyan':      '#008b8b',
    \ 'navy':          '#000080',
    \ 'darkviolet':    '#9400D3',
    \ 'white':         '#ffffff',
    \ 'black':         '#000000',
    \ 'darkolivegreen':'#556B2F',
    \ 'sienna':        '#A0522D',
    \}

let s:specs = {
    \'Normal'        :'fg=foreground bg=background',
    \'Comment'       :'fg=fg1 italic bold',
    \'Constant'      :'fg=foreground',
    \'Number'        :'fg=darkcyan bold',
    \'String'        :'fg=darkgreen',
    \'Character'     :'fg=foreground',
    \'Identifier'    :'fg=foreground',
    \'Function'      :'fg=navy',
    \'Statement'     :'fg=foreground bold',
    \'Keyword'       :'fg=foreground bold',
    \'PreProc'       :'fg=foreground',
    \'Type'          :'fg=foreground',
    \'Special'       :'fg=foreground bold',
    \'SpecialChar'   :'fg=darkorange bold',
    \'Underlined'    :'fg=foreground underline',
    \'Ignore'        :'fg=background bg=darkred',
    \'Error'         :'fg=darkred bg=background bold reverse',
    \'Todo'          :'fg=background bg=sienna bold',
    \'Delimiter'     :'fg=foreground',
    \'StorageClass'  :'fg=foreground',
    \'Operator'      :'fg=foreground bold',
    \'Include'       :'fg=foreground',
    \'helpExample'   :'fg=navy',
    \'SpecialKey'    :'fg=fg3 bold',
    \'NonText'       :'fg=bg3',
    \'Conceal'       :'fg=bg1 bg=bg3',
    \'MatchParen'    :'fg=darkorange bold underline',
    \'ModeMsg'       :'bold',
    \'MoreMsg'       :'fg=darkcyan bold',
    \'WarningMsg'    :'fg=darkorange',
    \'ErrorMsg'      :'fg=darkred',
    \'Question'      :'fg=darkcyan bold',
    \'Title'         :'fg=navy bold',
    \'IncSearch'     :'bg=darkgreen fg=background bold underline',
    \'Search'        :'bg=darkorange fg=background bold',
    \'WildMenu'      :'bg=darkorange fg=background reverse',
    \'Directory'     :'fg=navy',
    \'DiffAdd'       :'fg=darkgreen bg=bg3 bold',
    \'DiffChange'    :'fg=goldenrod bg=bg3 sp=goldenrod bold',
    \'DiffDelete'    :'fg=darkred bg=bg3 bold',
    \'DiffText'      :'fg=darkred bold bg=bg3 sp=navy bold',
    \'SpellBad'      :'undercurl sp=darkred',
    \'SpellCap'      :'undercurl sp=navy',
    \'SpellRare'     :'undercurl sp=darkviolet',
    \'SpellLocal'    :'undercurl sp=darkcyan',
    \'Pmenu'         :'fg=foreground bg=bg3',
    \'PmenuSel'      :'fg=background bold bg=foreground',
    \'PmenuSbar'     :'bg=bg3',
    \'PmenuThumb'    :'bg=foreground',
    \'LineNr'        :'fg=bg1',
    \'CursorLineNr'  :'fg=foreground bg=bg3 bold',
    \'CursorLine'    :'bg=bg3 sp=fg2',
    \'CursorColumn'  :'bg=bg3',
    \'Visual'        :'bg=bg1',
    \'NormalFloat'   :'bg=bg3',
    \'VertSplit'     :'fg=bg1 bg=background',
    \'ColorColumn'   :'bg=darkorange',
    \'SignColumn'    :'fg=bg1',
    \'Folded'        :'fg=bg1 bg=bg3 underline bold',
    \'FoldColumn'    :'fg=bg1 bg=bg3',
    \'Cursor'        :'fg=white bg=black',
    \'lCursor'       :'fg=white bg=black',
    \}

let s:plugin_specs = {
    \'GitSignsAdd'                       :'fg=darkgreen bold',
    \'GitSignsChange'                    :'fg=goldenrod bold',
    \'GitSignsDelete'                    :'fg=darkred bold',
    \'GitSignsSelectionCaret'            :'fg=foreground',
    \'TelescopeNormal'                   :'fg=fg3',
    \'TelescopeSelection'                :'fg=darkred bold,underline',
    \'TelescopeMatching'                 :'fg=darkred bold',
    \'TelescopeBorder'                   :'fg=bg1',
    \'yamlTSField'                       :'fg=navy',
    \'yamlBlockMappingKey'               :'fg=navy',
    \'tomlTSTypeBuiltin'                 :'fg=navy',
    \'tomlTSProperty'                    :'fg=foreground',
    \'MarkdownCode'                      :'fg=darkviolet',
    \'MarkdownLinkText'                  :'fg=darkcyan',
    \'MarkdownUrl'                       :'fg=foreground italic',
    \'MarkdownListMarker'                :'fg=darkred',
    \'MarkdownH1'                        :'fg=navy bold',
    \'MarkdownH2'                        :'fg=darkcyan italic',
    \'MarkdownH3'                        :'fg=darkcyan italic',
    \'MarkdownH1Delimiter'               :'fg=navy italic',
    \'MarkdownH2Delimiter'               :'fg=darkcyan italic',
    \'MarkdownH3Delimiter'               :'fg=darkcyan italic',
    \'HopNextKey'                        :'fg=darkred bold,underline',
    \'HopNextKey1'                       :'fg=darkred bold,underline',
    \'BufferCurrent'                     :'fg=foreground bold',
    \'BufferCurrentIndex'                :'fg=foreground bold',
    \'BufferCurrentMod'                  :'fg=foreground bold',
    \'BufferCurrentSign'                 :'fg=foreground bold',
    \'BufferTabpageFill'                 :'bg=bg1',
    \'BufferInactive'                    :'bg=bg2',
    \'BufferInactiveIndex'               :'bg=bg2',
    \'BufferInactiveSign'                :'bg=bg2',
    \'TSProperty'                        :'fg=foreground',
    \'TSTagDelimiter'                    :'fg=bg2',
    \'TSInclude'                         :'fg=foreground bold',
    \'TSRepeat'                          :'fg=foreground bold',
    \'TSNamespace'                       :'fg=foreground',
    \'TSPunctDelimiter'                  :'fg=fg1',
    \'TSPunctBracket'                    :'fg=foreground',
    \'TSPunctSpecial'                    :'fg=foreground bold',
    \'TSAnnotation'                      :'fg=foreground bold',
    \'TSAttribute'                       :'fg=darkorange bold',
    \'TSFuncMacro'                       :'fg=foreground',
    \'TSConstMacro'                      :'fg=darkcyan bold',
    \'TSVariableBuiltIn'                 :'fg=foreground',
    \'TSVariable'                        :'fg=foreground',
    \'TSDefinitionUsage'                 :'fg=darkorange bg=bg3 bold',
    \'RustTSKeywordOperator'             :'fg=foreground bold',
    \'RustTSKeywordFunction'             :'fg=foreground bold',
    \'NeogitStagedchanges'               :'fg=darkred bold',
    \'NeogitUnstagedchanges'             :'fg=goldenrod bold',
    \'NeogitUntrackedfiles'              :'fg=darkcyan bold',
    \'NeogitHunkHeader'                  :'fg=foreground bold',
    \'LspDiagnosticsDefaultError'        :'fg=darkred bold',
    \'LspDiagnosticsDefaultWarning'      :'fg=darkorange bold',
    \'LspDiagnosticsDefaultInfo'         :'fg=darkcyan bold',
    \'LspDiagnosticsDefaultHint'         :'fg=darkcyan bold',
    \'LspDiagnosticsUnderlineError'      :'fg=foreground sp=darkred undercurl',
    \'LspDiagnosticsUnderlineWarning'    :'fg=foreground sp=goldenrod undercurl',
    \'LspDiagnosticsUnderlineInformation':'fg=foreground sp=darkcyan undercurl',
    \'LspDiagnosticsUnderlineHint'       :'fg=foreground sp=darkcyan undercurl',
    \'CocErrorSign'                      :'fg=darkred bold',
    \'CocWarningSign'                    :'fg=darkorange bold',
    \'CocInfoSign'                       :'fg=goldenrod',
    \'CocHintSign'                       :'fg=darkcyan bold',
    \'FocusedSymbol'                     :'bg=goldenrod',
    \'NvimTreeNormal'                    :'bg=bg3',
    \}

hi link NeogitDiffAddHighlight DiffAdd
hi link NeogitDiffDeleteHighlight DiffDelete
hi link NeogitDiffContextHighlight Keyword
hi link NeogitHunkHeaderHighlight Statusline
hi link NeogitDiffContextHighlight Normal
hi link LspDiagnosticsDefaultInformation MoreMsg
hi link LspDiagnosticsDefaultHint MoreMsg

" Normal first
execute 'Base16Highlight! Normal' s:specs['Normal']
call remove(s:specs, 'Normal')

for [s:group, s:spec] in items(s:specs)
  execute 'Base16Highlight!' s:group s:spec
endfor
for [s:group, s:spec] in items(s:plugin_specs)
  execute 'Base16Highlight!' s:group s:spec
endfor

unlet s:group s:spec s:specs s:plugin_specs

" Terminal colors
if has('termguicolors') && &termguicolors
  let g:terminal_color_0  = g:base16_hex_colors['background']
  let g:terminal_color_1  = g:base16_hex_colors['darkred']
  let g:terminal_color_2  = g:base16_hex_colors['darkgreen']
  let g:terminal_color_3  = g:base16_hex_colors['goldenrod']
  let g:terminal_color_4  = g:base16_hex_colors['navy']
  let g:terminal_color_5  = g:base16_hex_colors['darkviolet']
  let g:terminal_color_6  = g:base16_hex_colors['darkcyan']
  let g:terminal_color_7  = g:base16_hex_colors['bg3']
  let g:terminal_color_8  = g:base16_hex_colors['bg2']
  let g:terminal_color_9  = g:base16_hex_colors['darkred']
  let g:terminal_color_10 = g:base16_hex_colors['darkgreen']
  let g:terminal_color_11 = g:base16_hex_colors['goldenrod']
  let g:terminal_color_12 = g:base16_hex_colors['navy']
  let g:terminal_color_13 = g:base16_hex_colors['darkviolet']
  let g:terminal_color_14 = g:base16_hex_colors['darkcyan']
  let g:terminal_color_15 = g:base16_hex_colors['foreground']
endif

