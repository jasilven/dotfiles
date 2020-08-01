local vim = vim
local api = vim.api

local M = {}
local keyopts = {nowait = true, noremap = true, silent = true}

local keymaps = {
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x"}, lhs = "<C-g>", rhs = "<Esc>"},
    {mods = {"i"}, lhs = "jk", rhs = "<Esc>"},
    {mods = {"n"}, lhs = "<RightMouse>", rhs = "<LeftMouse>gdzz"},
    {mods = {"n"}, lhs = "<MiddleMouse>", rhs = "<C-o>", {noremap = false}},
    {mods = {"n"}, lhs = "gf", rhs = "<C-w>vgF", {noremap = false}},
    {mods = {"n"}, lhs = "<C-q>", rhs = ":close<cr>"},
    {mods = {"n"}, lhs = "<C-x>g", rhs = ":Gstatus<cr>"},
    {mods = {"n", "v"}, lhs = "<M-j>", rhs = "}"},
    {mods = {"n", "v"}, lhs = "<M-k>", rhs = "{"},
    {mods = {"n"}, lhs = "*", rhs = ":let @/='\\V\\<'.escape(expand('<cword>'), '\\').'\\>'<cr>:set hls<cr>"},
    {mods = {"n"}, lhs = "<space><tab>", rhs = ":b#<cr>"},
    {mods = {"n"}, lhs = "<space>o", rhs = ":only<cr>"},
    {mods = {"n"}, lhs = "<space>w", rhs = ":update<cr>"},
    {mods = {"n"}, lhs = "<space>Q", rhs = ":wqa<cr>"},
    {mods = {"n"}, lhs = "Q", rhs = ":wqa<cr>"},
    {mods = {"n"}, lhs = "<space>q", rhs = ":close<cr>"},
    {mods = {"n"}, lhs = "dh", rhs = "d0"},
    {mods = {"n"}, lhs = "dl", rhs = "d$"},
    {mods = {"n", "v"}, lhs = "gh", rhs = "0"},
    {mods = {"n", "v"}, lhs = "gl", rhs = "$"},
    {mods = {"n", "v"}, lhs = "gm", rhs = "%"},
    {mods = {"n"}, lhs = "go", rhs = "<C-w>w"},
    {mods = {"n"}, lhs = "yh", rhs = "y0"},
    {mods = {"n"}, lhs = "yl", rhs = "y$"},
    {mods = {"!"}, lhs = "<C-q>", rhs = "<C-\\><C-N>:bd!<cr>"},
    {mods = {"!"}, lhs = "<C-w><C-w>", rhs = "<C-\\><C-N><C-w>w"},
    {mods = {"!"}, lhs = "<C-w>w", rhs = "<C-\\><C-N><C-w>w"},
    {mods = {"!"}, lhs = "<C-w>h", rhs = "<C-\\><C-N><C-w>h"},
    {mods = {"!"}, lhs = "<C-w>j", rhs = "<C-\\><C-N><C-w>j"},
    {mods = {"!"}, lhs = "<C-w>k", rhs = "<C-\\><C-N><C-w>k"},
    {mods = {"!"}, lhs = "<C-w>l", rhs = "<C-\\><C-N><C-w>l"},
    {mods = {"!"}, lhs = "<Esc>", rhs = "<C-\\><C-N>"},
    {mods = {"n"}, lhs = "<f1>", rhs = ":help <C-r><C-w><cr>"}
}

-- local function setup_plugins()
--     -- Only required if you have packer in your `opt` pack
--     vim.cmd [[packadd packer.nvim]]
--     -- Temporary until https://github.com/neovim/neovim/pull/12632 is merged
--     vim._update_package_paths()

