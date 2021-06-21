highlight clear
if exists('syntax_on')
  syntax reset
endif
set background=light
let g:colors_name = 'mymonolight'
let g:base16_hex_colors = {
      \ 'background':   '#e0e0e0',
      \ 'bg3':          '#d5d5d5',
      \ 'bg2':          '#cccccc',
      \ 'bg1':          '#b3b3b3',
      \ 'fg1':          '#595959',
      \ 'fg2':          '#333333',
      \ 'fg3':          '#1a1a1a',
      \ 'foreground':   '#000000',
      \ 'red':          '#b30000',
      \ 'orange':       '#f65c09',
      \ 'yellow':       '#e67300',
      \ 'green':        '#00802b',
      \ 'aqua':         '#227777',
      \ 'blue':         '#0033cc',
      \ 'purple':       '#625194',
      \ 'string':       '#196619',
      \ 'white':        '#ffffff',
      \ 'black':        '#000000',
      \ 'comment':      '#6e6e91',
      \ 'linenr':       '#a8a8bd'}

command! -bang -nargs=+ Base16Highlight call base16#highlight(<q-bang>=='!', <f-args>)

let s:specs = {}

" DEFAULTS 
let s:specs['Normal']            = 'fg=foreground bg=background'
let s:specs['Comment']           = 'fg=comment italic'
let s:specs['Constant']          = 'fg=foreground'
let s:specs['String']            = 'fg=string'
let s:specs['Character']         = 'fg=foreground'
let s:specs['Identifier']        = 'fg=foreground'
let s:specs['Function']          = 'fg=foreground bold'
let s:specs['Statement']         = 'fg=foreground bold'
let s:specs['PreProc']           = 'fg=foreground'
let s:specs['Type']              = 'fg=foreground'
let s:specs['Special']           = 'fg=foreground bold'
let s:specs['SpecialChar']       = 'fg=orange bold'
let s:specs['Underlined']        = 'fg=foreground underline'
let s:specs['Ignore']            = 'fg=background bg=red'
let s:specs['Error']             = 'fg=red bg=background bold reverse'
let s:specs['Todo']              = 'fg=background bg=comment bold'
let s:specs['Delimiter']         = 'fg=foreground'
let s:specs['StorageClass']      = 'fg=foreground'
let s:specs['Operator']          = 'fg=foreground bold'
let s:specs['Include']           = 'fg=foreground'
let s:specs['helpExample']       = 'fg=blue'

" REST  
let s:specs['SpecialKey']   = 'fg=fg3 bold'
let s:specs['NonText']      = 'fg=linenr bold'
let s:specs['Conceal']      = 'fg=bg1 bg=bg3'
let s:specs['MatchParen']   = 'fg=orange bold underline'

" MESSAGES, QUESTIONS, AND PROMPTS
let s:specs['ModeMsg']     = 'bold'
let s:specs['MoreMsg']     = 'fg=aqua bold'
let s:specs['WarningMsg']  = 'fg=orange'
let s:specs['ErrorMsg']    = 'fg=red'
let s:specs['Question']    = 'fg=aqua bold'
let s:specs['Title']       = 'fg=blue bold'

" SEARCH, COMPLETION, AND OTHER NVIM NAVIGATION
let s:specs['IncSearch']  = 'bg=red fg=background bold'
let s:specs['Search']     = 'bg=orange fg=background bold'
let s:specs['WildMenu']   = 'bg=orange fg=background reverse'
let s:specs['Directory']  = 'fg=blue'

" DIFF
let s:specs['DiffAdd']     = 'fg=green bg=bg3 bold'
let s:specs['DiffChange']  = 'fg=yellow bg=bg3 sp=yellow bold'
let s:specs['DiffDelete']  = 'fg=red bg=bg3 bold'
let s:specs['DiffText']    = 'fg=red bold bg=bg3 sp=blue bold'

" SPELLING
let s:specs['SpellBad']   = 'undercurl sp=red'
let s:specs['SpellCap']   = 'undercurl sp=blue'
let s:specs['SpellRare']  = 'undercurl sp=purple'
let s:specs['SpellLocal'] = 'undercurl sp=aqua'

" POPUP MENU
let s:specs['Pmenu']      = 'fg=foreground bg=bg3'
let s:specs['PmenuSel']   = 'fg=background bold bg=foreground'
let s:specs['PmenuSbar']  = 'bg=bg3'
let s:specs['PmenuThumb'] = 'bg=foreground'

" INTERFACE COMPONENTS.
let s:specs['LineNr']        = 'fg=linenr'
let s:specs['CursorLineNr']  = 'fg=foreground bg=bg3 bold'
let s:specs['CursorLine']    = 'bg=bg3 sp=fg2'
let s:specs['CursorColumn']  = 'bg=bg3'
let s:specs['Visual']        = 'bg=bg1'
let s:specs['NormalFloat']   = 'bg=bg3'
let s:specs['VertSplit']     = 'fg=linenr bg=bg3'

let s:specs['ColorColumn']   = 'bg=orange'
let s:specs['SignColumn']    = 'fg=bg1'
let s:specs['Folded']        = 'fg=bg1 bg=bg3 underline bold'
let s:specs['FoldColumn']    = 'fg=bg1 bg=bg3'
let s:specs['Cursor']        = 'fg=white bg=black'
" let s:specs['TermCursor']    = 'reverse'
" highlight link TermCursor Cursor
" highlight link lCursor Cursor
" 
" GITSIGNS
let s:specs['GitSignsAdd']      = 'fg=green bold'
let s:specs['GitSignsChange']   = 'fg=yellow bold'
let s:specs['GitSignsDelete']   = 'fg=red bold'

