local vim = vim
local api = vim.api
local fn = vim.fn

vim.cmd 'packadd paq-nvim'
local paq = require'paq-nvim'.paq
paq{'savq/paq-nvim', opt=true}

local keyopts = {nowait = true, noremap = true, silent = true}
local settings = {}

function settings.Setup_keymaps()
   local keymaps = {
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x"}, lhs = "<C-g>", rhs = "<Esc>"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<M-h>", rhs = "<C-\\><C-N><C-w>h"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<M-l>", rhs = "<C-\\><C-N><C-w>l"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<M-k>", rhs = "<C-\\><C-N><C-w>k"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<M-j>", rhs = "<C-\\><C-N><C-w>j"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-t>", rhs = "<C-\\><C-N>:term<cr>"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x"}, lhs = "<C-d>", rhs = "<C-\\><C-N>:wqa<cr>"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-w><C-w>", rhs = "<C-\\><C-N><C-w>w"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-w>w", rhs = "<C-\\><C-N><C-w>w"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-w>h", rhs = "<C-\\><C-N><C-w>h"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-w>j", rhs = "<C-\\><C-N><C-w>j"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-w>k", rhs = "<C-\\><C-N><C-w>k"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-w>l", rhs = "<C-\\><C-N><C-w>l"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<Esc>", rhs = "<C-\\><C-N>"},
        {mods = {"n", "v"}, lhs = "gh", rhs = "0"},
        {mods = {"n", "v"}, lhs = "gl", rhs = "$"},
        {mods = {"n", "v"}, lhs = "gm", rhs = "%"},
        {mods = {"i", "t"}, lhs = "jk", rhs = "<C-\\><C-N>"},
        {mods = {"n"}, lhs = "<C-N>", rhs = "<C-\\><C-N>:vs +enew<cr>"},
        {mods = {"n", "i"}, lhs = "<C-q>", rhs = "<C-\\><C-N>:Bd<cr>"},
        {mods = {"n"}, lhs = "go", rhs = "<C-\\><C-N><C-w>w"},
        {mods = {"t"}, lhs = "<C-q>", rhs = "<C-\\><C-N>:bd!<cr>"},
        {mods = {"n"}, lhs = "<C-S-up>", rhs = ":m .-2<CR>=="},
        {mods = {"n"}, lhs = "<C-S-Down>", rhs = ":m .+1<CR>=="},
        {mods = {"v"}, lhs = "<C-S-up>", rhs = ":m '<-2<CR>gv=gv"},
        {mods = {"v"}, lhs = "<C-S-Down>", rhs = ":m '>+1<CR>gv=gv"},
        {mods = {"n"}, lhs = "<RightMouse>", rhs = "<LeftMouse>gdzz"},
        {mods = {"n"}, lhs = "<space><tab>", rhs = "<C-^>"},
        {mods = {"n"}, lhs = "<space>o", rhs = ":only<cr>"},
        {mods = {"n"}, lhs = "<space>w", rhs = ":update<cr>"},
        {mods = {"n"}, lhs = "<space>Q", rhs = ":qall<cr>"},
        {mods = {"n"}, lhs = "<space>q", rhs = "q"},
        {mods = {"n"}, lhs = "q", rhs = ":close<cr>"},
        {mods = {"n"}, lhs = "Q", rhs = "<Nop>"},
        {mods = {"n"}, lhs = "gf", rhs = "<C-w>vgF", {noremap = false}},
        {mods = {"n"}, lhs = "dh", rhs = "d0"},
        {mods = {"n"}, lhs = "dl", rhs = "d$"},
        {mods = {"n"}, lhs = "WW", rhs = "<C-w>w"},
        {mods = {"n"}, lhs = "Wj", rhs = "<C-w>j"},
        {mods = {"n"}, lhs = "Wk", rhs = "<C-w>k"},
        {mods = {"n"}, lhs = "Wh", rhs = "<C-w>h"},
        {mods = {"n"}, lhs = "Wl", rhs = "<C-w>l"},
        {mods = {"n"}, lhs = "yh", rhs = "y0"},
        {mods = {"n"}, lhs = "yl", rhs = "y$"},
        {mods = {"n"}, lhs = "<f1>", rhs = ":help <C-r><C-w><cr>"},
        {mods = {"t"}, lhs = "<C-d>", rhs = "<C-\\><C-N>:bd!<cr>"},
        {mods = {"n"}, lhs = "*", rhs = ":let @/='\\V\\<'.escape(expand('<cword>'), '\\').'\\>'<cr>:set hls<cr>"}
    }

    for _, keymap in pairs(keymaps) do
        for _, mod in pairs(keymap.mods) do
            api.nvim_set_keymap(mod, keymap.lhs, keymap.rhs, keymap.opt or {nowait = true, noremap = true})
        end
    end
