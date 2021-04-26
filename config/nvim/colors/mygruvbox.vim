
highlight clear
if exists('syntax_on')
  syntax reset
endif
set background=dark
let g:colors_name = 'mygruvbox'
let g:base16_hex_colors = {
      \ 'black':  '#1d2021',
      \ 'dark3':  '#282828',
      \ 'dark2':  '#3c3836',
      \ 'dark1':  '#504945',
      \ 'light1': '#5e5a55',
      \ 'light2': '#6b6761',
      \ 'light3': '#78746d',
      \ 'white':  '#928e87',
      \ 'red':    '#e08589',
      \ 'orange': '#c0660c',
      \ 'yellow': '#d79921',
      \ 'green':  '#98971a',
      \ 'blue':   '#458588',
      \ 'aqua':   '#689d6a',
      \ 'purple': '#9b7892',
      \ 'brown':  '#AB7967'}

let g:base16_cterm_colors = {
      \ 'black':  0,
      \ 'dark3':  18,
      \ 'dark2':  19,
      \ 'dark1':  8,
      \ 'light1': 20,
      \ 'light2': 7,
      \ 'light3': 21,
      \ 'white':  15,
      \ 'red':    1,
      \ 'orange': 16,
      \ 'yellow': 3,
      \ 'green':  2,
      \ 'aqua':   6,
      \ 'blue':   4,
      \ 'purple': 5,
      \ 'brown':  17}

for s:dict in [g:base16_hex_colors, g:base16_cterm_colors]
  if &background == 'dark'
    let s:dict['base'] = s:dict['black']
    let s:dict['similar3'] = s:dict['dark3']
    let s:dict['similar2'] = s:dict['dark2']
    let s:dict['similar1'] = s:dict['dark1']
    let s:dict['contrast1'] = s:dict['light1']
    let s:dict['contrast2'] = s:dict['light2']
    let s:dict['contrast3'] = s:dict['light3']
    let s:dict['antibase'] = s:dict['white']
  else
    let s:dict['base'] = s:dict['white']
    let s:dict['similar3'] = s:dict['light3']
    let s:dict['similar2'] = s:dict['light2']
    let s:dict['similar1'] = s:dict['light1']
    let s:dict['contrast1'] = s:dict['dark1']
    let s:dict['contrast2'] = s:dict['dark2']
    let s:dict['contrast3'] = s:dict['dark3']
    let s:dict['antibase'] = s:dict['black']
  endif
endfor
unlet s:dict

command! -bang -nargs=+ Base16Highlight call base16#highlight(<q-bang>=='!', <f-args>)

let s:specs = {}

if get(g:, 'base16_transparent_background', 0)
  let s:specs['Normal'] = 'fg=antibase'
else
  let s:specs['Normal'] = 'fg=antibase bg=base'
endif

" DEFAULTS
let s:specs['Comment']           = 'fg=contrast1'
let s:specs['Constant']          = 'fg=antibase'
let s:specs['String']            = 'fg=green'
let s:specs['Character']         = 'fg=green'
let s:specs['Identifier']        = 'fg=antibase'
let s:specs['Function']          = 'fg=blue'
let s:specs['Statement']         = 'fg=purple'
let s:specs['PreProc']           = 'fg=purple'
let s:specs['Type']              = 'fg=antibase'
let s:specs['Special']           = 'fg=yellow'
let s:specs['SpecialChar']       = 'fg=green bold'
let s:specs['Underlined']        = 'fg=blue underline'
let s:specs['Ignore']            = 'fg=bg'
let s:specs['Error']             = 'fg=red bg=black bold reverse'
let s:specs['Todo']              = 'fg=orange bg=black bold reverse'
let s:specs['Delimiter']         = 'fg=antibase'
let s:specs['StorageClass']      = 'fg=antibase'
let s:specs['Operator']          = 'fg=antibase'
let s:specs['TSAnnotation']      = 'fg=red bold'
let s:specs['TSAttribute']       = 'fg=yellow bold'
let s:specs['TSFuncMacro']       = 'fg=blue'
let s:specs['TSConstMacro']      = 'fg=aqua bold'
let s:specs['TSVariableBuiltIn'] = 'fg=antibase'
let s:specs['Include']           = 'fg=antibase'

" REST  
let s:specs['SpecialKey']   = 'fg=similar1 bold'
let s:specs['NonText']      = 'fg=similar2'
let s:specs['Conceal']      = 'fg=contrast1 bg=similar3'
let s:specs['MatchParen']   = 'fg=aqua bold'
let s:specs['NormalFloat']  = 'bg=similar3'

" MESSAGES, QUESTIONS, AND PROMPTS
let s:specs['ModeMsg']     = 'bold'
let s:specs['MoreMsg']     = 'fg=aqua'
let s:specs['WarningMsg']  = 'fg=yellow'
let s:specs['ErrorMsg']    = 'fg=red'
let s:specs['Question']    = 'fg=aqua bold'
let s:specs['Title']       = 'fg=blue bold'

" SEARCH, COMPLETION, AND OTHER NVIM NAVIGATION
let s:specs['IncSearch']  = 'fg=orange bg=black reverse'
let s:specs['Search']     = 'fg=yellow bg=black reverse'
let s:specs['WildMenu']   = 'fg=yellow bg=black reverse'
let s:specs['Directory']  = 'fg=aqua'

