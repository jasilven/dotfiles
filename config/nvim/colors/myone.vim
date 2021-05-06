highlight clear
if exists('syntax_on')
  syntax reset
endif
set background=dark
let g:colors_name = 'myone'
let g:base16_hex_colors = {
      \ 'background':   '#21252b',
      \ 'bg3':          '#2c323a',
      \ 'bg2':          '#373d48',
      \ 'bg1':          '#646e82',
      \ 'fg1':          '#636e83',
      \ 'fg2':          '#7c879c',
      \ 'fg3':          '#8b95a7',
      \ 'foreground':   '#abb2bf',
      \ 'red':          '#c27070',
      \ 'orange':       '#d26f2d',
      \ 'yellow':       '#e5c07b',
      \ 'green':        '#86b464',
      \ 'blue':         '#6699cc',
      \ 'aqua':         '#56b6c2',
      \ 'purple':       '#bb7ece',
      \ 'brown':        '#AB7967'}

command! -bang -nargs=+ Base16Highlight call base16#highlight(<q-bang>=='!', <f-args>)

let s:specs = {}

" DEFAULTS
let s:specs['Normal']            = 'fg=foreground bg=background'
let s:specs['Comment']           = 'fg=orange'
let s:specs['Constant']          = 'fg=aqua'
let s:specs['String']            = 'fg=green'
let s:specs['Character']         = 'fg=green'
let s:specs['Identifier']        = 'fg=foreground'
let s:specs['Function']          = 'fg=blue'
let s:specs['Statement']         = 'fg=purple'
let s:specs['PreProc']           = 'fg=aqua'
let s:specs['Type']              = 'fg=foreground'
let s:specs['Special']           = 'fg=brown'
let s:specs['SpecialChar']       = 'fg=green bold'
let s:specs['Underlined']        = 'fg=blue underline'
let s:specs['Ignore']            = 'fg=background bg=red'
let s:specs['Error']             = 'fg=red bg=background bold reverse'
let s:specs['Todo']              = 'fg=orange bg=background bold reverse'
let s:specs['Delimiter']         = 'fg=foreground'
let s:specs['StorageClass']      = 'fg=foreground'
let s:specs['Operator']          = 'fg=foreground'
let s:specs['Include']           = 'fg=foreground'

" REST  
let s:specs['SpecialKey']   = 'fg=fg3 bold'
let s:specs['NonText']      = 'fg=fg2'
let s:specs['Conceal']      = 'fg=bg1 bg=bg3'
let s:specs['MatchParen']   = 'fg=yellow bold underline'

" MESSAGES, QUESTIONS, AND PROMPTS
let s:specs['ModeMsg']     = 'bold'
let s:specs['MoreMsg']     = 'fg=aqua bold'
let s:specs['WarningMsg']  = 'fg=yellow'
let s:specs['ErrorMsg']    = 'fg=red'
let s:specs['Question']    = 'fg=aqua bold'
let s:specs['Title']       = 'fg=blue bold'

" SEARCH, COMPLETION, AND OTHER NVIM NAVIGATION
let s:specs['IncSearch']  = 'fg=orange bg=background reverse'
let s:specs['Search']     = 'fg=yellow bg=background reverse'
let s:specs['WildMenu']   = 'fg=yellow bg=background reverse'
let s:specs['Directory']  = 'fg=aqua'

" DIFF
let s:specs['DiffAdd']     = 'fg=green bg=bg3 bold'
let s:specs['DiffChange']  = 'fg=yellow bg=bg3 sp=yellow'
let s:specs['DiffDelete']  = 'fg=red bg=bg3 bold'
let s:specs['DiffText']    = 'fg=red bold bg=bg3 sp=blue bold underline'
hi link diffadded DiffAdd
hi link diffchanged DiffChange
hi link diffremoved DiffDelete

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
let s:specs['LineNr']        = 'fg=bg2'
let s:specs['CursorLineNr']  = 'fg=yellow bold bg=bg3'
let s:specs['CursorLine']    = 'bg=bg3 sp=fg2'
let s:specs['CursorColumn']  = 'bg=bg3'
let s:specs['Visual']        = 'bg=bg1'
let s:specs['NormalFloat']   = 'bg=bg3'
let s:specs['VertSplit']     = 'fg=foreground bg=bg3'
let s:specs['ColorColumn']   = 'bg=orange'
let s:specs['SignColumn']    = 'fg=bg1'
let s:specs['Folded']        = 'fg=bg1 bg=bg3 underline bold'
let s:specs['FoldColumn']    = 'fg=bg1 bg=bg3'
let s:specs['Cursor']        = 'reverse'
let s:specs['TermCursor']    = 'reverse'
" let s:specs['StatusLine']    = 'fg=bg2 bg=bg3 reverse bold'
" let s:specs['StatusLineNC']  = 'fg=fg3 bg=bg3 reverse bold'
" let s:specs['TabLine']       = 'fg=fg3'
" let s:specs['TabLineSel']    = 'fg=fg bold'
" let s:specs['TabLineFill']   = 'fg=fg3 bg=bg2'
highlight link TermCursor Cursor
highlight link lCursor Cursor

