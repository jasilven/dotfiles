vim.api.nvim_exec([[
    function! GetColor(color)
      if a:color =~? '^\(bg\|fg\|background\|foreground\|none\)$'
        return [a:color, a:color]
      endif
      try
        return [g:base16_hex_colors[a:color], g:base16_cterm_colors[a:color]]
      catch
        echohl ErrorMsg
        echomsg 'unrecognized color:' a:color
        echohl None
        return [g:base16_hex_colors['white'], g:base16_cterm_colors['white']]
      endtry
    endfunction

    function! Highlight(bang, group, ...)
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
          let [l:gui, l:cterm] = GetColor(l:arg[3:])
          execute 'highlight' a:group 'guifg='.l:gui
          if !has('termguicolors') || !&termguicolors
            execute 'highlight' a:group 'ctermfg='.l:cterm
          endif
        elseif l:arg =~? '^bg='
          let l:bg = 1
          let [l:gui, l:cterm] = GetColor(l:arg[3:])
          execute 'highlight' a:group 'guibg='.l:gui
          if !has('termguicolors') || !&termguicolors
            execute 'highlight' a:group 'ctermbg='.l:cterm
          endif
        elseif l:arg =~? '^sp='
          let l:sp = 1
          let [l:gui, l:cterm] = GetColor(l:arg[3:])
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

    command! -bang -nargs=+ Highlight call Highlight(<q-bang>=='!', <f-args>)
]], "")
