
" This is the function that implements the Base16Highlight command.
function! base16#highlight(bang, group, ...)
  if !exists('g:base16_hex_colors')
    echohl ErrorMsg
    echomsg 'You must apply a base16 colorscheme before using Base16Highlight'
    echohl None
    return
  endif
  let l:fg = 0
  let l:bg = 0
  let l:sp = 0
  let l:attrs = []
  for l:arg in a:000
    if l:arg =~? '^fg='
      let l:fg = 1
      let [l:gui] = s:Color(l:arg[3:])
      execute 'highlight' a:group 'guifg='.l:gui
    elseif l:arg =~? '^bg='
      let l:bg = 1
      let [l:gui] = s:Color(l:arg[3:])
      execute 'highlight' a:group 'guibg='.l:gui
    elseif l:arg =~? '^sp='
      let l:sp = 1
      let [l:gui] = s:Color(l:arg[3:])
      execute 'highlight' a:group 'guisp='.l:gui
    else
      call add(l:attrs, l:arg)
    endif
  endfor
  if l:fg == 0 && a:bang
    execute 'highlight' a:group 'guifg=NONE'
  endif
  if l:bg == 0 && a:bang
    execute 'highlight' a:group 'guibg=NONE'
  endif
  if l:sp == 0 && a:bang
    execute 'highlight' a:group 'guisp=NONE'
  endif
  if len(l:attrs) > 0
    execute 'highlight' a:group 'gui='.join(l:attrs, ',')
  elseif a:bang
    execute 'highlight' a:group 'gui=NONE'
  endif
endfunction

function! s:Color(color)
  try
    return [g:base16_hex_colors[a:color]]
  catch /E716:/
    echohl ErrorMsg
    echomsg 'unrecognized color:' a:color
    echohl None
    return [g:base16_hex_colors['white']]
  endtry
endfunction