" GITSIGNS
let s:specs['GitSignsAdd']      = 'fg=green'
let s:specs['GitSignsChange']   = 'fg=yellow'
let s:specs['GitSignsDelete']   = 'fg=red'

" TELESCOPE
let s:specs['TelescopeNormal']         = 'fg=fg3'
let s:specs['TelescopeSelection']      = 'fg=yellow bold underline'
let s:specs['GitSignsSelectionCaret']  = 'fg=foreground'
let s:specs['TelescopeMatching']       = 'fg=orange bold'

" YAML 
let s:specs['yamlTSField']   = 'fg=aqua'

" MARKDOWN 
let s:specs['MarkdownCOde']   = 'fg=blue'

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
let s:specs['TSProperty']        = 'fg=yellow'
let s:specs['TSTagDelimiter']    = 'fg=brown'
let s:specs['TSInclude']         = 'fg=blue'
let s:specs['TSNamespace']       = 'fg=yellow'
let s:specs['TSPunctDelimiter']  = 'fg=foreground'
let s:specs['TSPunctBracket']    = 'fg=foreground'
let s:specs['TSPunctSpecial']    = 'fg=red'
let s:specs['TSAnnotation']      = 'fg=red bold'
let s:specs['TSAttribute']       = 'fg=yellow bold'
let s:specs['TSFuncMacro']       = 'fg=blue'
let s:specs['TSConstMacro']      = 'fg=aqua bold'
let s:specs['TSVariableBuiltIn'] = 'fg=foreground'

" RUST 
let s:specs['RustTSPunctDelimiter']  = 'fg=fg3'
let s:specs['RustTSKeywordOperator'] = 'fg=red'

" TOML 
let s:specs['tomlTSTypeBuiltin']  = 'fg=red bold'
let s:specs['tomlTSProperty']     = 'fg=blue nocombine'

" NEOGIT 
hi link NeogitDiffAddHighlight DiffAdd
hi link NeogitDiffDeleteHighlight DiffDelete
hi link NeogitDiffContextHighlight Keyword
hi link NeogitHunkHeader Constant
hi link NeogitHunkHeaderHighlight Statusline
hi link NeogitDiffContextHighlight Normal

" LSP
hi link LspDiagnosticsDefaultError ErrorMsg
hi link LspDiagnosticsDefaultWarning WarningMsg
hi link LspDiagnosticsDefaultInformation MoreMsg
hi link LspDiagnosticsDefaultHint MoreMsg

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
  let g:terminal_color_1  = g:base16_hex_colors['red']     " red
  let g:terminal_color_2  = g:base16_hex_colors['green']   " green
  let g:terminal_color_3  = g:base16_hex_colors['yellow']  " yellow
  let g:terminal_color_4  = g:base16_hex_colors['blue']    " blue
  let g:terminal_color_5  = g:base16_hex_colors['purple']  " magenta
  let g:terminal_color_6  = g:base16_hex_colors['aqua']    " cyan
  let g:terminal_color_7  = g:base16_hex_colors['fg2']  " light grey
  let g:terminal_color_8  = g:base16_hex_colors['bg2']   " dark grey
  let g:terminal_color_9  = g:base16_hex_colors['orange']  " light red
  let g:terminal_color_10 = g:base16_hex_colors['green']   " light green
  let g:terminal_color_11 = g:base16_hex_colors['brown']   " light yellow
  let g:terminal_color_12 = g:base16_hex_colors['blue']    " light blue
  let g:terminal_color_13 = g:base16_hex_colors['purple']  " light magenta
  let g:terminal_color_14 = g:base16_hex_colors['aqua']    " light cyan
  let g:terminal_color_15 = g:base16_hex_colors['foreground']   " fg
endif