" TELESCOPE
let s:specs['TelescopeNormal']         = 'fg=fg3'
let s:specs['TelescopeSelection']      = 'fg=yellow bold'
let s:specs['GitSignsSelectionCaret']  = 'fg=foreground'
let s:specs['TelescopeMatching']       = 'fg=yellow bold'
let s:specs['TelescopeBorder']         = 'fg=linenr'

" YAML 
let s:specs['yamlTSField']          = 'fg=blue'
let s:specs['yamlBlockMappingKey']  = 'fg=blue'

" TOML 
let s:specs['tomlTSTypeBuiltin']    = 'fg=blue'
let s:specs['tomlTSProperty']       = 'fg=foreground'

" MARKDOWN 
let s:specs['MarkdownCode']   = 'fg=blue'

" HOP 
let s:specs['HopNextKey']   = 'fg=red bold,underline'
let s:specs['HopNextKey1']   = 'fg=yellow bold,underline'

" BARBAR
let s:specs['BufferCurrent']       = 'fg=foreground bold'
let s:specs['BufferCurrentIndex']  = 'fg=foreground bold'
let s:specs['BufferCurrentMod']    = 'fg=foreground bold'
let s:specs['BufferCurrentSign']   = 'fg=foreground bold'
let s:specs['BufferTabpageFill']   = 'bg=bg1'
let s:specs['BufferInactive']      = 'bg=bg2'
let s:specs['BufferInactiveIndex'] = 'bg=bg2'
let s:specs['BufferInactiveSign']  = 'bg=bg2'

" TREESITTER
let s:specs['TSProperty']        = 'fg=foreground'
let s:specs['TSTagDelimiter']    = 'fg=linenr'
let s:specs['TSInclude']         = 'fg=foreground bold'
let s:specs['TSNamespace']       = 'fg=foreground'
let s:specs['TSPunctDelimiter']  = 'fg=fg1'
let s:specs['TSPunctBracket']    = 'fg=foreground'
let s:specs['TSPunctSpecial']    = 'fg=foreground bold'
let s:specs['TSAnnotation']      = 'fg=foreground bold'
let s:specs['TSAttribute']       = 'fg=orange bold'
let s:specs['TSFuncMacro']       = 'fg=foreground'
let s:specs['TSConstMacro']      = 'fg=aqua bold'
let s:specs['TSVariableBuiltIn'] = 'fg=foreground'
let s:specs['TSVariable']        = 'fg=foreground'
let s:specs['TSDefinitionUsage'] = 'fg=orange bg=bg3 bold'

" RUST 
let s:specs['RustTSKeywordOperator'] = 'fg=foreground bold'
let s:specs['RustTSKeywordFunction'] = 'fg=foreground bold'

" NEOGIT 
hi link NeogitDiffAddHighlight DiffAdd
hi link NeogitDiffDeleteHighlight DiffDelete
hi link NeogitDiffContextHighlight Keyword
hi link NeogitHunkHeader Constant
hi link NeogitHunkHeaderHighlight Statusline
hi link NeogitDiffContextHighlight Normal

" LSP
let s:specs['LspDiagnosticsDefaultError']      = 'fg=red bold'
let s:specs['LspDiagnosticsDefaultWarning']    = 'fg=orange bold'
" hi link LspDiagnosticsDefaultError ErrorMsg
" hi link LspDiagnosticsDefaultWarning WarningMsg
hi link LspDiagnosticsDefaultInformation MoreMsg
hi link LspDiagnosticsDefaultHint MoreMsg
hi link LspDiagnosticsUnderlineError underlined
hi link LspDiagnosticsUnderlineWarning underlined 
hi link LspDiagnosticsUnderlineInformation  underlined
hi link LspDiagnosticsUnderlineHint underlined 

" Normal must go first.
execute 'Base16Highlight! Normal' s:specs['Normal']
call remove(s:specs, 'Normal')
if has_key(get(g:, 'base16_color_modifiers', {}), 'Normal')
  execute 'Base16Highlight Normal' g:base16_color_modifiers['Normal']
  call remove(g:base16_color_modifiers, 'Normal')
endif

for [s:group, s:spec] in items(s:specs)
  execute 'Base16Highlight!' s:group s:spec
endfor

if exists('g:base16_color_modifiers')
  for [s:group, s:spec] in items(g:base16_color_modifiers)
    execute 'Base16Highlight' s:group s:spec
  endfor
endif

unlet s:group s:spec s:specs


" Neovim :terminal Configuration ---------------------------------------------
if has('termguicolors') && &termguicolors
  let g:terminal_color_0  = g:base16_hex_colors['background']   " bg
  let g:terminal_color_1  = g:base16_hex_colors['red']          " red
  let g:terminal_color_2  = g:base16_hex_colors['green']        " green
  let g:terminal_color_3  = g:base16_hex_colors['yellow']       " yellow
  let g:terminal_color_4  = g:base16_hex_colors['blue']         " blue
  let g:terminal_color_5  = g:base16_hex_colors['purple']       " magenta
  let g:terminal_color_6  = g:base16_hex_colors['aqua']         " cyan
  let g:terminal_color_7  = g:base16_hex_colors['bg3']          " light grey
  let g:terminal_color_8  = g:base16_hex_colors['bg2']          " dark grey
  let g:terminal_color_9  = g:base16_hex_colors['orange']       " light red
  let g:terminal_color_10 = g:base16_hex_colors['green']        " light green
  let g:terminal_color_11 = g:base16_hex_colors['yellow']       " light yellow
  let g:terminal_color_12 = g:base16_hex_colors['blue']         " light blue
  let g:terminal_color_13 = g:base16_hex_colors['purple']       " light magenta
  let g:terminal_color_14 = g:base16_hex_colors['aqua']         " light cyan
  let g:terminal_color_15 = g:base16_hex_colors['foreground']   " fg
endif

