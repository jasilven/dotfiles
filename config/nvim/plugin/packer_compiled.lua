-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/e103270/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/e103270/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/e103270/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/e103270/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/e103270/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["any-jump.vim"] = {
    config = { "\27LJ\2\n{\0\0\a\0\a\0\n5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\1K\0\1\0\17:AnyJump<cr>\r<space>J\6n\20nvim_set_keymap\bapi\bvim\1\0\3\vnowait\2\vsilent\2\fnoremap\2\0" },
    keys = { { "", "<space>J" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/opt/any-jump.vim"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim"
  },
  ["diffview.nvim"] = {
    commands = { "DiffviewOpen" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/opt/diffview.nvim"
  },
  fzf = {
    load_after = {
      ["fzf.vim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/opt/fzf"
  },
  ["fzf.vim"] = {
    after = { "fzf" },
    commands = { "Files", "Rg" },
    config = { "\27LJ\2\nÜ\v\0\0\a\0\22\0.5\0\0\0006\1\1\0009\1\2\0015\2\5\0005\3\4\0=\3\6\2=\2\3\0016\1\1\0009\1\2\1)\2\1\0=\2\a\0016\1\1\0009\1\2\1'\2\t\0=\2\b\0016\1\1\0009\1\n\0019\1\v\1'\3\f\0'\4\r\0'\5\14\0\18\6\0\0B\1\5\0016\1\1\0009\1\n\0019\1\v\1'\3\f\0'\4\15\0'\5\16\0\18\6\0\0B\1\5\0016\1\1\0009\1\n\0019\1\v\1'\3\f\0'\4\17\0'\5\18\0\18\6\0\0B\1\5\0016\1\1\0009\1\n\0019\1\19\1'\3\20\0'\4\21\0B\1\3\1K\0\1\0\5‡\6                command! -bar -bang -range=% Commits    <line1>,<line2>call fzf#vim#commits(fzf#vim#with_preview({ \"placeholder\": \"\" }), <bang>0)\n                au FileType fzf tnoremap <buffer> jk jk\n                au FileType fzf tmap <buffer> <Esc> <c-g>\n                au FileType fzf tmap <buffer> <C-d> <c-g>\n                au FileType fzf imap <buffer> <Esc> <c-g>\n                au FileType fzf tmap <buffer> <C-j> <Down>\n                au FileType fzf tmap <buffer> <Tab> <Down>\n                au FileType fzf tmap <buffer> <S-Tab> <Up>\n                au FileType fzf set laststatus=0 noshowmode\n                au BufEnter term://*fzf* startinsert\n                au BufLeave term://*fzf* set laststatus=2\n                let g:fzf_action = { 'ctrl-o': '!open ', 'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit'}\n                \14nvim_exec\16:BLines<CR>\r<space>l\f:Rg<CR>\r<space>s\15:Files<CR>\r<space>F\6n\20nvim_set_keymap\bapiÖ\1--graph --color=always --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Creset(%cr) %Creset<%an>%Creset' --abbrev-commit\28fzf_commits_log_options\21vim_buffers_jump\vwindow\1\0\0\1\0\4\rrelative\1\vheight\4\0ÄÄÄˇ\3\nwidth\3\1\fyoffset\3\1\15fzf_layout\6g\bvim\1\0\3\vnowait\2\vsilent\2\fnoremap\2\0" },
    keys = { { "", "<space>s" }, { "", "<space>l" }, { "", "<space>F" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/opt/fzf.vim"
  },
  ["git-blame.nvim"] = {
    commands = { "GitBlameToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/opt/git-blame.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  hop = {
    config = { "\27LJ\2\nø\1\0\0\a\0\v\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0015\0\4\0006\1\5\0009\1\6\0019\1\a\1'\3\b\0'\4\t\0'\5\n\0\18\6\0\0B\1\5\1K\0\1\0\18:HopChar1<cr>\6f\6n\20nvim_set_keymap\bapi\bvim\1\0\3\vnowait\2\vsilent\2\fnoremap\2\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    keys = { { "", "f" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/opt/hop"
  },
  lspinstall = {
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/lspinstall"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nà\2\0\0\15\0\15\1'6\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\2\21\1\0\0\t\1\0\0X\1\2Ä'\1\1\0L\1\2\0004\1\0\0006\2\4\0\18\4\0\0B\2\2\4H\5\17Ä6\a\5\0009\a\6\a\18\t\1\0009\n\a\6\14\0\n\0X\v\1Ä)\n\0\0'\v\b\0006\f\t\0009\f\n\f9\14\v\6B\f\2\2\14\0\f\0X\r\1Ä'\f\f\0&\n\f\nB\a\3\1F\5\3\3R\5Ì6\2\5\0009\2\r\2\18\4\1\0'\5\14\0D\2\3\0\b | \vconcat\5\ntitle\nlower\vstring\b%% \15percentage\vinsert\ntable\npairs\26get_progress_messages\tutil\blsp\bvim\0_\0\0\4\1\5\0\0146\0\0\0006\2\1\0009\2\2\0029\2\3\2B\2\1\0A\0\0\2\v\0\0\0X\0\3Ä'\0\4\0L\0\2\0X\0\2Ä-\0\0\0D\0\1\0K\0\1\0\0¿\5\20buf_get_clients\blsp\bvim\tnext_\0\0\4\0\a\0\f6\0\0\0009\0\1\0006\2\2\0009\2\3\0029\2\4\2B\2\1\2'\3\5\0B\0\3\2\v\0\0\0X\1\1Ä'\0\6\0L\0\2\0\n<n/a>\v[^/]*$\vgetcwd\afn\bvim\nmatch\vstringË\4\1\0\n\0\28\0/3\0\0\0003\1\1\0003\2\2\0006\3\3\0'\5\4\0B\3\2\0029\3\5\0035\5\22\0005\6\a\0005\a\6\0=\a\b\0064\a\0\0=\a\t\0064\a\6\0005\b\n\0>\b\1\a4\b\3\0>\2\1\b>\b\2\a5\b\v\0>\b\3\a5\b\f\0005\t\r\0=\t\14\b>\b\4\a5\b\15\0>\b\5\a=\a\16\0065\a\18\0004\b\3\0>\1\1\b>\b\1\a5\b\17\0>\b\2\a=\a\19\0064\a\0\0=\a\20\0064\a\0\0=\a\21\6=\6\23\0055\6\24\0=\6\25\0055\6\26\0=\6\27\5B\3\2\0012\0\0ÄK\0\1\0\foptions\1\0\3\25component_separators\5\23section_separators\5\ntheme\tnord\15extensions\1\2\0\0\bfzf\rsections\1\0\0\14lualine_z\14lualine_y\14lualine_x\1\5\0\0\0\0\rencoding\rlocation\1\2\1\0\rfiletype\fcolored\1\14lualine_c\1\2\1\0\tdiff\fcolored\1\fsources\1\2\0\0\rnvim_lsp\1\2\4\0\16diagnostics\15color_hint\f#ffffff\15color_info\f#ffffff\15color_warn\f#ffffff\16color_error\f#ffffff\1\2\3\0\rfilename\tpath\3\1\14full_name\2\fshorten\1\1\2\0\0\vbranch\14lualine_b\14lualine_a\1\0\0\1\2\0\0\tmode\nsetup\flualine\frequire\0\0\0\0" },
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "\27LJ\2\nY\0\0\4\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\1K\0\1\0\1\0\1!disable_context_highlighting\2\nsetup\vneogit\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/opt/neogit"
  },
  neoterm = {
    config = { "\27LJ\2\nÉ\b\0\0\a\0\18\0,5\0\0\0006\1\1\0009\1\2\1)\2\25\0=\2\3\0016\1\1\0009\1\2\1)\2\1\0=\2\4\0016\1\1\0009\1\2\1'\2\6\0=\2\5\0016\1\1\0009\1\a\0019\1\b\1'\3\t\0'\4\n\0'\5\v\0\18\6\0\0B\1\5\0016\1\1\0009\1\a\0019\1\b\1'\3\f\0'\4\n\0'\5\r\0\18\6\0\0B\1\5\0016\1\1\0009\1\a\0019\1\b\1'\3\14\0'\4\n\0'\5\r\0\18\6\0\0B\1\5\0016\1\1\0009\1\a\0019\1\15\1'\3\16\0'\4\17\0B\1\3\1K\0\1\0\5Ö\5                au TermOpen * setlocal nonumber \n                au FileType neoterm nnoremap <silent> <buffer> <C-j> <C-\\><C-N><C-w><C-p>:Tclose<cr>\n                au FileType neoterm nnoremap <silent> <buffer> q <C-\\><C-N><C-w><C-p>:Tclose<cr>\n                au FileType neoterm tnoremap <silent> <buffer> <C-h> <C-\\><C-N><C-\\><C-N>:BufferPrevious<cr>\n                au FileType neoterm tnoremap <silent> <buffer> <C-l> <C-\\><C-N><C-\\><C-N>:BufferNext<cr>\n                au FileType neoterm tnoremap <silent> <buffer> <C-q> <C-\\><C-N><C-w><C-p>:Tclose<cr>\n                au FileType neoterm tnoremap <Esc> <c-\\><c-n>\n                \14nvim_exec\6t.<C-\\><C-N><C-w><C-p>:botright Ttoggle<cr>\6i\26:botright Ttoggle<cr>\n<C-j>\6n\20nvim_set_keymap\bapi\rbotright\24neoterm_default_mod\23neoterm_autoinsert\17neoterm_size\6g\bvim\1\0\3\vnowait\2\vsilent\2\fnoremap\2\0" },
    keys = { { "", "<C-j>" } },
    loaded = false,
    needs_bufread = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/opt/neoterm"
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
  ["nvim-comment"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n÷\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\b\tpath\2\fluasnip\1\14ultisnips\1\nvsnip\1\vbuffer\2\rnvim_lsp\2\tcalc\1\rnvim_lua\2\1\0\r\18documentation\2\19max_menu_width\3d\19max_kind_width\3d\19max_abbr_width\3d\ndebug\1\20resolve_timeout\3†\6\19source_timeout\3»\1\18throttle_time\3P\21incomplete_delay\3ê\3\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\nsetup\ncompe\frequire\0" },
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_option\bapi\bvim√\v\1\2\v\0-\0s3\2\0\0003\3\1\0006\4\2\0009\4\3\0049\4\4\4'\6\5\0'\a\6\0B\4\3\1\18\4\3\0'\6\a\0'\a\b\0B\4\3\0015\4\t\0\18\5\2\0'\a\n\0'\b\v\0'\t\f\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\r\0'\t\14\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\15\0'\t\16\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\17\0'\t\18\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\19\0'\t\20\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\21\0'\t\22\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\23\0'\t\24\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\25\0'\t\26\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\27\0'\t\28\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\29\0'\t\30\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\31\0'\t \0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b!\0'\t\"\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b#\0'\t$\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b%\0'\t&\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b'\0'\t(\0\18\n\4\0B\5\5\0019\5)\0009\5*\5\15\0\5\0X\6\6Ä\18\5\2\0'\a\n\0'\b+\0'\t,\0\18\n\4\0B\5\5\0012\0\0ÄK\0\1\0*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>=\24document_formatting\26resolved_capabilities2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\14<space>el0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\14<space>en0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\14<space>ep<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\14<space>ee0:Telescope lsp_references theme=get_ivy<CR>\agr&<cmd>lua vim.lsp.buf.rename()<CR>\t<f2>/<cmd>lua vim.lsp.buf.type_definition()<CR>\r<space>DJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\14<space>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\14<space>wr+<cmd>lua vim.lsp.buf.code_action()<CR>\r<space>a.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>5:Telescope lsp_implementations theme=get_ivy<CR>\agi%<cmd>lua vim.lsp.buf.hover()<CR>\6K,<cmd>lua vim.lsp.buf.definition()<CR>zz\agd+<cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\1\0\2\vsilent\2\fnoremap\2\27v:lua.vim.lsp.omnifunc\romnifunc\5Gautocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 300)\14nvim_exec\bapi\bvim\0\0ø\1\0\0\3\1\v\0\0156\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\0029\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\a\0015\1\b\0=\0\t\1-\2\0\0=\2\n\1L\1\2\0\0¿\14on_attach\17capabilities\1\0\0\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bvim™\3\0\0\n\4\18\00056\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0B\0\1\0026\1\4\0009\1\5\1\18\3\0\0'\4\6\0B\1\3\0016\1\a\0\18\3\0\0B\1\2\4H\4\31Ä-\6\0\0B\6\1\2\a\5\b\0X\a\2Ä-\a\1\0=\a\t\6\a\5\n\0X\a\2Ä-\a\2\0=\a\t\6\a\5\6\0X\a\fÄ5\a\f\0=\a\v\0066\a\0\0'\t\14\0B\a\2\0029\a\15\a9\a\16\a'\t\17\0B\a\2\2=\a\r\6-\a\3\0=\a\t\0066\a\0\0'\t\14\0B\a\2\0028\a\5\a9\a\2\a\18\t\6\0B\a\2\1F\4\3\3R\4ﬂK\0\1\0\4¿\1¿\2¿\3¿\bsbt\17root_pattern\tutil\14lspconfig\rroot_dir\1\2\0\0C/Users/e103270/Library/Application Support/Coursier/bin/metals\bcmd\trust\rsettings\blua\npairs\vmetals\vinsert\ntable\22installed_servers\nsetup\15lspinstall\frequire5\0\0\3\1\3\0\a-\0\0\0B\0\1\0016\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\5¿\fbufdo e\bcmd\bvimÀ\n\1\0\v\0@\0r3\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0005\4\5\0B\1\3\0016\1\1\0009\1\2\0019\1\3\1'\3\6\0005\4\a\0B\1\3\0016\1\1\0009\1\2\0019\1\3\1'\3\b\0005\4\t\0B\1\3\0016\1\1\0009\1\2\0019\1\3\1'\3\n\0005\4\v\0B\1\3\0015\1\29\0005\2\17\0005\3\f\0006\4\1\0009\4\r\0046\6\14\0009\6\15\6'\a\16\0B\4\3\2=\4\15\3=\3\18\0025\3\20\0005\4\19\0=\4\21\3=\3\22\0025\3\26\0004\4\0\b6\5\1\0009\5\2\0059\5\23\5'\a\24\0B\5\2\2+\6\2\0<\6\5\0046\5\1\0009\5\2\0059\5\23\5'\a\25\0B\5\2\2+\6\2\0<\6\5\4=\4\27\3=\3\28\2=\2\30\0015\2+\0005\3 \0005\4\31\0=\4!\0035\4#\0005\5\"\0=\5$\4=\4\22\0035\4%\0=\4&\0035\4'\0=\4(\0035\4)\0=\4*\3=\3,\0025\3.\0005\4-\0=\4/\0033\0040\0003\0051\0\18\6\5\0B\6\1\0016\6\1\0009\0062\0069\0063\0066\a\1\0009\a2\a9\a5\a6\t\1\0009\t2\t9\t6\t9\t7\t5\n8\0B\a\3\2=\a4\0066\6\1\0009\0062\0069\0063\0066\a\1\0009\a2\a9\a5\a6\t\1\0009\t2\t9\t3\t9\t:\t5\n;\0B\a\3\2=\a9\0066\6<\0'\b=\0B\6\2\0023\a?\0=\a>\0062\0\0ÄK\0\1\0\0\22post_install_hook\15lspinstall\frequire\1\0\0\nhover\23textDocument/hover\1\0\3\17virtual_text\2\21update_in_insert\1\nsigns\2\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\blsp\0\0\vmetals\1\0\0\1\0\1\14sbtScript\27/Users/e103270/bin/sbt\18rust-analyzer\1\0\0\16checkOnSave\1\0\1\fcommand\vclippy\14procMacro\1\0\1\venable\2\ncargo\1\0\1\25loadOutDirsFromCheck\2\rdisabled\1\0\0\1\2\0\0\26unresolved-proc-macro\vassist\1\0\0\1\0\2\17importPrefix\fby_self\24importMergeBehavior\tlast\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\vexpand\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\6;\tpath\fpackage\nsplit\1\0\1\fversion\vLuaJIT\1\0\2\ttext\bÔÄ´\vtexthl\30LspDiagnosticsDefaultHint\27LspDiagnosticsSignHint\1\0\2\ttext\b‚ìò\vtexthl\30LspDiagnosticsDefaultInfo\27LspDiagnosticsSignInfo\1\0\2\ttext\b‚ñ≤\vtexthl!LspDiagnosticsDefaultWarning\30LspDiagnosticsSignWarning\1\0\2\ttext\b‚ñ≤\vtexthl\31LspDiagnosticsDefaultError\28LspDiagnosticsSignError\16sign_define\afn\bvim\0\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nÇ\1\0\0\a\0\a\0\n5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\1K\0\1\0\24:NvimTreeToggle<CR>\r<space>n\6n\20nvim_set_keymap\bapi\bvim\1\0\3\vnowait\2\vsilent\2\fnoremap\2\0" },
    keys = { { "", "<space>n" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
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
  playground = {
    config = { "\27LJ\2\nè\1\0\0\a\0\a\0\n5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\1K\0\1\0(:TSHighlightCapturesUnderCursor<CR>\n<f10>\6n\20nvim_set_keymap\bapi\bvim\1\0\3\vnowait\2\vsilent\2\fnoremap\2\0" },
    keys = { { "", "<f10>" } },
    loaded = false,
    needs_bufread = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\nÇ\1\0\0\a\0\a\0\n5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\1K\0\1\0\24:SymbolsOutline<CR>\r<space>i\6n\20nvim_set_keymap\bapi\bvim\1\0\3\vnowait\2\vsilent\2\fnoremap\2\0" },
    keys = { { "", "<space>i" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/opt/symbols-outline.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nè\a\0\0\t\0'\0Y5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\a\0'\5\b\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\t\0'\5\b\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\n\0'\5\v\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\f\0'\5\r\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\14\0'\5\15\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\16\0'\5\17\0\18\6\0\0B\1\5\0016\1\18\0'\3\19\0B\1\2\0026\2\18\0'\4\20\0B\2\2\0029\2\21\0025\4%\0005\5\22\0005\6\23\0=\6\24\0054\6\0\0=\6\25\0055\6!\0005\a\27\0009\b\26\1=\b\28\a9\b\29\1=\b\30\a9\b\31\1=\b \a=\a\"\0065\a#\0009\b\26\1=\b\28\a9\b\29\1=\b\30\a=\a\4\6=\6$\5=\5&\4B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<esc>\nclose\r<PageUp>\25preview_scrolling_up\15<PageDown>\1\0\0\27preview_scrolling_down\vborder\17path_display\1\2\0\0\rabsolute\1\0\2\18prompt_prefix\a> \20selection_caret\t‚ñ∂ \nsetup\14telescope\22telescope.actions\frequire\28:Telescope commands<CR>\n<M-x>+:Telescope registers theme=get_ivy<CR>\r<space>r':Telescope marks theme=get_ivy<CR>\r<space>m*:Telescope oldfiles theme=get_ivy<CR>\r<space>h\n<tab>):Telescope buffers theme=get_ivy<CR>\r<space>b,:Telescope find_files theme=get_ivy<CR>\r<space>f\6n\20nvim_set_keymap\bapi\bvim\1\0\3\vnowait\2\vsilent\2\fnoremap\2\0" },
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-rooter"] = {
    config = { "\27LJ\2\nÓ\1\0\0\2\0\a\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0K\0\1\0\1\n\0\0\16project.clj\rdeps.edn\vgo.mod\17package.json\14build.sbt\bsbt\fpom.xml\t.git\15.gitignore\20rooter_patterns\24rooter_silent_chdir\fcurrent2rooter_change_directory_for_non_project_files\6g\bvim\0" },
    loaded = true,
    path = "/Users/e103270/.local/share/nvim/site/pack/packer/start/vim-rooter"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: any-jump.vim
time([[Setup for any-jump.vim]], true)
try_loadstring("\27LJ\2\nz\0\0\2\0\4\2\t6\0\0\0009\0\1\0*\1\0\0=\1\2\0006\0\0\0009\0\1\0*\1\1\0=\1\3\0K\0\1\0!any_jump_window_height_ratio any_jump_window_width_ratio\6g\bvimµÊÃô\19ô≥¶ˇ\3\1ÄÄÄˇ\3\0", "setup", "any-jump.vim")
time([[Setup for any-jump.vim]], false)
-- Setup for: git-blame.nvim
time([[Setup for git-blame.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0\21gitblame_enabled\6g\bvim\0", "setup", "git-blame.nvim")
time([[Setup for git-blame.nvim]], false)
-- Setup for: symbols-outline.nvim
time([[Setup for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\n˝\1\0\0\3\0\a\0\t6\0\0\0009\0\1\0005\1\3\0005\2\4\0=\2\5\0014\2\0\0=\2\6\1=\1\2\0K\0\1\0\18lsp_blacklist\fkeymaps\1\0\6\18goto_location\t<Cr>\17code_actions\6a\18rename_symbol\6r\17hover_symbol\6K\19focus_location\6o\nclose\n<Esc>\1\0\4\rposition\nright\17auto_preview\1\16show_guides\2\27highlight_hovered_item\1\20symbols_outline\6g\bvim\0", "setup", "symbols-outline.nvim")
time([[Setup for symbols-outline.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\n÷\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\b\tpath\2\fluasnip\1\14ultisnips\1\nvsnip\1\vbuffer\2\rnvim_lsp\2\tcalc\1\rnvim_lua\2\1\0\r\18documentation\2\19max_menu_width\3d\19max_kind_width\3d\19max_abbr_width\3d\ndebug\1\20resolve_timeout\3†\6\19source_timeout\3»\1\18throttle_time\3P\21incomplete_delay\3ê\3\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\nsetup\ncompe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nè\a\0\0\t\0'\0Y5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\a\0'\5\b\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\t\0'\5\b\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\n\0'\5\v\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\f\0'\5\r\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\14\0'\5\15\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\16\0'\5\17\0\18\6\0\0B\1\5\0016\1\18\0'\3\19\0B\1\2\0026\2\18\0'\4\20\0B\2\2\0029\2\21\0025\4%\0005\5\22\0005\6\23\0=\6\24\0054\6\0\0=\6\25\0055\6!\0005\a\27\0009\b\26\1=\b\28\a9\b\29\1=\b\30\a9\b\31\1=\b \a=\a\"\0065\a#\0009\b\26\1=\b\28\a9\b\29\1=\b\30\a=\a\4\6=\6$\5=\5&\4B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<esc>\nclose\r<PageUp>\25preview_scrolling_up\15<PageDown>\1\0\0\27preview_scrolling_down\vborder\17path_display\1\2\0\0\rabsolute\1\0\2\18prompt_prefix\a> \20selection_caret\t‚ñ∂ \nsetup\14telescope\22telescope.actions\frequire\28:Telescope commands<CR>\n<M-x>+:Telescope registers theme=get_ivy<CR>\r<space>r':Telescope marks theme=get_ivy<CR>\r<space>m*:Telescope oldfiles theme=get_ivy<CR>\r<space>h\n<tab>):Telescope buffers theme=get_ivy<CR>\r<space>b,:Telescope find_files theme=get_ivy<CR>\r<space>f\6n\20nvim_set_keymap\bapi\bvim\1\0\3\vnowait\2\vsilent\2\fnoremap\2\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: vim-rooter
time([[Config for vim-rooter]], true)
try_loadstring("\27LJ\2\nÓ\1\0\0\2\0\a\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0K\0\1\0\1\n\0\0\16project.clj\rdeps.edn\vgo.mod\17package.json\14build.sbt\bsbt\fpom.xml\t.git\15.gitignore\20rooter_patterns\24rooter_silent_chdir\fcurrent2rooter_change_directory_for_non_project_files\6g\bvim\0", "config", "vim-rooter")
time([[Config for vim-rooter]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nà\2\0\0\15\0\15\1'6\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\2\21\1\0\0\t\1\0\0X\1\2Ä'\1\1\0L\1\2\0004\1\0\0006\2\4\0\18\4\0\0B\2\2\4H\5\17Ä6\a\5\0009\a\6\a\18\t\1\0009\n\a\6\14\0\n\0X\v\1Ä)\n\0\0'\v\b\0006\f\t\0009\f\n\f9\14\v\6B\f\2\2\14\0\f\0X\r\1Ä'\f\f\0&\n\f\nB\a\3\1F\5\3\3R\5Ì6\2\5\0009\2\r\2\18\4\1\0'\5\14\0D\2\3\0\b | \vconcat\5\ntitle\nlower\vstring\b%% \15percentage\vinsert\ntable\npairs\26get_progress_messages\tutil\blsp\bvim\0_\0\0\4\1\5\0\0146\0\0\0006\2\1\0009\2\2\0029\2\3\2B\2\1\0A\0\0\2\v\0\0\0X\0\3Ä'\0\4\0L\0\2\0X\0\2Ä-\0\0\0D\0\1\0K\0\1\0\0¿\5\20buf_get_clients\blsp\bvim\tnext_\0\0\4\0\a\0\f6\0\0\0009\0\1\0006\2\2\0009\2\3\0029\2\4\2B\2\1\2'\3\5\0B\0\3\2\v\0\0\0X\1\1Ä'\0\6\0L\0\2\0\n<n/a>\v[^/]*$\vgetcwd\afn\bvim\nmatch\vstringË\4\1\0\n\0\28\0/3\0\0\0003\1\1\0003\2\2\0006\3\3\0'\5\4\0B\3\2\0029\3\5\0035\5\22\0005\6\a\0005\a\6\0=\a\b\0064\a\0\0=\a\t\0064\a\6\0005\b\n\0>\b\1\a4\b\3\0>\2\1\b>\b\2\a5\b\v\0>\b\3\a5\b\f\0005\t\r\0=\t\14\b>\b\4\a5\b\15\0>\b\5\a=\a\16\0065\a\18\0004\b\3\0>\1\1\b>\b\1\a5\b\17\0>\b\2\a=\a\19\0064\a\0\0=\a\20\0064\a\0\0=\a\21\6=\6\23\0055\6\24\0=\6\25\0055\6\26\0=\6\27\5B\3\2\0012\0\0ÄK\0\1\0\foptions\1\0\3\25component_separators\5\23section_separators\5\ntheme\tnord\15extensions\1\2\0\0\bfzf\rsections\1\0\0\14lualine_z\14lualine_y\14lualine_x\1\5\0\0\0\0\rencoding\rlocation\1\2\1\0\rfiletype\fcolored\1\14lualine_c\1\2\1\0\tdiff\fcolored\1\fsources\1\2\0\0\rnvim_lsp\1\2\4\0\16diagnostics\15color_hint\f#ffffff\15color_info\f#ffffff\15color_warn\f#ffffff\16color_error\f#ffffff\1\2\3\0\rfilename\tpath\3\1\14full_name\2\fshorten\1\1\2\0\0\vbranch\14lualine_b\14lualine_a\1\0\0\1\2\0\0\tmode\nsetup\flualine\frequire\0\0\0\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n‚\3\0\0\6\0\27\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0005\5\14\0=\5\15\4=\4\16\0035\4\17\0=\4\18\3=\3\19\0025\3\22\0005\4\20\0005\5\21\0=\5\15\4=\4\23\3=\3\24\0025\3\25\0=\3\26\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\16textobjects\vselect\1\0\0\1\0\1\aaf\20@function.outer\1\0\1\venable\2\rrefactor\15navigation\1\0\1\venable\1\17smart_rename\fkeymaps\1\0\1\17smart_rename\t<f3>\1\0\1\venable\2\28highlight_current_scope\1\0\1\venable\1\26highlight_definitions\1\0\0\1\0\1\venable\2\26incremental_selection\1\0\1\venable\1\14highlight\1\0\1\21ensure_installed\15maintained\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file GitBlameToggle lua require("packer.load")({'git-blame.nvim'}, { cmd = "GitBlameToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Files lua require("packer.load")({'fzf.vim'}, { cmd = "Files", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file DiffviewOpen lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Rg lua require("packer.load")({'fzf.vim'}, { cmd = "Rg", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <space>n <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "<lt>space>n", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-j> <cmd>lua require("packer.load")({'neoterm'}, { keys = "<lt>C-j>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <space>s <cmd>lua require("packer.load")({'fzf.vim'}, { keys = "<lt>space>s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <space>J <cmd>lua require("packer.load")({'any-jump.vim'}, { keys = "<lt>space>J", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <space>F <cmd>lua require("packer.load")({'fzf.vim'}, { keys = "<lt>space>F", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <f10> <cmd>lua require("packer.load")({'playground'}, { keys = "<lt>f10>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> f <cmd>lua require("packer.load")({'hop'}, { keys = "f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <space>l <cmd>lua require("packer.load")({'fzf.vim'}, { keys = "<lt>space>l", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <space>i <cmd>lua require("packer.load")({'symbols-outline.nvim'}, { keys = "<lt>space>i", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType js ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "js" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType ts ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "ts" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType rs ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "rs" }, _G.packer_plugins)]]
vim.cmd [[au FileType tsx ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "tsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "yaml" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