--     local packer = require("packer")
--     -- packer.init({package_root = "/home/jari/.local/share/nvim/site/pack"})
--     packer.init()
--     packer.startup(
--         function()
--             -- Packer can manage itself as an optional plugin
--             use {"wbthomason/packer.nvim", opt = true}
--             use "9mm/vim-closer"
--             use "SirVer/ultisnips"
--             use "airblade/vim-gitgutter"
--             use "airblade/vim-rooter"
--             use "cespare/vim-toml"
--             use "easymotion/vim-easymotion"
--             use "farmergreg/vim-lastplace"
--             use "gruvbox-community/gruvbox"
--             use {"guns/vim-sexp", ft = {"clojure"}}
--             use "honza/vim-snippets"
--             use {"jasilven/redbush", run = "cargo install --path ."}
--             use "jiangmiao/auto-pairs"
--             use "junegunn/fzf"
--             use "junegunn/fzf.vim"
--             use "kassio/neoterm"
--             use "kyazdani42/nvim-tree.lua"
--             use "kyazdani42/nvim-web-devicons"
--             use "liuchengxu/vista.vim"
--             use "ludovicchabant/vim-gutentags"
--             use "majutsushi/tagbar"
--             use "mbbill/undotree"
--             use "neovim/nvim-lsp"
--             use "norcalli/nvim-colorizer.lua"
--             use "nvim-lua/completion-nvim"
--             use "steelsojka/completion-buffers"
--             use "nvim-treesitter/nvim-treesitter"
--             use "pechorin/any-jump.vim"
--             use "pseewald/vim-anyfold"
--             use "sbdchd/neoformat"
--             use "sheerun/vim-polyglot"
--             use "tpope/vim-commentary"
--             use "tpope/vim-fugitive"
--             use "tpope/vim-surround"
--             use "nvim-lua/diagnostic-nvim"
--         end
--     )
-- end

local function setup_options()
    vim.o["autoread"] = true
    vim.o["clipboard"] = "unnamedplus"
    vim.o["completeopt"] = "menuone,noinsert,noselect"
    vim.o["confirm"] = true
    vim.o["cursorline"] = true
    vim.o["encoding"] = "utf-8"
    vim.o["fileencoding"] = "utf-8"
    vim.o["spelllang"] = "en_us"
    vim.o["expandtab"] = true
    vim.o["fillchars"] = "eob: ,vert:│"
    vim.o["guicursor"] = "n-v-c:block-Cursor/lCursor-blinkon0,i-ci-ve:ver30-Cursor/lCursor,r-cr:hor20-Cursor/lCursor"
    vim.o["hidden"] = true
    vim.o["hlsearch"] = true
    vim.o["ignorecase"] = true
    vim.o["inccommand"] = "nosplit"
    vim.o["incsearch"] = true
    vim.o["lazyredraw"] = true
    vim.o["linebreak"] = true
    vim.o["listchars"] = "tab:→ ,space:·,nbsp:␣,trail:•,eol:$,precedes:«,extends:»"
    vim.o["mouse"] = "a"
    vim.o["backup"] = false
    vim.o["list"] = false
    vim.o["showcmd"] = false
    vim.o["showmode"] = false
    vim.o["spell"] = false
    vim.o["swapfile"] = false
    vim.o["wrap"] = false
    vim.o["scrolloff"] = 2
    vim.o["sessionoptions"] = "blank,curdir,help,tabpages,winsize"
    vim.o["shiftwidth"] = 2
    vim.o["shortmess"] = "Ic"
    vim.o["showmatch"] = true
    vim.o["smartindent"] = true
    vim.o["softtabstop"] = 2
    vim.o["splitbelow"] = true
    vim.o["splitright"] = true
    vim.o["synmaxcol"] = 120
    vim.o["tabstop"] = 2
    vim.o["termguicolors"] = true
    vim.o["ttyfast"] = true
    vim.o["undofile"] = true
    vim.o["updatetime"] = 300
    vim.o["wildignore"] = "*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*/.git/*,*/target/*,*~,tags"
    vim.o["wildmenu"] = true
    vim.o["wildmode"] = "list:longest,full"
    vim.wo["foldenable"] = false
    vim.wo["number"] = true
    vim.wo["signcolumn"] = "yes:1"
