" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/e103270/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/e103270/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/e103270/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/e103270/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/e103270/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["any-jump.vim"] = {
    config = { "\27LJ\2\nÍ\1\0\0\a\0\n\2\0185\0\0\0006\1\1\0009\1\2\1*\2\0\0=\2\3\0016\1\1\0009\1\2\1*\2\1\0=\2\4\0016\1\1\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0'\5\t\0\18\6\0\0B\1\5\1K\0\1\0\17:AnyJump<cr>\r<space>j\6n\20nvim_set_keymap\bapi!any_jump_window_height_ratio any_jump_window_width_ratio\6g\bvim\1\0\3\fnoremap\2\vnowait\2\vsilent\2µÊÃô\19ô≥¶ˇ\3ÁÃô≥\6≥ÊÃ˛\3\0" },
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/any-jump.vim"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n‘\2\0\0\a\0\r\00025\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\a\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\b\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\t\0'\5\n\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\v\0'\5\n\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\f\0'\5\n\0\18\6\0\0B\1\5\1K\0\1\0\n<M-h>\r<C-left>\24:BufferPrevious<CR>\n<C-h>\n<M-l>\14<C-right>\20:BufferNext<CR>\n<C-l>\6n\20nvim_set_keymap\bapi\bvim\1\0\3\fnoremap\2\vnowait\2\vsilent\2\0" },
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["completion-nvim"] = {
    config = { "\27LJ\2\nm\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\5;autocmd BufEnter * lua require'completion'.on_attach()\14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["diagnostic-nvim"] = {
    config = { "\27LJ\2\nÃ\1\0\0\5\0\b\0\0146\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\1\0019\1\4\0016\3\0\0009\3\1\0039\3\5\0039\3\6\0035\4\a\0B\1\3\2=\1\3\0K\0\1\0\1\0\4\nsigns\2\17virtual_text\2\14underline\2\21update_in_insert\1\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\blsp\bvim\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/opt/diagnostic-nvim"
  },
  fzf = {
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\nÈ\18\0\0\a\0\22\00085\0\0\0006\1\1\0009\1\2\1)\2\1\0=\2\3\0016\1\1\0009\1\2\1'\2\5\0=\2\4\0016\1\1\0009\1\6\0019\1\a\1'\3\b\0'\4\t\0'\5\n\0\18\6\0\0B\1\5\0016\1\1\0009\1\6\0019\1\a\1'\3\b\0'\4\v\0'\5\f\0\18\6\0\0B\1\5\0016\1\1\0009\1\6\0019\1\a\1'\3\b\0'\4\r\0'\5\14\0\18\6\0\0B\1\5\0016\1\1\0009\1\6\0019\1\a\1'\3\b\0'\4\15\0'\5\16\0\18\6\0\0B\1\5\0016\1\1\0009\1\6\0019\1\a\1'\3\b\0'\4\17\0'\5\18\0\18\6\0\0B\1\5\0016\1\1\0009\1\6\0019\1\19\1'\3\20\0'\4\21\0B\1\3\1K\0\1\0\5Î\14\t\t\t\tau FileType fzf tnoremap <buffer> jk jk\n\t\t\t\tau FileType fzf tmap <buffer> <Esc> <c-g>\n\t\t\t\tau FileType fzf imap <buffer> <Esc> <c-g>\n\t\t\t\tau FileType fzf tmap <buffer> <C-j> <Down>\n\t\t\t\tau FileType fzf tmap <buffer> <Tab> <Down>\n\t\t\t\tau FileType fzf tmap <buffer> <S-Tab> <Up>\n\t\t\t\tau FileType fzf set laststatus=0 noshowmode\n\t\t\t\tau FileType fzf set laststatus=0\n\t\t\t\tau BufEnter term://*fzf* startinsert\n\t\t\t\tau BufLeave term://*fzf*  set laststatus=2\n\t\t\t\tcommand! -bang -nargs=* MyRgHome call fzf#vim#grep('rg -- '.shellescape(<q-args>).' ~', 1, fzf#vim#with_preview({'options': ['--preview-window=right:50%']}), <bang>0)\n\t\t\t\tcommand! -bang -nargs=* MyRgHomeOld call fzf#vim#grep('rg --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>).' ~', 1, fzf#vim#with_preview({'options': ['--preview-window=right:50%']}), <bang>0)\n\t\t\t\tcommand! -bang -nargs=* MyNotes call fzf#vim#grep(\"rg --line-number --no-heading --color=never --smart-case -e '^# ' -- ~/notes | sort -k5 -k4M -k3 -n --reverse | column -t -s\\#\", 1, fzf#vim#with_preview({'options': ['--preview-window=right:50%']}), <bang>0)\n\t\t\t\tlet g:XXfzf_colors = { 'fg+':  ['fg', 'FZF'], 'bg+':  ['bg', 'FZF'], 'hl+':  ['fg', 'FZF'], 'pointer': ['fg', 'FZF'], 'marker': ['fg', 'Comment'], 'fg':  ['fg', 'Normal'], 'bg':  ['bg', 'Normal'], 'hl':  ['fg', 'keyword'], 'info': ['fg', 'Comment'], 'border': ['fg', 'VertSplit'], 'prompt': ['fg', 'Function'], 'spinner': ['fg', 'Label'], 'header': ['fg', 'Comment'],  'gutter': ['bg', 'Normal'],} \n\t\t\t\tlet g:XYfzf_colors = { 'fg+':  ['fg', 'FZF'], 'bg+':  ['bg', 'FZF'], 'hl+':  ['fg', 'FZF'], 'pointer': ['fg', 'FZF'], 'gutter': ['bg', 'Normal'], 'hl': ['fg', 'keyword'], 'header': ['fg', 'Function'], 'info': ['fg', 'Comment'], 'prompt': ['fg', 'Function']} \n\t\t\t\tlet g:fzf_action = { 'ctrl-o': '!xdg-open ', 'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit' }\n\t\t\t\14nvim_exec\18:Commands<cr>\n<M-x>\17:Files ~<CR>\r<space>F\16:BLines<CR>\r<space>l\18:MyRgHome<CR>\r<space>S\f:Rg<CR>\r<space>s\6n\20nvim_set_keymap\bapiK--graph --color always --format='%C(auto)%h%d %s %C(black)%C(bold)%cr'\28fzf_commits_log_options\21fzf_buffers_jump\6g\bvim\1\0\3\fnoremap\2\vnowait\2\vsilent\2\0" },
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\ne\0\0\4\0\6\0\0146\0\0\0006\2\1\0009\2\2\0029\2\3\2B\2\1\0A\0\0\2\v\0\0\0X\0\3Ä'\0\4\0L\0\2\0X\0\2Ä'\0\5\0L\0\2\0K\0\1\0\f‚úî lsp\5\20buf_get_clients\blsp\bvim\tnextŒ\3\1\0\t\0\27\0%3\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\21\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0044\5\3\0005\6\t\0>\6\1\0055\6\n\0005\a\f\0005\b\v\0=\b\r\a>\a\2\6>\6\2\5=\5\14\0045\5\15\0004\6\3\0>\0\1\6>\6\1\5=\5\16\0045\5\17\0=\5\18\0045\5\19\0=\5\20\4=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\3B\1\2\1K\0\1\0\foptions\1\0\3\ntheme\tnord\25component_separators\5\23section_separators\5\15extensions\1\2\0\0\bfzf\rsections\1\0\0\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\4\0\0\5\5\rencoding\14lualine_x\1\3\0\0\0\rfiletype\14lualine_c\fsources\1\0\0\1\2\0\0\rnvim_lsp\1\2\0\0\16diagnostics\1\2\1\0\rfilename\14full_path\2\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\nsetup\flualine\frequire\0\0" },
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  neoformat = {
    commands = { "Neoformat" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/opt/neoformat"
  },
  neoterm = {
    config = { "\27LJ\2\n…\a\0\0\a\0\18\0,5\0\0\0006\1\1\0009\1\2\1)\2\25\0=\2\3\0016\1\1\0009\1\2\1)\2\1\0=\2\4\0016\1\1\0009\1\2\1'\2\6\0=\2\5\0016\1\1\0009\1\a\0019\1\b\1'\3\t\0'\4\n\0'\5\v\0\18\6\0\0B\1\5\0016\1\1\0009\1\a\0019\1\b\1'\3\f\0'\4\n\0'\5\r\0\18\6\0\0B\1\5\0016\1\1\0009\1\a\0019\1\b\1'\3\14\0'\4\n\0'\5\r\0\18\6\0\0B\1\5\0016\1\1\0009\1\a\0019\1\15\1'\3\16\0'\4\17\0B\1\3\1K\0\1\0\5À\4\t\t\tau TermOpen * setlocal nonumber \n\t\t\tau FileType neoterm nnoremap <silent> <buffer> <C-j> <C-\\><C-N><C-w><C-p>:Tclose<cr>\n\t\t\tau FileType neoterm nnoremap <silent> <buffer> q <C-\\><C-N><C-w><C-p>:Tclose<cr>\n\t\t\tau FileType neoterm tnoremap <silent> <buffer> <C-h> <C-\\><C-N><C-\\><C-N>:BufferPrevious<cr>\n\t\t\tau FileType neoterm tnoremap <silent> <buffer> <C-l> <C-\\><C-N><C-\\><C-N>:BufferNext<cr>\n\t\t\tau FileType neoterm tnoremap <silent> <buffer> <C-q> <C-\\><C-N><C-w><C-p>:Tclose<cr>\n\t\t\tau FileType neoterm tnoremap <Esc> <c-\\><c-n>\n\t\t\tau FileType neoterm tnoremap jk <c-\\><c-n>\n\t\t\t\14nvim_exec\6t.<C-\\><C-N><C-w><C-p>:botright Ttoggle<cr>\6i\26:botright Ttoggle<cr>\n<C-j>\6n\20nvim_set_keymap\bapi\rbotright\24neoterm_default_mod\23neoterm_autoinsert\17neoterm_size\6g\bvim\1\0\3\fnoremap\2\vnowait\2\vsilent\2\0" },
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/neoterm"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    after = { "diagnostic-nvim", "nvim-lsputils" },
    only_config = true
  },
  ["nvim-lsputils"] = {
    config = { "\27LJ\2\nﬁ\5\0\0\4\0\23\0I6\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\5\0B\1\2\0029\1\6\1=\1\3\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\5\0B\1\2\0029\1\6\1=\1\3\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\t\1=\1\a\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\v\1=\1\n\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\r\1=\1\f\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\15\1=\1\14\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\17\1=\1\16\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\20\1=\1\18\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\22\1=\1\21\0K\0\1\0\22workspace_handler\21workspace/symbol\21document_handler\20lsputil.symbols textDocument/documentSymbol\27implementation_handler textDocument/implementation\27typeDefinition_handler textDocument/typeDefinition\24declaration_handler\29textDocument/declaration\23definition_handler\28textDocument/definition\23references_handler\22lsputil.locations\28textDocument/references\24code_action_handler\23lsputil.codeAction\frequire\28textDocument/codeAction\rhandlers\blsp\bvim\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/opt/nvim-lsputils"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n‚\3\0\0\6\0\27\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0005\5\14\0=\5\15\4=\4\16\0035\4\17\0=\4\18\3=\3\19\0025\3\22\0005\4\20\0005\5\21\0=\5\15\4=\4\23\3=\3\24\0025\3\25\0=\3\26\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\16textobjects\vselect\1\0\0\1\0\1\aaf\20@function.outer\1\0\1\venable\2\rrefactor\15navigation\1\0\1\venable\1\17smart_rename\fkeymaps\1\0\1\17smart_rename\t<f3>\1\0\1\venable\2\28highlight_current_scope\1\0\1\venable\1\26highlight_definitions\1\0\0\1\0\1\venable\2\26incremental_selection\1\0\1\venable\1\14highlight\1\0\1\21ensure_installed\15maintained\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÎ\5\0\0\t\0!\0E5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\a\0'\5\b\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\t\0'\5\n\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\v\0'\5\f\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\r\0'\5\14\0\18\6\0\0B\1\5\0016\1\15\0'\3\16\0B\1\2\0026\2\15\0'\4\17\0B\2\2\0029\2\18\0025\4\31\0005\5\19\0005\6\27\0005\a\21\0009\b\20\1=\b\22\a9\b\23\1=\b\24\a9\b\25\1=\b\26\a=\a\28\0065\a\29\0009\b\20\1=\b\22\a9\b\23\1=\b\24\a=\a\4\6=\6\30\5=\5 \4B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<esc>\nclose\r<PageUp>\25preview_scrolling_up\15<PageDown>\1\0\0\27preview_scrolling_down\1\0\4\20selection_caret\t‚ñ∂ \18prompt_prefix\a> \20prompt_position\vbottom\17shorten_path\1\nsetup\14telescope\22telescope.actions\frequire(:Telescope lsp_document_symbols<CR>\r<space>i\27:Telescope buffers<CR>\r<space>b\28:Telescope oldfiles<CR>\r<space>h :Telescope file_browser<CR>\r<space>n\30:Telescope find_files<CR>\r<space>f\6n\20nvim_set_keymap\bapi\bvim\1\0\3\fnoremap\2\vnowait\2\vsilent\2\0" },
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-easymotion"] = {
    config = { "\27LJ\2\nÆ\1\0\0\6\0\n\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\vnowait\2\28<Plug>(easymotion-bd-f)\6f\6n\20nvim_set_keymap\bapi\30abcdefghijklmnopqrstuvwxy\20EasyMotion_keys\6g\bvim\0" },
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/vim-lastplace"
  },
  ["vim-rooter"] = {
    config = { "\27LJ\2\nﬂ\1\0\0\2\0\a\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0K\0\1\0\1\b\0\0\16project.clj\rdeps.edn\vgo.mod\17package.json\14build.sbt\fpom.xml\t.git\20rooter_patterns\24rooter_silent_chdir\fcurrent2rooter_change_directory_for_non_project_files\6g\bvim\0" },
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-signify"] = {
    config = { "\27LJ\2\nc\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0K\0\1\0\31signify_disable_by_default\27signify_line_highlight\6g\bvim\0" },
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-toml"] = {
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/vim-toml"
  }
}

-- Config for: barbar.nvim
try_loadstring("\27LJ\2\n‘\2\0\0\a\0\r\00025\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\a\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\b\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\t\0'\5\n\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\v\0'\5\n\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\f\0'\5\n\0\18\6\0\0B\1\5\1K\0\1\0\n<M-h>\r<C-left>\24:BufferPrevious<CR>\n<C-h>\n<M-l>\14<C-right>\20:BufferNext<CR>\n<C-l>\6n\20nvim_set_keymap\bapi\bvim\1\0\3\fnoremap\2\vnowait\2\vsilent\2\0", "config", "barbar.nvim")
-- Config for: fzf.vim
try_loadstring("\27LJ\2\nÈ\18\0\0\a\0\22\00085\0\0\0006\1\1\0009\1\2\1)\2\1\0=\2\3\0016\1\1\0009\1\2\1'\2\5\0=\2\4\0016\1\1\0009\1\6\0019\1\a\1'\3\b\0'\4\t\0'\5\n\0\18\6\0\0B\1\5\0016\1\1\0009\1\6\0019\1\a\1'\3\b\0'\4\v\0'\5\f\0\18\6\0\0B\1\5\0016\1\1\0009\1\6\0019\1\a\1'\3\b\0'\4\r\0'\5\14\0\18\6\0\0B\1\5\0016\1\1\0009\1\6\0019\1\a\1'\3\b\0'\4\15\0'\5\16\0\18\6\0\0B\1\5\0016\1\1\0009\1\6\0019\1\a\1'\3\b\0'\4\17\0'\5\18\0\18\6\0\0B\1\5\0016\1\1\0009\1\6\0019\1\19\1'\3\20\0'\4\21\0B\1\3\1K\0\1\0\5Î\14\t\t\t\tau FileType fzf tnoremap <buffer> jk jk\n\t\t\t\tau FileType fzf tmap <buffer> <Esc> <c-g>\n\t\t\t\tau FileType fzf imap <buffer> <Esc> <c-g>\n\t\t\t\tau FileType fzf tmap <buffer> <C-j> <Down>\n\t\t\t\tau FileType fzf tmap <buffer> <Tab> <Down>\n\t\t\t\tau FileType fzf tmap <buffer> <S-Tab> <Up>\n\t\t\t\tau FileType fzf set laststatus=0 noshowmode\n\t\t\t\tau FileType fzf set laststatus=0\n\t\t\t\tau BufEnter term://*fzf* startinsert\n\t\t\t\tau BufLeave term://*fzf*  set laststatus=2\n\t\t\t\tcommand! -bang -nargs=* MyRgHome call fzf#vim#grep('rg -- '.shellescape(<q-args>).' ~', 1, fzf#vim#with_preview({'options': ['--preview-window=right:50%']}), <bang>0)\n\t\t\t\tcommand! -bang -nargs=* MyRgHomeOld call fzf#vim#grep('rg --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>).' ~', 1, fzf#vim#with_preview({'options': ['--preview-window=right:50%']}), <bang>0)\n\t\t\t\tcommand! -bang -nargs=* MyNotes call fzf#vim#grep(\"rg --line-number --no-heading --color=never --smart-case -e '^# ' -- ~/notes | sort -k5 -k4M -k3 -n --reverse | column -t -s\\#\", 1, fzf#vim#with_preview({'options': ['--preview-window=right:50%']}), <bang>0)\n\t\t\t\tlet g:XXfzf_colors = { 'fg+':  ['fg', 'FZF'], 'bg+':  ['bg', 'FZF'], 'hl+':  ['fg', 'FZF'], 'pointer': ['fg', 'FZF'], 'marker': ['fg', 'Comment'], 'fg':  ['fg', 'Normal'], 'bg':  ['bg', 'Normal'], 'hl':  ['fg', 'keyword'], 'info': ['fg', 'Comment'], 'border': ['fg', 'VertSplit'], 'prompt': ['fg', 'Function'], 'spinner': ['fg', 'Label'], 'header': ['fg', 'Comment'],  'gutter': ['bg', 'Normal'],} \n\t\t\t\tlet g:XYfzf_colors = { 'fg+':  ['fg', 'FZF'], 'bg+':  ['bg', 'FZF'], 'hl+':  ['fg', 'FZF'], 'pointer': ['fg', 'FZF'], 'gutter': ['bg', 'Normal'], 'hl': ['fg', 'keyword'], 'header': ['fg', 'Function'], 'info': ['fg', 'Comment'], 'prompt': ['fg', 'Function']} \n\t\t\t\tlet g:fzf_action = { 'ctrl-o': '!xdg-open ', 'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit' }\n\t\t\t\14nvim_exec\18:Commands<cr>\n<M-x>\17:Files ~<CR>\r<space>F\16:BLines<CR>\r<space>l\18:MyRgHome<CR>\r<space>S\f:Rg<CR>\r<space>s\6n\20nvim_set_keymap\bapiK--graph --color always --format='%C(auto)%h%d %s %C(black)%C(bold)%cr'\28fzf_commits_log_options\21fzf_buffers_jump\6g\bvim\1\0\3\fnoremap\2\vnowait\2\vsilent\2\0", "config", "fzf.vim")
-- Config for: nvim-treesitter
try_loadstring("\27LJ\2\n‚\3\0\0\6\0\27\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0005\5\14\0=\5\15\4=\4\16\0035\4\17\0=\4\18\3=\3\19\0025\3\22\0005\4\20\0005\5\21\0=\5\15\4=\4\23\3=\3\24\0025\3\25\0=\3\26\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\16textobjects\vselect\1\0\0\1\0\1\aaf\20@function.outer\1\0\1\venable\2\rrefactor\15navigation\1\0\1\venable\1\17smart_rename\fkeymaps\1\0\1\17smart_rename\t<f3>\1\0\1\venable\2\28highlight_current_scope\1\0\1\venable\1\26highlight_definitions\1\0\0\1\0\1\venable\2\26incremental_selection\1\0\1\venable\1\14highlight\1\0\1\21ensure_installed\15maintained\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
-- Config for: completion-nvim
try_loadstring("\27LJ\2\nm\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\5;autocmd BufEnter * lua require'completion'.on_attach()\14nvim_exec\bapi\bvim\0", "config", "completion-nvim")
-- Config for: any-jump.vim
try_loadstring("\27LJ\2\nÍ\1\0\0\a\0\n\2\0185\0\0\0006\1\1\0009\1\2\1*\2\0\0=\2\3\0016\1\1\0009\1\2\1*\2\1\0=\2\4\0016\1\1\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0'\5\t\0\18\6\0\0B\1\5\1K\0\1\0\17:AnyJump<cr>\r<space>j\6n\20nvim_set_keymap\bapi!any_jump_window_height_ratio any_jump_window_width_ratio\6g\bvim\1\0\3\fnoremap\2\vnowait\2\vsilent\2µÊÃô\19ô≥¶ˇ\3ÁÃô≥\6≥ÊÃ˛\3\0", "config", "any-jump.vim")
-- Config for: nvim-autopairs
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
-- Config for: lualine.nvim
try_loadstring("\27LJ\2\ne\0\0\4\0\6\0\0146\0\0\0006\2\1\0009\2\2\0029\2\3\2B\2\1\0A\0\0\2\v\0\0\0X\0\3Ä'\0\4\0L\0\2\0X\0\2Ä'\0\5\0L\0\2\0K\0\1\0\f‚úî lsp\5\20buf_get_clients\blsp\bvim\tnextŒ\3\1\0\t\0\27\0%3\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\21\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0044\5\3\0005\6\t\0>\6\1\0055\6\n\0005\a\f\0005\b\v\0=\b\r\a>\a\2\6>\6\2\5=\5\14\0045\5\15\0004\6\3\0>\0\1\6>\6\1\5=\5\16\0045\5\17\0=\5\18\0045\5\19\0=\5\20\4=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\3B\1\2\1K\0\1\0\foptions\1\0\3\ntheme\tnord\25component_separators\5\23section_separators\5\15extensions\1\2\0\0\bfzf\rsections\1\0\0\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\4\0\0\5\5\rencoding\14lualine_x\1\3\0\0\0\rfiletype\14lualine_c\fsources\1\0\0\1\2\0\0\rnvim_lsp\1\2\0\0\16diagnostics\1\2\1\0\rfilename\14full_path\2\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\nsetup\flualine\frequire\0\0", "config", "lualine.nvim")
-- Config for: neoterm
try_loadstring("\27LJ\2\n…\a\0\0\a\0\18\0,5\0\0\0006\1\1\0009\1\2\1)\2\25\0=\2\3\0016\1\1\0009\1\2\1)\2\1\0=\2\4\0016\1\1\0009\1\2\1'\2\6\0=\2\5\0016\1\1\0009\1\a\0019\1\b\1'\3\t\0'\4\n\0'\5\v\0\18\6\0\0B\1\5\0016\1\1\0009\1\a\0019\1\b\1'\3\f\0'\4\n\0'\5\r\0\18\6\0\0B\1\5\0016\1\1\0009\1\a\0019\1\b\1'\3\14\0'\4\n\0'\5\r\0\18\6\0\0B\1\5\0016\1\1\0009\1\a\0019\1\15\1'\3\16\0'\4\17\0B\1\3\1K\0\1\0\5À\4\t\t\tau TermOpen * setlocal nonumber \n\t\t\tau FileType neoterm nnoremap <silent> <buffer> <C-j> <C-\\><C-N><C-w><C-p>:Tclose<cr>\n\t\t\tau FileType neoterm nnoremap <silent> <buffer> q <C-\\><C-N><C-w><C-p>:Tclose<cr>\n\t\t\tau FileType neoterm tnoremap <silent> <buffer> <C-h> <C-\\><C-N><C-\\><C-N>:BufferPrevious<cr>\n\t\t\tau FileType neoterm tnoremap <silent> <buffer> <C-l> <C-\\><C-N><C-\\><C-N>:BufferNext<cr>\n\t\t\tau FileType neoterm tnoremap <silent> <buffer> <C-q> <C-\\><C-N><C-w><C-p>:Tclose<cr>\n\t\t\tau FileType neoterm tnoremap <Esc> <c-\\><c-n>\n\t\t\tau FileType neoterm tnoremap jk <c-\\><c-n>\n\t\t\t\14nvim_exec\6t.<C-\\><C-N><C-w><C-p>:botright Ttoggle<cr>\6i\26:botright Ttoggle<cr>\n<C-j>\6n\20nvim_set_keymap\bapi\rbotright\24neoterm_default_mod\23neoterm_autoinsert\17neoterm_size\6g\bvim\1\0\3\fnoremap\2\vnowait\2\vsilent\2\0", "config", "neoterm")
-- Config for: vim-easymotion
try_loadstring("\27LJ\2\nÆ\1\0\0\6\0\n\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\vnowait\2\28<Plug>(easymotion-bd-f)\6f\6n\20nvim_set_keymap\bapi\30abcdefghijklmnopqrstuvwxy\20EasyMotion_keys\6g\bvim\0", "config", "vim-easymotion")
-- Config for: telescope.nvim
try_loadstring("\27LJ\2\nÎ\5\0\0\t\0!\0E5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\a\0'\5\b\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\t\0'\5\n\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\v\0'\5\f\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\r\0'\5\14\0\18\6\0\0B\1\5\0016\1\15\0'\3\16\0B\1\2\0026\2\15\0'\4\17\0B\2\2\0029\2\18\0025\4\31\0005\5\19\0005\6\27\0005\a\21\0009\b\20\1=\b\22\a9\b\23\1=\b\24\a9\b\25\1=\b\26\a=\a\28\0065\a\29\0009\b\20\1=\b\22\a9\b\23\1=\b\24\a=\a\4\6=\6\30\5=\5 \4B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<esc>\nclose\r<PageUp>\25preview_scrolling_up\15<PageDown>\1\0\0\27preview_scrolling_down\1\0\4\20selection_caret\t‚ñ∂ \18prompt_prefix\a> \20prompt_position\vbottom\17shorten_path\1\nsetup\14telescope\22telescope.actions\frequire(:Telescope lsp_document_symbols<CR>\r<space>i\27:Telescope buffers<CR>\r<space>b\28:Telescope oldfiles<CR>\r<space>h :Telescope file_browser<CR>\r<space>n\30:Telescope find_files<CR>\r<space>f\6n\20nvim_set_keymap\bapi\bvim\1\0\3\fnoremap\2\vnowait\2\vsilent\2\0", "config", "telescope.nvim")
-- Config for: nvim-colorizer.lua
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
-- Config for: vim-rooter
try_loadstring("\27LJ\2\nﬂ\1\0\0\2\0\a\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0K\0\1\0\1\b\0\0\16project.clj\rdeps.edn\vgo.mod\17package.json\14build.sbt\fpom.xml\t.git\20rooter_patterns\24rooter_silent_chdir\fcurrent2rooter_change_directory_for_non_project_files\6g\bvim\0", "config", "vim-rooter")
-- Config for: vim-signify
try_loadstring("\27LJ\2\nc\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0K\0\1\0\31signify_disable_by_default\27signify_line_highlight\6g\bvim\0", "config", "vim-signify")
-- Config for: nvim-lspconfig
try_loadstring("\27LJ\2\nﬁ\r\0\0\a\0002\0ü\0015\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\a\0'\5\b\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\t\0'\5\n\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\v\0'\5\f\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\r\0'\5\14\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\15\0'\5\16\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\17\0'\5\18\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\19\0'\5\20\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\21\0'\5\22\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\23\0'\5\24\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\25\0'\5\26\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\27\0'\5\28\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\29\0'\5\28\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\30\0'\5\31\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4 \0'\5!\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\"\0'\5#\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1$\1'\3%\0'\4&\0B\1\3\0016\1\1\0009\1'\0019\1(\1'\3)\0005\4*\0B\1\3\0016\1\1\0009\1'\0019\1(\1'\3+\0005\4,\0B\1\3\0016\1\1\0009\1'\0019\1(\1'\3-\0005\4.\0B\1\3\0016\1/\0'\0030\0B\1\2\0029\0011\1B\1\1\1K\0\1\0\14on_attach\15completion\frequire\1\0\2\vtexthl\"LspDiagnosticsSignInformation\ttext\bÔÅö\"LspDiagnosticsSignInformation\1\0\2\vtexthl\30LspDiagnosticsSignWarning\ttext\b‚öë\30LspDiagnosticsSignWarning\1\0\2\vtexthl\28LspDiagnosticsSignError\ttext\b‚õî\28LspDiagnosticsSignError\16sign_define\afn\5Aau BufWritePre *.rs lua vim.lsp.buf.formatting_sync({}, 300)\14nvim_exec0<cmd>lua vim.lsp.buf.workspace_symbol()<CR>\t<f8>2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\14<space>el0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\14<space>ep\14<space>en0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\14<space>ee+<cmd>lua vim.lsp.buf.code_action()<CR>\r<space>a*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>=&<cmd>lua vim.lsp.buf.rename()<CR>\t<f2>&<cmd>Telescope lsp_references<cr>\agr<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\n<M-k>6<RightMouse><cmd>lua vim.lsp.buf.hover()<CR><esc>\17<RightMouse>%<cmd>lua vim.lsp.buf.hover()<CR>\6K.<cmd>lua vim.lsp.buf.signature_help()<CR>\ags+<cmd>lua vim.lsp.buf.declaration()<CR>\agD.<cmd>lua vim.lsp.buf.implementation()<CR>\agi*<cmd>lua vim.lsp.buf.definition()<CR>\agd\6n\20nvim_set_keymap\bapi\bvim\1\0\3\fnoremap\2\vnowait\2\vsilent\2î\5\1\0\b\0#\0O3\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0019\1\4\0015\3\5\0=\0\6\0035\4\f\0005\5\n\0005\6\a\0005\a\b\0=\a\t\6=\6\v\5=\5\r\4=\4\14\3B\1\2\0016\1\1\0'\3\2\0B\1\2\0029\1\15\0019\1\4\0015\3\16\0=\0\6\3B\1\2\0016\1\1\0'\3\2\0B\1\2\0029\1\17\0019\1\4\0015\3\18\0=\0\6\3B\1\2\0016\1\1\0'\3\2\0B\1\2\0029\1\19\0019\1\4\0015\3\20\0=\0\6\3B\1\2\0016\1\1\0'\3\2\0B\1\2\0029\1\21\0019\1\4\0015\3\22\0=\0\6\3B\1\2\0016\1\1\0'\3\2\0B\1\2\0029\1\23\0019\1\4\0015\3\24\0=\0\6\3B\1\2\0016\1\25\0009\1\26\0019\1\27\1'\3\28\0B\1\2\2'\2\29\0&\1\2\0016\2\1\0'\4\2\0B\2\2\0029\2\30\0029\2\4\0025\4\31\0=\0\6\0045\5 \0\18\6\1\0'\a!\0&\6\a\6>\6\3\5=\5\"\4B\2\2\1K\0\1\0\bcmd\14/main.lua\1\3\0\0!/usr/bin/lua-language-server\a-E\1\0\0\16sumneko_lua//lspconfig/sumneko_lua/lua-language-server\ncache\fstdpath\afn\bvim\1\0\0\vyamlls\1\0\0\thtml\1\0\0\ngopls\1\0\0\rtsserver\1\0\0\vjsonls\rsettings\18rust-analyzer\1\0\0\16diagnostics\1\0\0\rdisabled\1\2\0\0\26unresolved-proc-macro\1\0\2\venable\2\23enableExperimental\2\14on_attach\1\0\0\nsetup\18rust_analyzer\14lspconfig\frequire\0\0", "config", "nvim-lspconfig")
-- Load plugins in order defined by `after`
vim.cmd [[ packadd nvim-lsputils ]]

-- Config for: nvim-lsputils
try_loadstring("\27LJ\2\nﬁ\5\0\0\4\0\23\0I6\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\5\0B\1\2\0029\1\6\1=\1\3\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\5\0B\1\2\0029\1\6\1=\1\3\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\t\1=\1\a\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\v\1=\1\n\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\r\1=\1\f\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\15\1=\1\14\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\17\1=\1\16\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\20\1=\1\18\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\22\1=\1\21\0K\0\1\0\22workspace_handler\21workspace/symbol\21document_handler\20lsputil.symbols textDocument/documentSymbol\27implementation_handler textDocument/implementation\27typeDefinition_handler textDocument/typeDefinition\24declaration_handler\29textDocument/declaration\23definition_handler\28textDocument/definition\23references_handler\22lsputil.locations\28textDocument/references\24code_action_handler\23lsputil.codeAction\frequire\28textDocument/codeAction\rhandlers\blsp\bvim\0", "config", "nvim-lsputils")

vim.cmd [[ packadd diagnostic-nvim ]]

-- Config for: diagnostic-nvim
try_loadstring("\27LJ\2\nÃ\1\0\0\5\0\b\0\0146\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\1\0019\1\4\0016\3\0\0009\3\1\0039\3\5\0039\3\6\0035\4\a\0B\1\3\2=\1\3\0K\0\1\0\1\0\4\nsigns\2\17virtual_text\2\14underline\2\21update_in_insert\1\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\blsp\bvim\0", "config", "diagnostic-nvim")


-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file Neoformat lua require("packer.load")({'neoformat'}, { cmd = "Neoformat", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