end

function settings.Setup_options()
    vim.o["autoread"] = false 
    vim.o["backup"] = false
    vim.o["writebackup"] = false
    vim.o["clipboard"] = "unnamedplus"
    -- vim.o["completeopt"] = "menuone,noinsert,noselect"
    vim.o["completeopt"] = "menu,menuone,noselect"
    vim.o["confirm"] = true
    vim.o["encoding"] = "utf-8"
    vim.o["expandtab"] = true
    vim.o["fileencoding"] = "utf-8"
    vim.o["fillchars"] = "eob: ,vert:│"
    vim.o["guicursor"] = "n-v-c:block-Cursor/lCursor-blinkon1,i-ci-ve:ver40-Cursor/lCursor,r-cr:hor20-Cursor/lCursor"
    vim.o["hidden"] = true
    vim.o["hlsearch"] = true
    vim.o["ignorecase"] = true
    vim.o["inccommand"] = "nosplit"
    vim.o["incsearch"] = true
    vim.o["lazyredraw"] = true
    vim.o["linebreak"] = true
    vim.o["list"] = false
    vim.o["listchars"] = "tab:→ ,space:·,nbsp:␣,trail:•,eol:$,precedes:«,extends:»"
    vim.o["mouse"] = "a"
    vim.o["scrolloff"] = 2
    vim.o["sessionoptions"] = "blank,curdir,help,tabpages,winsize"
    vim.o["shiftwidth"] = 4
    vim.o["shortmess"] = "IcatFo"
    vim.o["showcmd"] = false
    vim.o["showmatch"] = true
    vim.o["showmode"] = false
    vim.o["smartindent"] = true
    vim.o["softtabstop"] = 4
    vim.o["spell"] = false
    vim.o["spelllang"] = "en_us"
    vim.o["splitbelow"] = true
    vim.o["splitright"] = true
    vim.o["swapfile"] = false
    vim.o["synmaxcol"] = 200
    vim.o["tabstop"] = 4
    vim.o["termguicolors"] = true
    vim.o["ttyfast"] = true
    vim.o["undofile"] = true
    vim.o["updatetime"] = 300
    vim.o["wildignore"] = "*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*/.git/*,*/target/*,*~,tags"
    vim.o["wildmenu"] = true
    vim.o["wildmode"] = "list:longest,full"
    vim.o["wrap"] = false
    vim.o["grepprg"] = "rg --no-heading --vimgrep --smart-case"
    vim.o["grepformat"] = "%f:%l:%c:%m"
    vim.o["formatoptions"] = "tcrqnb"
    vim.o["fsync"] = false
    vim.wo["wrap"] = false
    vim.wo["foldenable"] = false
    vim.wo["number"] = true
    vim.wo["signcolumn"] = "yes:1"
    vim.wo["cursorline"] = true
end