end

local function setup_general()
    api.nvim_exec(
        [[
    au TextYankPost * silent! lua vim.highlight.on_yank()
    command! -bar -range Execute silent <line1>,<line2>yank z | let @z = substitute(@z, '\n\s*\\', '', 'g') | @z
  ]],
        ""
    )
end
local function setup_treesitter()
    require "nvim-treesitter.configs".setup {
        highlight = {
            enable = true,
            disable = {"json"},
            custom_captures = {}
        },
        incremental_selection = {
            enable = false,
            disable = {"cpp", "lua"},
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm"
            }
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
                enable = true,
                keymaps = {
                    goto_definition = "gnd",
                    list_definitions = "gnD"
                }
            }
        },
        textobjects = {
            enable = true,
            disable = {},
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["aC"] = "@class.outer",
                ["iC"] = "@class.inner",
                ["ac"] = "@conditional.outer",
                ["ic"] = "@conditional.inner",
                ["ae"] = "@block.outer",
                ["ie"] = "@block.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
                ["is"] = "@statement.inner",
                ["as"] = "@statement.outer",
                ["ad"] = "@comment.outer",
                ["am"] = "@call.outer",
                ["im"] = "@call.inner"
            }
        },
        ensure_installed = {"c", "html", "lua", "rust", "javascript", "go", "typescript", "java", "python"}
    }
end

local function setup_colorizer()
    -- require "colorizer".setup(nil, {css = true})
    require "colorizer".setup()
end

local function setup_luatree()
    vim.g.lua_tree_bindings = {
        edit = "<CR>",
        edit_vsplit = "v",
        edit_split = "s",
        edit_tab = "!",
        toggle_ignored = "I",
        cd = "R"
    }
    vim.g.lua_tree_icons = {default = ""}
    vim.g.lua_tree_ignore = {".git", "node_modules", ".cache", "target"}
    vim.g.lua_tree_follow = 1
    api.nvim_exec("au FileType LuaTree nnoremap <buffer> q :LuaTreeClose<cr>", "")

    function Tree_toggle()
        if require "lib.lib".win_open() then
            vim.cmd("LuaTreeClose")
        else
            if vim.bo["filetype"] == "" then
                vim.cmd("LuaTreeOpen")
            else
                vim.cmd("LuaTreeFindFile")
            end
        end
    end

    api.nvim_exec("command! TreeToggle call v:lua.Tree_toggle()", "")
    api.nvim_set_keymap("n", "<C-n>", ":TreeToggle<cr>", keyopts)
end

local function setup_lsp()
    local function lsp_attach()
        require "completion".on_attach()
        require "diagnostic".on_attach()

        local opts = {nowait = true, noremap = true, silent = true, expr = true}
        api.nvim_set_keymap("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], opts)
        api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], opts)
    end

    require "nvim_lsp".sumneko_lua.setup {on_attach = lsp_attach}
    require "nvim_lsp".rust_analyzer.setup {on_attach = lsp_attach}
    require "nvim_lsp".jsonls.setup {on_attach = lsp_attach}
    require "nvim_lsp".vimls.setup {}
    api.nvim_exec("autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync({}, 1000)", "")
    api.nvim_set_keymap("n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", keyopts)
    api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", keyopts)
    api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", keyopts)
    api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", keyopts)
    api.nvim_set_keymap("n", "<f2>", "<cmd>lua vim.lsp.buf.rename()<CR>", keyopts)
    vim.fn.sign_define("LspDiagnosticsErrorSign", {text = "✗", texthl = "LspDiagnosticsErrorSign"})
    vim.fn.sign_define("LspDiagnosticsWarningSign", {text = "", texthl = "LspDiagnosticsWarningSign"})
    vim.fn.sign_define("LspDiagnosticInformationSign", {text = "", texthl = "LspDiagnosticsInformationSign"})
    vim.fn.sign_define("LspDiagnosticHintSign", {text = "ﯦ", texthl = "LspDiagnosticsHintSign"})
    api.nvim_exec(
        [[
sign define LspDiagnosticsErrorSign text=✗ texthl=LspDiagnosticsError linehl= numhl=
sign define LspDiagnosticsWarningSign text=! texthl=LspDiagnosticsWarning linehl= numhl=
sign define LspDiagnosticsInformationSign text=i texthl=LspDiagnosticsInformation linehl= numhl=
sign define LspDiagnosticsHintSign text=★ texthl=LspDiagnosticsHint linehl= numhl=
    ]],
        ""
    )