" DIFF
let s:specs['DiffAdd']     = 'fg=green bg=similar3 bold'
let s:specs['DiffChange']  = 'fg=yellow bg=similar3 sp=yellow bold'
let s:specs['DiffDelete']  = 'fg=red bg=similar3 bold'
let s:specs['DiffText']    = 'fg=blue bg=similar3 sp=blue bold'

" SPELLING
let s:specs['SpellBad']   = 'undercurl sp=red'
let s:specs['SpellCap']   = 'undercurl sp=blue'
let s:specs['SpellRare']  = 'undercurl sp=purple'
let s:specs['SpellLocal'] = 'undercurl sp=aqua'

" POPUP MENU
let s:specs['Pmenu']      = 'fg=contrast3 bg=similar3'
let s:specs['PmenuSel']   = 'fg=similar3 bold bg=contrast3'
let s:specs['PmenuSbar']  = 'bg=dark3'
let s:specs['PmenuThumb'] = 'bg=white'
" let s:specs['Pmenu']      = 'fg=light3 bg=similar3'
" let s:specs['PmenuSel']   = 'fg=base bold bg=light3'
" let s:specs['PmenuSbar']  = 'bg=dark3'
" let s:specs['PmenuThumb'] = 'bg=white'

" INTERFACE COMPONENTS.
let s:specs['LineNr']        = 'fg=similar2'
let s:specs['CursorLineNr']  = 'fg=white bg=similar3'
let s:specs['CursorLine']    = 'bg=similar3 sp=contrast2'
let s:specs['CursorColumn']  = 'bg=similar3'
let s:specs['Visual']        = 'bg=similar2'
let s:specs['StatusLine']    = 'fg=contrast2 bg=similar3 reverse bold'
let s:specs['StatusLineNC']  = 'fg=similar1 bg=similar3 reverse bold'
let s:specs['VertSplit']     = 'fg=similar1'
let s:specs['TabLine']       = 'fg=similar1 bg=similar3'
let s:specs['TabLineSel']    = 'fg=similar2 bg=contrast3 reverse bold'
let s:specs['TabLineFill']   = 'fg=similar1 bg=similar3'
let s:specs['ColorColumn']   = 'bg=orange'
let s:specs['SignColumn']    = 'fg=contrast1'
let s:specs['Folded']        = 'fg=contrast1 bg=similar3 underline bold'
let s:specs['FoldColumn']    = 'fg=contrast1 bg=similar3'
let s:specs['Cursor']        = 'reverse'
let s:specs['TermCursor']    = 'reverse'
highlight link TermCursor Cursor
highlight link lCursor Cursor

" GITSIGNS
let s:specs['GitSignsAdd']      = 'fg=green'
let s:specs['GitSignsChange']   = 'fg=yellow'
let s:specs['GitSignsDelete']   = 'fg=red'

" TELESCOPE
let s:specs['TelescopeNormal']         = 'fg=similar1'
let s:specs['TelescopeSelection']      = 'fg=antibase bold bg=similar3'
let s:specs['GitSignsSelectionCaret']  = 'fg=antibase'
let s:specs['TelescopeMatching']       = 'fg=orange bold'

" YAML 
let s:specs['yamlTSField']   = 'fg=aqua'

" TREESITTER 
let s:specs['TSProperty']   = 'fg=yellow'
let s:specs['TSTagDelimiter']   = 'fg=blue'
let s:specs['TSPunctSpecial']   = 'fg=red'

" LSP
highlight link LspDiagnosticsDefaultError ErrorMsg
highlight link LspDiagnosticsDefaultWarning WarningMsg
highlight link LspDiagnosticsDefaultInformation MoreMsg
highlight link LspDiagnosticsDefaultHint MoreMsg

" Application ----------------------------------------------------------------
if exists('g:base16_color_overrides')
  call extend(s:specs, g:base16_color_overrides, 'force')
endif

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
  let g:terminal_color_0  = g:base16_hex_colors['black']   " black
  let g:terminal_color_1  = g:base16_hex_colors['red']     " red
  let g:terminal_color_2  = g:base16_hex_colors['green']   " green
  let g:terminal_color_3  = g:base16_hex_colors['yellow']  " yellow
  let g:terminal_color_4  = g:base16_hex_colors['blue']    " blue
  let g:terminal_color_5  = g:base16_hex_colors['purple']  " magenta
  let g:terminal_color_6  = g:base16_hex_colors['aqua']    " cyan
  let g:terminal_color_7  = g:base16_hex_colors['light2']  " light grey
  let g:terminal_color_8  = g:base16_hex_colors['dark2']   " dark grey
  let g:terminal_color_9  = g:base16_hex_colors['orange']  " light red
  let g:terminal_color_10 = g:base16_hex_colors['green']   " light green
  let g:terminal_color_11 = g:base16_hex_colors['brown']   " light yellow
  let g:terminal_color_12 = g:base16_hex_colors['blue']    " light blue
  let g:terminal_color_13 = g:base16_hex_colors['purple']  " light magenta
  let g:terminal_color_14 = g:base16_hex_colors['aqua']    " light cyan
  let g:terminal_color_15 = g:base16_hex_colors['white']   " white
endif