function settings.Setup_general()
    vim.g.netrw_liststyle = 3
    vim.g.netrw_banner = 0
    vim.g.netrw_hide = 1
    api.nvim_exec(
        [[
    au FileType markdown set shiftwidth=2
    autocmd Filetype lua setlocal ts=4 sts=4 sw=4
    let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' 
    au TermOpen * startinsert
    au Bufenter term://*zsh* startinsert
    au Bufenter term://*fish* startinsert
    au TextYankPost * silent! lua vim.highlight.on_yank()
    vmap <LeftRelease> "+ygv
    vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
    nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"  . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>
    inoremap <F5> <C-R>=strftime("%a %d %b %Y")<CR>
    nnoremap <space>/ *:%s/<c-r><c-w>//g<left><left>
    command! -bar -range Execute silent <line1>,<line2>yank z | let @z = substitute(@z, '\n\s*\\', '', 'g') | @z
    command! -nargs=+ Grep execute 'silent grep! <args>' | copen 15
    command! Bd bp | sp | bn | bd
    cnoreabbrev hon nohl 
    cnoreabbrev hoh nohl 
    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  ]],
        ""
    )
    api.nvim_exec(
        [[
    augroup autoquickfix
      autocmd!
      au QuickFixCmdPost [^l]* cwindow
      au QuickFixCmdPost    l* lwindow
    augroup END
  ]],
        ""
    )
end

local function treesitter()
    -- paq 'nvim-treesitter/nvim-treesitter-refactor'
    -- paq 'nvim-treesitter/nvim-treesitter-textobjects'
    paq 'nvim-treesitter/nvim-treesitter'
    require "nvim-treesitter.configs".setup {
        highlight = {
            enable = true,
        },
        incremental_selection = {
            enable = false
        },
        refactor = {
            highlight_definitions = {
                enable = true
            },
            highlight_current_scope = {
                enable = false
            },
            smart_rename = {
                enable = true,
                keymaps = {
                    smart_rename = "<f3>"
                }
            },
            navigation = {
                enable = false,
            }
        },
        textobjects = {
            select = {
                enable = true,
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = "@function.outer",
                }
            }
        },
        indent = {
            enable = true
        },
        ensure_installed = "maintained",
    }
end

local function colorizer()
    paq 'norcalli/nvim-colorizer.lua'
    require "colorizer".setup()
end

-- local function completion()
--     paq 'nvim-lua/completion-nvim'
--     paq 'steelsojka/completion-buffers'

--     vim.g.completion_enable_auto_paren = 0
--     vim.g.completion_confirm_key = "<cr>"
--     vim.g.completion_enable_auto_hover = 1
--     vim.g.completion_enable_auto_signature = 1
--     vim.g.completion_enable_snippet = "UltiSnips"
--     api.nvim_exec(
--         [[
--     inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
--     inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
--       ]],
--         ""
--     )
--     vim.g.completion_chain_complete_list = {
--         default = {
--             {complete_items = {"lsp", "snippet"}},
--             {complete_items = { "buffer"}},
--             {mode = "<c-p>"},
--             {mode = "<c-n>"}
--         }
--     }

--     api.nvim_exec("au BufEnter * lua require'completion'.on_attach()", "")
-- end

local function compe() 
	paq 'hrsh7th/nvim-compe'

    require'compe'.setup {
      enabled = true;
      autocomplete = true;
      debug = false;
      min_length = 1;
      preselect = 'enable';
      throttle_time = 80;
      source_timeout = 200;
      incomplete_delay = 400;
      max_abbr_width = 100;
      max_kind_width = 100;
      max_menu_width = 100;

      source = {
        path = true;
        buffer = true;
        calc = true;
        vsnip = true;
        nvim_lsp = true;
        nvim_lua = true;
        spell = true;
        tags = true;
        snippets_nvim = true;
        treesitter = true;
      };
    }
end

local function vsnip()
   paq 'hrsh7th/vim-vsnip'
end

local function lsputils()
    paq 'RishabhRD/popfix'
    paq 'RishabhRD/nvim-lsputils'
    vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
    vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
    vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
    vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
    vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
    vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
    vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
    vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
    vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
end