end

local function setup_fzf()
    -- vim.g.fzf_layout = {down = "~18%"}
    vim.g.fzf_layout = {window = "call v:lua.Float_fzf()"}
    vim.g.fzf_preview_window = "right:50%"
    vim.g.fzf_buffers_jump = 1
    -- vim.g.fzf_colors["border"] = {fg = "Keyword"}
    api.nvim_set_keymap("n", "<space>f", ":Files<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>b", ":Buffers<CR>", keyopts)
    api.nvim_set_keymap("n", "<C-f>", ":Rg<CR>", keyopts)
    api.nvim_set_keymap("n", "<C-p>", ":GFiles<CR>", keyopts)
    api.nvim_set_keymap("n", "<C-s>", ":BLines<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>h", ":History<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>i", ":BTags<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>I", ":Tags<CR>", keyopts)

    function Float_fzf()
        local buf = api.nvim_create_buf(false, true)
        api.nvim_buf_set_var(buf, "&signcolumn", "no")

        local col = 0
        local height = 20
        local row = api.nvim_win_get_height(0) - height + 1
        local width = api.nvim_win_get_width(0) - 2 * col
        local opts = {
            relative = "cursor",
            row = row,
            col = col,
            width = width,
            height = height,
            style = "minimal"
        }
        api.nvim_open_win(buf, true, opts)
    end
    api.nvim_exec(
        "command! -bang -nargs=* Rg" ..
            " call fzf#vim#grep(" ..
                "'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1," ..
                    "fzf#vim#with_preview({'options': ['--layout=reverse'] }), <bang>0)",
        ""
    )

    local fmt =
        "command! -bang -nargs=* -complete=dir %s call fzf#vim#%s(%s fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)"
    api.nvim_exec(string.format(fmt, "Files", "files", "<q-args>,"), "")
    api.nvim_exec(string.format(fmt, "Buffers", "buffers", "<q-args>,"), "")
    api.nvim_exec(string.format(fmt, "History", "history", ""), "")
    api.nvim_exec(string.format(fmt, "BLines", "buffer_lines", ""), "")
    api.nvim_exec(
        [[au FileType fzf set laststatus=0 noruler]] .. [[ | autocmd BufLeave <buffer> set laststatus=2 ruler]],
        ""
    )
    api.nvim_exec("au FileType fzf tnoremap <Esc> <c-g>", "")
end

local function setup_ripgrep()
    api.nvim_set_option("grepprg", "rg --no-heading --vimgrep")
    api.nvim_set_option("grepformat", "%f:%l:%c:%m")
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

local function setup_anyjump()
    vim.g.any_jump_window_width_ratio = 0.8
    vim.g.any_jump_window_height_ratio = 0.3
    api.nvim_set_keymap("n", "<space>j", ":AnyJump<cr>", keyopts)
end

local function setup_easymotion()
    vim.g.EasyMotion_keys = "abcdefghijklmnopqrstuvwxy"
    api.nvim_set_keymap("n", "f", "<Plug>(easymotion-bd-f)", {nowait = true, silent = true})
end

local function setup_tagbar()
    vim.g.tagbar_left = 1
    vim.g.tagbar_compact = 1
    vim.g.tagbar_width = 25
    vim.g.tagbar_indent = 1
    api.nvim_set_keymap("n", "<C-t>", ":TagbarToggle<cr>", keyopts)