local function lsp()
    paq 'neovim/nvim-lspconfig'
    paq 'nvim-lua/diagnostic-nvim'

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
      }
    )

	local function lsp_attach(client, bufnr)
		-- lsp_status.on_attach(client, bufnr)
		api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", keyopts)
		api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", keyopts)
		api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", keyopts)
		api.nvim_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", keyopts)
		api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", keyopts)
		api.nvim_set_keymap("n", "<RightMouse>", "<RightMouse><cmd>lua vim.lsp.buf.hover()<CR><esc>", keyopts)
		api.nvim_set_keymap("n", "<M-k>", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", keyopts)
		api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", keyopts)
		api.nvim_set_keymap("n", "<f2>", "<cmd>lua vim.lsp.buf.rename()<CR>", keyopts)
        api.nvim_set_keymap("n", "<space>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", keyopts)
		api.nvim_set_keymap("n", "<space>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", keyopts)
		api.nvim_set_keymap("n", "<space>ee", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", keyopts)
		api.nvim_set_keymap("n", "<space>en", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", keyopts)
		api.nvim_set_keymap("n", "<space>ep", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", keyopts)
		api.nvim_set_keymap("n", "<space>el", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", keyopts)
		api.nvim_set_keymap("n", "<space>i", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", keyopts)
		api.nvim_set_keymap("n", "<f8>", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", keyopts)
		api.nvim_exec("au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync({}, 300)", "")
		-- api.nvim_set_keymap("n", "<space>i", ":Vista finder<CR>", keyopts)
    end

    require "lspconfig".rust_analyzer.setup {on_attach = lsp_attach, settings = {
        ["rust-analyzer"] = {
		    diagnostics = {
			enable = true,
			disabled = {"unresolved-proc-macro"},
			enableExperimental = true
		    }
		}
    	}
    }
    require "lspconfig".jsonls.setup {on_attach = lsp_attach}
    require "lspconfig".tsserver.setup {on_attach = lsp_attach}
    require "lspconfig".gopls.setup {on_attach = lsp_attach}
    require "lspconfig".html.setup {on_attach = lsp_attach}
    require'lspconfig'.yamlls.setup{}
    -- require "lspconfig".sumneko_lua.setup {on_attach = lsp_attach}

    fn.sign_define("LspDiagnosticsSignError", {text = "⛔", texthl = "LspDiagnosticsSignError"})
    fn.sign_define("LspDiagnosticsSignWarning", {text = "⚑", texthl = "LspDiagnosticsSignWarning"})
    fn.sign_define("LspDiagnosticsSignInformation", {text = "", texthl = "LspDiagnosticsSignInformation"})
    fn.sign_define("LspDiagnosticsSignHint", {text = "ﯦ", texthl = "LspDiagnosticsSignInformation"})

    -- api.nvim_exec("au CursorHold * lua vim.lsp.util.show_line_diagnostics()", "")
end

local function fzf()
    paq 'junegunn/fzf'
    paq 'junegunn/fzf.vim'
    -- vim.g.fzf_layout = {window = {width = 1, height = 0.3, yoffset = 1}}
    -- vim.g.fzf_layout = {window = "30new"}
    vim.g.fzf_layout = {down = "40%"}
    vim.g.fzf_preview_window = "right:50%"
    vim.g.fzf_buffers_jump = 1
    vim.g.fzf_commits_log_options = "--graph --color=always --format='%C(auto)%h%d %s %C(black)%C(bold)%cr'"
    -- api.nvim_set_keymap("n", "<space>f", ":Files<CR>", keyopts)
    -- api.nvim_set_keymap("n", "<space>F", ":Files ~<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>s", ":MyRg<CR>", keyopts)
    api.nvim_set_keymap("n", "<C-f>", ":MyRg<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>S", ":MyRgHome<CR>", keyopts)
    -- api.nvim_set_keymap("n", "<space>b", ":Buffers<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>l", ":BLines<CR>", keyopts)
    -- api.nvim_set_keymap("n", "<space>h", ":History<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>i", ":BTags<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>I", ":Tags<CR>", keyopts)
    api.nvim_set_keymap("n", "<M-x>", ":Commands<cr>", keyopts)
    api.nvim_exec(
        [[
        au FileType fzf tnoremap <buffer> jk jk
        au FileType fzf tmap <buffer> <Esc> <c-g>
        au FileType fzf imap <buffer> <Esc> <c-g>
        au FileType fzf tmap <buffer> <C-j> <Down>
        au FileType fzf tmap <buffer> <Tab> <Down>
        au FileType fzf tmap <buffer> <S-Tab> <Up>
        au FileType fzf set laststatus=0 noshowmode
        au FileType fzf set laststatus=0
        au BufEnter term://*fzf* startinsert
        au BufLeave term://*fzf*  set laststatus=2
        command! -bang -nargs=* MyRgHome call fzf#vim#grep('rg --line-number --no-heading --color=never --smart-case -- '.shellescape(<q-args>).' ~', 1, fzf#vim#with_preview({'options': ['--preview-window=right:50%']}), <bang>0)
        command! -bang -nargs=* MyRg call fzf#vim#grep('rg --line-number --no-heading --color=never --smart-case -- '.shellescape(<q-args>), 1, fzf#vim#with_preview({'options': ['--preview-window=right:50%']}), <bang>0)
        command! -bang -nargs=* MyNotes call fzf#vim#grep("rg --line-number --no-heading --color=never --smart-case -e '^# ' -- ~/notes | sort -k5 -k4M -k3 -n --reverse | column -t -s\#", 1, fzf#vim#with_preview({'options': ['--preview-window=right:50%']}), <bang>0)
        let g:XXfzf_colors = { 'fg+':  ['fg', 'FZF'], 'bg+':  ['bg', 'FZF'], 'hl+':  ['fg', 'FZF'], 'pointer': ['fg', 'FZF'], 'marker': ['fg', 'Comment'], 'fg':  ['fg', 'Normal'], 'bg':  ['bg', 'Normal'], 'hl':  ['fg', 'keyword'], 'info': ['fg', 'Comment'], 'border': ['fg', 'VertSplit'], 'prompt': ['fg', 'Function'], 'spinner': ['fg', 'Label'], 'header': ['fg', 'Comment'],  'gutter': ['bg', 'Normal'],} 
        let g:XYfzf_colors = { 'fg+':  ['fg', 'FZF'], 'bg+':  ['bg', 'FZF'], 'hl+':  ['fg', 'FZF'], 'pointer': ['fg', 'FZF'], 'gutter': ['bg', 'Normal'], 'hl': ['fg', 'keyword'], 'header': ['fg', 'Function'], 'info': ['fg', 'Comment'], 'prompt': ['fg', 'Function']} 
        let g:fzf_action = { 'ctrl-o': '!xdg-open ', 'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit' }
    ]],
        ""
    )
end

local function anyjump()
    paq 'pechorin/any-jump.vim'
    vim.g.any_jump_window_width_ratio = 0.8
    vim.g.any_jump_window_height_ratio = 0.3
    api.nvim_set_keymap("n", "<space>j", ":AnyJump<cr>", keyopts)
end

local function easymotion()
    paq 'easymotion/vim-easymotion'
    vim.g.EasyMotion_keys = "abcdefghijklmnopqrstuvwxy"
    api.nvim_set_keymap("n", "f", "<Plug>(easymotion-bd-f)", {nowait = true, silent = true})
end

local function autopairs()
    paq 'windwp/nvim-autopairs'
    require('nvim-autopairs').setup()
end

local function signify()
    paq 'mhinz/vim-signify'
    vim.g.signify_line_highlight = 0
    vim.g.signify_disable_by_default = 1
end

local function vimrooter()
    paq 'airblade/vim-rooter'
    vim.g.rooter_change_directory_for_non_project_files = 'current'
    vim.g.rooter_silent_chdir = 1
    vim.g.rooter_patterns = {
        "project.clj",
        "deps.edn",
        "go.mod",
        "package.json",
        "build.sbt",
        "pom.xml",
        ".git"
    }
end

local function go()
    function Go_run()
        local cmd = "go run " .. fn.expand("%")

        vim.cmd("split term://" .. cmd)
        api.nvim_buf_set_keymap(0, "n", "q", "<C-\\><C-N>:close<cr>", keyopts)
        vim.cmd("normal G")
    end

    local cmds = {"run"}

    for _, cmd in pairs(cmds) do
        api.nvim_exec("command! Go" .. cmd .. "call v:lua.Go_" .. cmd .. "()", "")
        api.nvim_exec(
            "au FileType go nnoremap <silent><buffer><space>" ..
                string.sub(cmd, 1, 1) .. " :update<cr>:call v:lua.Go_" .. cmd .. "()<cr>",
            ""
        )
    end
end

local function cargo()
    function Cargo_run()
        local bin = fn.expand("%:t:r")
        local cmd = "cargo run"
        if bin ~= "main" then
            cmd = "cargo run --bin " .. bin
        end

        vim.cmd("split term://" .. cmd)
        api.nvim_buf_set_keymap(0, "n", "q", "<C-\\><C-N>:bd!<cr>", keyopts)
        -- vim.cmd("stopinsert")
        vim.cmd("normal G")
    end

    local function run_and_wait(cmd)
        vim.cmd("split")
        vim.cmd("enew")
        local jobid = fn.termopen(cmd)
        local _ = fn.jobwait({jobid})[0]
    end

    function Cargo_check()
        run_and_wait("cargo check")
        local line = fn.search("^error")
        if line == 0 then
            -- vim.cmd("echo 'No errors found!'")
            -- vim.cmd("normal G")
            -- vim.cmd("q")
            vim.cmd("echo 'OK!'")
        else
            vim.cmd("stopinsert")
            api.nvim_buf_set_keymap(0, "n", "q", "<C-\\><C-N>:bd!<cr>", keyopts)
        end
    end

    function Cargo_test()
        run_and_wait("cargo test")
        local line = fn.search("^error:")
        if line == 0 then
            vim.cmd("echo 'No errors found!'")
            vim.cmd("normal G")
        end
        -- vim.cmd("stopinsert")
        vim.cmd("nohl")
        api.nvim_buf_set_keymap(0, "n", "q", "<C-\\><C-N>:bd!<cr>", keyopts)
    end

    local cmds = {"run", "check", "test"}
    for _, cmd in pairs(cmds) do
        api.nvim_exec("command! Cargo" .. cmd .. "call v:lua.Cargo_" .. cmd .. "()", "")
        api.nvim_exec(
            "au FileType rust nnoremap <silent><buffer><space>" ..
                string.sub(cmd, 1, 1) .. " :update<cr>:call v:lua.Cargo_" .. cmd .. "()<cr>",
            ""
        )
    end
end

local function neoterm()
    paq 'kassio/neoterm'
    vim.g.neoterm_size = 25
    vim.g.neoterm_autoinsert = 1
    vim.g.neoterm_default_mod = "botright"

    api.nvim_set_keymap("n", "<C-j>", ":botright Ttoggle<cr>", keyopts)
    api.nvim_set_keymap("i", "<C-j>", "<C-\\><C-N><C-w><C-p>:botright Ttoggle<cr>", keyopts)
    api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-N><C-w><C-p>:botright Ttoggle<cr>", keyopts)
    api.nvim_exec(
        [[
    au TermOpen * setlocal nonumber 
    au FileType neoterm nnoremap <silent> <buffer> <C-j> <C-\><C-N><C-w><C-p>:Tclose<cr>
    au FileType neoterm nnoremap <silent> <buffer> q <C-\><C-N><C-w><C-p>:Tclose<cr>
    au FileType neoterm nnoremap <silent> <buffer> <C-q> <C-\><C-N><C-w><C-p>:Tclose<cr>
    au FileType neoterm inoremap <silent> <buffer> <C-q> <C-\><C-N><C-w><C-p>:Tclose<cr>
    au FileType neoterm tnoremap <silent> <buffer> <C-q> <C-\><C-N><C-w><C-p>:Tclose<cr>
    au FileType neoterm tnoremap <Esc> <c-\><c-n>
    au FileType neoterm tnoremap jk <c-\><c-n>
    ]],
        ""
    )
    -- au FileType neoterm tnoremap <silent> <buffer> <C-w><C-w> <C-\><C-N><C-w><C-w>
end

local function fugitive()
    paq 'tpope/vim-fugitive'
    api.nvim_set_keymap("n", "<C-x>g", ":Gstatus<cr>", keyopts)
end

local function rust()
    paq 'rust-lang/rust.vim'
    -- vim.g.rustfmt_autosave = 1
end

local function colors()
    api.nvim_exec(
        [[
    set background=dark
    colorscheme one
        ]],
        ""
    )
end

local function align()
    paq 'junegunn/vim-easy-align'
end

local function statusline()
    -- vim.o["statusline"] =
    --     "%* [%{split(getcwd(),'/')[-1]}]/%f%{&modified?'*':''} %{luaeval('#vim.lsp.buf_get_clients() > 0')? luaeval('require(\"lsp-status\").status()') : ''} %= %l,%.4c %{exists('g:loaded_fugitive')? '' . fugitive#head() :''} %y %{&fileencoding?&fileencoding:&encoding} "
	paq 'hoob3rt/lualine.nvim'
	require('lualine').setup{
        sections = {
			lualine_a = {'mode'},
        	lualine_b = {'branch'},
			lualine_c = { {'filename', full_path= true }},
        	lualine_x = {'', 'filetype', 'encoding'},
        	lualine_y = {''},
        	lualine_z = {'location'}
		},
        extensions = { 'fzf' },
		options = {
			theme = 'onedark', 
			section_separators = '', 
			component_separators = ''}
	}
end

local function telescope()
	paq 'nvim-lua/popup.nvim'
	paq 'nvim-lua/plenary.nvim'
	paq 'nvim-telescope/telescope.nvim'
    -- paq 'nvim-telescope/telescope-fzy-native.nvim'

    api.nvim_set_keymap("n", "<space>f", ":Telescope find_files<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>n", ":Telescope file_browser<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>h", ":Telescope oldfiles<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>b", ":Telescope buffers<CR>", keyopts)

    local actions = require('telescope.actions')
    require('telescope').setup{
        defaults = {
            scroll_strategy = nil,
            shorten_path = false,
            prompt_position = "bottom",
            prompt_prefix="🔍 ",
            selection_caret = "▶ ",
            mappings = {
                i = {
                    ["<PageDown>"] = actions.preview_scrolling_down,
                    ["<PageUp>"] = actions.preview_scrolling_up,
                },
                n = {
                    ["<PageDown>"] = actions.preview_scrolling_down,
                    ["<PageUp>"] = actions.preview_scrolling_up,
                }
            }
        },
    }
    -- require('telescope').load_extension('fzy_native')
end

local function bufferline()
	paq 'romgrk/barbar.nvim'
    api.nvim_set_keymap("n", "<C-l>", ":BufferNext<CR>", keyopts)
    api.nvim_set_keymap("n", "<C-h>", ":BufferPrevious<CR>", keyopts)
end

function Setup()
	-- set colors first
    colors()

    for _, setup in pairs(settings) do
        setup()
    end

    -- Plugins
    paq 'mbbill/undotree'
    paq 'cespare/vim-toml'
    paq 'farmergreg/vim-lastplace'
    paq 'tpope/vim-commentary'
    paq 'tpope/vim-surround'
    paq 'kyazdani42/nvim-web-devicons'
    -- paq 'ryanoasis/vim-devicons'
    statusline()
    bufferline()
    align()
    vimrooter()
    fugitive()
    easymotion()
    autopairs()
    fzf()
    telescope()
    neoterm()
    anyjump()
    signify()
    treesitter()
    colorizer()
    -- rust()

    compe()
    -- vsnip()
    -- completion()

    -- lsp
    lsp()
    -- lspstatus()
    lsputils()

    -- Misc config
    cargo()
    go()
end

Setup()