end

local function setup_autopairs()
    vim.g.autoPairsShortcutToggle = ""
    vim.g.AutoPairsShortcutJump = ""
    vim.g.AutoPairsShortcutBackInsert = ""
    vim.g.AutoPairsShortcutFastWrap = ""
end

local function setup_gitgutter()
    vim.g.gitgutter_sign_modified = "~"
    vim.g.gitgutter_sign_added = "+"
    vim.g.gitgutter_sign_removed = "-"
    vim.g.gitgutter_sign_modified_removed = "-"
    vim.g.gitgutter_override_sign_column_highlight = 1
    vim.g.gitgutter_sign_allow_clobber = 1
    vim.g.gitgutter_set_sign_backgrounds = 0
    vim.g.gitgutter_preview_win_floating = 1
end

local function setup_rooter()
    vim.g.rooter_silent_chdir = 1
    vim.g.rooter_patterns = {"project.clj", "deps.edn", ".git/", "Cargo.toml", "go.mod"}
end

local function setup_gutentags()
    vim.g.gutentags_ctags_exclude = {
        "*.min.js",
        "*.min.css",
        "build",
        "vendor",
        ".git",
        "node_modules",
        "*.vim/bundle/*",
        "target",
        "classes",
        ".cache"
    }
end

local function setup_completion()
    vim.g.completion_enable_snippet = "UltiSnips"
    vim.g.completion_chain_complete_list = {
        default = {
            {complete_items = {"lsp", "snippet"}},
            {complete_items = {"buffers"}},
            {mode = "<c-p>"},
            {mode = "<c-n>"}
        }
    }
end

local function setup_neoformat()
    vim.g.neoformat_only_msg_on_error = 1
    api.nvim_exec("au FileType lua,json nnoremap <buffer> <space>F :Neoformat<cr>", "")
    api.nvim_exec(
        [[
    augroup fmt
      autocmd!
      autocmd BufWritePre *.lua,*.json undojoin | Neoformat
    augroup END
  ]],
        ""
    )
end

local function setup_vista()
    vim.g.vista_default_executive = "nvim_lsp"
    vim.g.vista_executive_for = {rust = "nvim_lsp"}
    vim.g.vista_executive_for = {json = "nvim_lsp"}
    vim.g.vista_executive_for = {lua = "nvim_lsp"}
    vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}
end

local function setup_statusline()
    api.nvim_set_option(
        "statusline",
        '%* %F  %{exists("g:loaded_fugitive")?fugitive#statusline():""} %m %= %l,%.4c  %y %{&fileencoding?&fileencoding:&encoding} '
    )
end

local function setup_cargo_cmds()
    function Cargo_run()
        local bin = vim.fn.expand("%:t:r")
        local cmd = "cargo run"
        if bin ~= "main" then
            cmd = "cargo run --bin " .. bin
        end

        vim.cmd("split term://" .. cmd)
        api.nvim_buf_set_keymap(0, "n", "q", "<C-\\><C-N>:close<cr>", keyopts)
    end

    local function run_and_wait(cmd)
        vim.cmd("split")
        vim.cmd("enew")
        local jobid = vim.fn.termopen(cmd)
        local status = vim.fn.jobwait({jobid})[0]
    end

    function Cargo_check()
        run_and_wait("cargo check")
        local line = vim.fn.search("^error:")
        if line == 0 then
            vim.cmd("echo 'No errors found!'")
            vim.cmd("normal G")
        end
        api.nvim_buf_set_keymap(0, "n", "q", "<C-\\><C-N>:close<cr>", keyopts)
    end

    function Cargo_test()
        run_and_wait("cargo test")
        local line = vim.fn.search("^error:")
        if line == 0 then
            vim.cmd("echo 'No errors found!'")
            vim.cmd("normal G")
        end
        vim.cmd("nohl")
        api.nvim_buf_set_keymap(0, "n", "q", "<C-\\><C-N>:close<cr>", keyopts)
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

local function setup_diagnostics()
    vim.g.diagnostic_enable_virtual_text = 1
    vim.g.diagnostic_virtual_text_prefix = " "
    vim.g.diagnostic_trimmed_virtual_text = "80"
    vim.g.diagnostic_enable_underline = 1
    vim.g.diagnostic_insert_delay = 1
end

local function setup_sexp()
    vim.gsexp_filetypes = ""
    api.nvim_exec(
        [[
    au FileType clojure nmap <silent><buffer> <M-h>  <Plug>(sexp_emit_tail_element)
    au FileType clojure imap <silent><buffer> <M-h>  <esc><Plug>(sexp_emit_tail_element)i
    au FileType clojure nmap <silent><buffer> <M-l>  <Plug>(sexp_capture_next_element)
    au FileType clojure imap <silent><buffer> <M-l>  <esc><Plug>(sexp_capture_next_element)i
    ]],
        ""
    )
end

local function setup_conjure()
    vim.g.conjure_log_blacklist = {"up", "ret", "load-file", "eval"}
    vim.g.conjure_default_mappings = false
    vim.g.conjure_log_direction = "vertical"
    vim.g.conjure_omnifunc = false
    vim.g.conjure_log_auto_close = false
    vim.g.conjure_fold_multiline_results = true
    vim.g.conjure_quick_doc_time = 600
    vim.g.conjure_quick_doc_insert_mode = false
    vim.g.conjure_quick_doc_normal_mode = false
    api.nvim_exec(
        [[
    au FileType clojure nnoremap <buffer> <C-c><C-k> :ConjureEvalBuffer<cr>
    au FileType clojure nnoremap <buffer> <C-c>k :ConjureEvalBuffer<cr>
    au FileType clojure nnoremap <buffer> <C-c><C-p> :ConjureToggleLog<cr>
    au FileType clojure nnoremap <buffer> <C-c>p :ConjureToggleLog<cr>
    au FileType clojure nnoremap <buffer> <space>e :ConjureEvalCurrentForm<cr>
    au FileType clojure nnoremap <buffer> <space>x :ConjureEvalRootForm<cr>
    au FileType clojure nnoremap <buffer> <space>r :ConjureEvalCurrentForm<cr>
    au FileType clojure nnoremap <buffer> <space>t :ConjureRunTests<cr>
    au BufEnter */conjure.cljc nnoremap <buffer> q :ConjureCloseLog<CR>
    au BufEnter */conjure.cljc setlocal nonumber
    ]],
        ""
    )
end

local function setup_anyjump()
    api.nvim_exec(
        [[
au Filetype * AnyFoldActivate
au BufReadPre,BufRead,BufWinEnter,BufNewFile,BufEnter conjure.cljc setlocal foldmethod=marker
    ]],
        ""
    )
end

local function setup_neoterm()
    vim.g.neoterm_size = 25
    vim.g.neoterm_autoinsert = 1
    vim.g.neoterm_default_mod = "botright"

    api.nvim_exec(
        [[
    au TermOpen * setlocal nonumber 
    au FileType neoterm nnoremap <silent> <buffer> go <C-w>p
    au FileType neoterm nnoremap <silent> <buffer> <C-j> <C-\><C-N><C-w><C-p>:Tclose<cr>
    au FileType neoterm nnoremap <silent> <buffer> q <C-\><C-N><C-w><C-p>:Tclose<cr>
    au FileType neoterm nnoremap <silent> <buffer> <C-q> <C-\><C-N><C-w><C-p>:Tclose<cr>
    au FileType neoterm inoremap <silent> <buffer> <C-q> <C-\><C-N><C-w><C-p>:Tclose<cr>
    au FileType neoterm inoremap <silent> <buffer> <C-w>p <C-\><C-N><C-w>p
    au FileType neoterm tnoremap <silent> <buffer> <C-q> <C-\><C-N><C-w><C-p>:Tclose<cr>
    au FileType neoterm tnoremap <Esc> <c-\><c-n>
    au FileType neoterm tnoremap jk <c-\><c-n>
    nnoremap <silent> <C-j> :botright Ttoggle<cr>
    inoremap <silent> <C-j> :botright Ttoggle<cr>
    tnoremap <silent> <C-j> <C-\><C-N><C-w><C-p>:botright Ttoggle<cr>
    ]],
        ""
    )
end

local function setup_theme()
    -- if !exists("g:syntax_on") | syntax enable | endif " syntax enable
    vim.g.gruvbox_sign_column = "bg0"
    api.nvim_set_option("background", "light")
    -- api.nvim_set_option("colorscheme", "gruvbox")
    vim.cmd("colorscheme gruvbox")
    api.nvim_exec(
        [[
    hi! rustmodpathseparator ctermfg=NONE 
    hi! delimiter ctermfg=NONE
    hi! link tablinefill statusline
    hi! signcolumn ctermbg=NONE 
    hi! link cocwarningvirtualtext comment
    hi! link cocrustchaininghint comment
    hi! link visual folded
    hi! link LspDiagnosticsError GruvBoxRed 
    hi! link LspDiagnosticsWarning GruvBoxYellow
    hi! link LspDiagnosticsHint comment 
    hi! link LspDiagnosticsInformation comment
        ]],
        ""
    )
end

local function setup_redbush()
    vim.g.redbush_bin = "redbush" -- '/home/jari/dev/rust/redbush/target/debug/redbush'
    vim.g.redbush_filepath = "/tmp/redbush-eval.clj"
    vim.g.redbush_filesize = 1000
    vim.g.redbush_is_vertical = true
    vim.g.redbush_winsize = 40
end

local function setup_mytest()
    function Mytest()
        local result = vim.fn.systemlist("git diff-tree --no-commit-id --name-only -r HEAD")

        for k, _ in pairs(result) do
            result[k] = "  " .. result[k]
        end
        local buf = api.nvim_create_buf(false, true)
        api.nvim_buf_set_lines(buf, 0, -1, false, result)

        local width = api.nvim_get_option("columns")
        local height = api.nvim_get_option("lines")
        local win_height = math.ceil(height * 0.3 - 4)
        local win_width = math.ceil(width * 0.8)

        local row = math.ceil((height - win_height) / 2 - 1)
        local col = math.ceil((width - win_width) / 2)
        local opts = {
            style = "minimal",
            relative = "editor",
            width = win_width,
            height = win_height,
            row = row,
            col = col
        }
        api.nvim_buf_set_keymap(buf, "n", "q", ":close<cr>", keyopts)
        local _ = api.nvim_open_win(buf, true, opts)
    end

    api.nvim_exec("command! Mytest v:lua.Mytest()", "")
end

function M.setup()
    -- setup_plugins()

    for _, keymap in pairs(keymaps) do
        for _, mod in pairs(keymap.mods) do
            api.nvim_set_keymap(mod, keymap.lhs, keymap.rhs, keymap.opt or {nowait = true, noremap = true})
        end
    end

    setup_options()
    setup_general()

    -- plugin setup
    setup_luatree()
    setup_fzf()
    setup_ripgrep()
    setup_anyjump()
    setup_easymotion()
    setup_tagbar()
    setup_gutentags()
    setup_completion()
    setup_autopairs()
    setup_rooter()
    setup_gitgutter()
    setup_neoformat()
    setup_vista()
    setup_diagnostics()
    setup_sexp()
    setup_conjure()
    setup_anyjump()
    setup_cargo_cmds()
    setup_statusline()
    setup_neoterm()
    setup_theme()
    setup_redbush()
    setup_treesitter()
    setup_colorizer()
    setup_lsp()
    setup_anyjump()

    -- misc testing thing for :Mytest-command
    setup_mytest()
end

return M
