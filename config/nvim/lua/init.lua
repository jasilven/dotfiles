local vim = vim
local api = vim.api
local fn = vim.fn
local keyopts = {nowait = true, noremap = true, silent = true}

function Setup_keymaps()
    local keymaps = {
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x"}, lhs = "<C-g>", rhs = "<Esc>"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-S-Right>", rhs = "<C-\\><C-N>:bnext<cr>"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-S-Left>", rhs = "<C-\\><C-N>:bprev<cr>"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-Right>", rhs = "<C-\\><C-N>:bnext<cr>"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-Left>", rhs = "<C-\\><C-N>:bprev<cr>"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-l>", rhs = "<C-\\><C-N>:bnext<cr>"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-h>", rhs = "<C-\\><C-N>:bprev<cr>"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<M-k>", rhs = "<C-\\><C-N><C-w>k"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<M-j>", rhs = "<C-\\><C-N><C-w>j"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<M-h>", rhs = "<C-\\><C-N><C-w>h"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<M-l>", rhs = "<C-\\><C-N><C-w>l"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<M-up>", rhs = "<C-\\><C-N><C-w>k"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<M-down>", rhs = "<C-\\><C-N><C-w>j"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<M-left>", rhs = "<C-\\><C-N><C-w>h"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<M-right>", rhs = "<C-\\><C-N><C-w>l"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-t>", rhs = "<C-\\><C-N>:term<cr>"},
        {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-q>", rhs = "<C-\\><C-N>:bd!<cr>"},
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
        {mods = {"n", "i"}, lhs = "<C-q>", rhs = "<C-\\><C-N>:close<cr>"},
        {mods = {"n"}, lhs = "<C-S-up>", rhs = ":m .-2<CR>=="},
        {mods = {"n"}, lhs = "<C-S-Down>", rhs = ":m .+1<CR>=="},
        {mods = {"v"}, lhs = "<C-S-up>", rhs = ":m '<-2<CR>gv=gv"},
        {mods = {"v"}, lhs = "<C-S-Down>", rhs = ":m '>+1<CR>gv=gv"},
        {mods = {"n"}, lhs = "<RightMouse>", rhs = "<LeftMouse>gdzz"},
        {mods = {"n"}, lhs = "<MiddleMouse>", rhs = "<C-o>", {noremap = false}},
        {mods = {"n"}, lhs = "<space><tab>", rhs = "<C-^>"},
        {mods = {"n"}, lhs = "<space>o", rhs = ":only<cr>"},
        {mods = {"n"}, lhs = "<space>w", rhs = ":update<cr>"},
        {mods = {"n"}, lhs = "<space>Q", rhs = ":wqa<cr>"},
        {mods = {"n"}, lhs = "<space>q", rhs = "q"},
        {mods = {"n"}, lhs = "Q", rhs = ":wqa<cr>"},
        {mods = {"n"}, lhs = "q", rhs = ":close<cr>"},
        {mods = {"n"}, lhs = "gf", rhs = "<C-w>vgF", {noremap = false}},
        {mods = {"n"}, lhs = "dh", rhs = "d0"},
        {mods = {"n"}, lhs = "dl", rhs = "d$"},
        {mods = {"n"}, lhs = "go", rhs = "<C-w>w"},
        {mods = {"n"}, lhs = "yh", rhs = "y0"},
        {mods = {"n"}, lhs = "yl", rhs = "y$"},
        {mods = {"n"}, lhs = "<f1>", rhs = ":help <C-r><C-w><cr>"},
        {mods = {"t"}, lhs = "<C-q>", rhs = "<C-\\><C-N>:bd!<cr>"},
        {mods = {"n"}, lhs = "*", rhs = ":let @/='\\V\\<'.escape(expand('<cword>'), '\\').'\\>'<cr>:set hls<cr>"}
    }

    for _, keymap in pairs(keymaps) do
        for _, mod in pairs(keymap.mods) do
            api.nvim_set_keymap(mod, keymap.lhs, keymap.rhs, keymap.opt or {nowait = true, noremap = true})
        end
    end
end

function Setup_options()
    vim.o["autoread"] = true
    vim.o["backup"] = false
    vim.o["clipboard"] = "unnamedplus"
    vim.o["completeopt"] = "menuone,noinsert,noselect"
    vim.o["confirm"] = true
    vim.o["cursorline"] = true
    vim.o["encoding"] = "utf-8"
    vim.o["expandtab"] = true
    vim.o["fileencoding"] = "utf-8"
    vim.o["fillchars"] = "eob: ,vert:│"
    vim.o["guicursor"] = "n-v-c:block-Cursor/lCursor-blinkon0,i-ci-ve:ver40-Cursor/lCursor,r-cr:hor20-Cursor/lCursor"
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
    vim.o["shortmess"] = "Ic"
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
    vim.o["synmaxcol"] = 140
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
    vim.wo["foldenable"] = false
    vim.wo["number"] = true
    vim.wo["signcolumn"] = "yes:1"
end

function Setup_general()
    vim.o["statusline"] =
        " %*%F%{&modified?'*':''}  %{exists('g:loaded_fugitive')?''.fugitive#head():''} %= %l,%.4c  %y %{&fileencoding?&fileencoding:&encoding} "
    api.nvim_exec(
        [[
    au TermOpen * startinsert
    au Bufenter term://*zsh* startinsert
    au TextYankPost * silent! lua vim.highlight.on_yank()
    vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
    nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"  . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>
    command! -bar -range Execute silent <line1>,<line2>yank z | let @z = substitute(@z, '\n\s*\\', '', 'g') | @z
    command! -nargs=+ Grep execute 'silent grep! <args>' | copen 15
  ]],
        ""
    )
    -- api.nvim_set_option("grepprg", "rg --no-heading --vimgrep --smart-case")
    -- api.nvim_set_option("grepformat", "%f:%l:%c:%m")
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

function Setup_treesitter()
    require "nvim-treesitter.configs".setup {
        highlight = {
            enable = true,
            disable = {"Xlua"},
            custom_captures = {}
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
                enable = false,
                keymaps = {
                    smart_rename = "<f3>"
                }
            },
            navigation = {
                enable = false,
                keymaps = {
                    goto_definition = "gnd"
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
        ensure_installed = {"c", "html", "lua", "rust", "json", "javascript", "go", "typescript", "java", "python"}
    }
end

function Setup_colorizer()
    require "colorizer".setup(nil, {css = true})
    require "colorizer".setup()
end

function Setup_nvimtree()
    vim.g.lua_tree_bindings = {
        edit = "<CR>",
        edit_vsplit = "v",
        edit_split = "s",
        edit_tab = "!",
        toggle_dotfiles = "I",
        cd = "R"
    }
    vim.g.lua_tree_auto_close = 1
    vim.g.lua_tree_git_hl = 0
    vim.g.lua_tree_hide_dotfiles = 1
    vim.g.lua_tree_icons = {default = ""}
    vim.g.lua_tree_ignore = {".git", "node_modules", ".cache", "target"}
    vim.g.lua_tree_follow = 1

    function Tree_toggle()
        if require "lib.lib".win_open() then
            vim.cmd("LuaTreeClose")
        else
            if (vim.bo["filetype"] == "" or vim.bo["filetype"] == "startify" or vim.bo["filetype"] == "neoterm") then
                vim.cmd("LuaTreeOpen")
            else
                vim.cmd("LuaTreeFindFile")
            end
        end
    end

    api.nvim_exec(
        [[
        au FileType LuaTree nnoremap <buffer> q :LuaTreeClose<cr>
        command! TreeToggle call v:lua.Tree_toggle()
        ]],
        ""
    )
    api.nvim_set_keymap("n", "<C-n>", ":TreeToggle<cr>", keyopts)
    api.nvim_set_keymap("t", "<C-n>", "<C-\\><C-N>:TreeToggle<cr>", keyopts)
end

function Setup_lsp()
    local function setup_diagnostics()
        vim.g.diagnostic_enable_virtual_text = 1
        -- vim.g.diagnostic_virtual_text_prefix = ""
        vim.g.diagnostic_trimmed_virtual_text = "200"
        vim.g.diagnostic_enable_underline = 1
        vim.g.diagnostic_insert_delay = 0
        vim.g.diagnostic_auto_popup_while_jump = 1
        api.nvim_set_keymap("n", "<M-n>", ":NextDiagnosticCycle<CR>", keyopts)
        api.nvim_set_keymap("n", "<M-p>", ":PrevDiagnosticCycle<CR>", keyopts)
    end
    local function setup_completion()
        vim.g.completion_enable_auto_paren = 0
        vim.g.completion_confirm_key = "<cr>"
        vim.g.completion_enable_auto_hover = 1
        vim.g.completion_enable_auto_signature = 1
        vim.g.completion_enable_snippet = "UltiSnips"
        api.nvim_exec(
            [[
        inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
        inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
          ]],
            ""
        )
        vim.g.completion_chain_complete_list = {
            default = {
                {complete_items = {"lsp", "snippet"}},
                {complete_items = {"buffers"}},
                {mode = "<c-p>"},
                {mode = "<c-n>"}
            }
        }
    end

    local function lsp_attach(client, bufnr)
        require "completion".on_attach(client, bufnr)
        setup_completion()

        require "diagnostic".on_attach(client, bufnr)
        setup_diagnostics()
    end

    require "nvim_lsp".sumneko_lua.setup {on_attach = lsp_attach}
    require "nvim_lsp".rust_analyzer.setup {cmd = {"rust-analyzer"}, filetypes = {"rust"}, on_attach = lsp_attach}
    require "nvim_lsp".jsonls.setup {on_attach = lsp_attach}
    require "nvim_lsp".gopls.setup {on_attach = lsp_attach}
    require "nvim_lsp".vimls.setup {on_attach = lsp_attach}

    api.nvim_set_keymap("n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", keyopts)
    api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", keyopts)
    api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", keyopts)
    api.nvim_set_keymap("n", "<M-k>", "<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>", keyopts)
    api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", keyopts)
    api.nvim_set_keymap("n", "<f2>", "<cmd>lua vim.lsp.buf.rename()<CR>", keyopts)

    fn.sign_define("LspDiagnosticsErrorSign", {text = "⛔", texthl = "LspDiagnosticsErrorSign"})
    fn.sign_define("LspDiagnosticsWarningSign", {text = "⚑", texthl = "LspDiagnosticsWarningSign"})
    fn.sign_define("LspDiagnosticInformationSign", {text = "", texthl = "LspDiagnosticsInformationSign"})
    fn.sign_define("LspDiagnosticHintSign", {text = "ﯦ", texthl = "LspDiagnosticsHintSign"})

    -- api.nvim_exec("autocmd BufWritePre <silent> *.rs  lua vim.lsp.buf.formatting_sync(nil, 1000)", "")
end

function Setup_fzf()
    -- vim.g.fzf_layout = {down = "~18%"}
    -- vim.g.fzf_layout = {window = "call v:lua.Float_fzf()"}
    vim.g.fzf_layout = {window = {width = 1, height = 0.3, yoffset = 1}}
    -- vim.g.fzf_layout = {window = "13new"}

    vim.g.fzf_preview_window = "right:50%"
    vim.g.fzf_buffers_jump = 1
    vim.g.fzf_commits_log_options = "--graph --color=always --format='%C(auto)%h%d %s %C(black)%C(bold)%cr'"
    api.nvim_set_keymap("n", "<F12>", ":Colors<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>f", ":Files<CR>", keyopts)
    api.nvim_set_keymap("n", "<C-p>", ":Files ~<CR>", keyopts)
    api.nvim_set_keymap("n", "<C-s>", ":Rg<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>b", ":Buffers<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>l", ":BLines<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>L", ":RgHome<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>h", ":History<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>i", ":BTags<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>I", ":Tags<CR>", keyopts)
    api.nvim_set_keymap("n", "<M-x>", ":Commands<cr>", keyopts)
    api.nvim_set_keymap("n", "<space><space>", ":Commands<cr>", keyopts)
    api.nvim_set_keymap("n", "<C-f>", ":RgHome<cr>", {})
    api.nvim_exec(
        [[ 
        command! -bang -nargs=* RgHome call fzf#vim#grep('rg  --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>).' ~', 1, fzf#vim#with_preview({'options': ['--layout=reverse', '--preview-window=right:50%']}), <bang>0)
        let g:fzf_colors = { 'fg':  ['fg', 'Normal'], 'bg':  ['bg', 'Normal'], 'hl':  ['fg', 'Keyword'], 'fg+':  ['fg', 'Keyword', 'CursorColumn', 'Normal'], 'bg+':  ['bg', 'Keyword', 'CursorColumn'], 'hl+':  ['fg', 'Keyword'], 'info': ['fg', 'PreProc'], 'border': ['fg', 'Ignore'], 'prompt': ['fg', 'Conditional'], 'pointer': ['fg', 'Exception'], 'marker': ['fg', 'Keyword'], 'spinner': ['fg', 'Label'], 'header': ['fg', 'Comment'],  'gutter': ['bg', 'Normal'],} 
        let g:fzf_action = { 'ctrl-o': '!xdg-open ', 'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit' }
    ]],
        ""
    )

    api.nvim_exec("au FileType fzf tnoremap <Esc> <c-g>", "")
end

function Setup_anyjump()
    vim.g.any_jump_window_width_ratio = 0.8
    vim.g.any_jump_window_height_ratio = 0.3
    api.nvim_set_keymap("n", "<space>j", ":AnyJump<cr>", keyopts)
end

function Setup_easymotion()
    vim.g.EasyMotion_keys = "abcdefghijklmnopqrstuvwxy"
    api.nvim_set_keymap("n", "f", "<Plug>(easymotion-bd-f)", {nowait = true, silent = true})
end

function Setup_tagbar()
    vim.g.tagbar_left = 1
    vim.g.tagbar_compact = 1
    vim.g.tagbar_width = 25
    vim.g.tagbar_indent = 1
end

function Setup_autopairs()
    vim.g.autoPairsShortcutToggle = ""
    vim.g.AutoPairsShortcutJump = ""
    vim.g.AutoPairsShortcutBackInsert = ""
    vim.g.AutoPairsShortcutFastWrap = ""
    vim.g.AutoPairsShortcutToggle = ""
    vim.g.PairsShortcutJump = ""
end

function Setup_signify()
    vim.g.signify_line_highlight = 0
    vim.g.signify_disable_by_default = 1
    -- vim.g.gitgutter_override_sign_column_highlight = 0
    -- vim.g.gitgutter_sign_allow_clobber = 0
    -- vim.g.gitgutter_set_sign_backgrounds = 0
    -- vim.g.gitgutter_preview_win_floating = 1
end

function Setup_vimrooter()
    vim.g.rooter_silent_chdir = 1
    vim.g.rooter_patterns = {"project.clj", "deps.edn", ".git/", "Cargo.toml", "go.mod"}
end

function Setup_gutentags()
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

function Setup_neoformat()
    vim.g.neoformat_only_msg_on_error = 1
    -- api.nvim_exec([[ autocmd BufWritePre * undojoin | Neoformat ]], "")
end

function Setup_vista()
    vim.g.vista_default_executive = "nvim_lsp"
    vim.g.vista_executive_for = {rust = "nvim_lsp"}
    vim.g.vista_executive_for = {json = "nvim_lsp"}
    vim.g.vista_executive_for = {lua = "nvim_lsp"}
    vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}
end

function Setup_statusline()
end

function Setup_go()
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

function Setup_cargo()
    function Cargo_run()
        local bin = fn.expand("%:t:r")
        local cmd = "cargo run"
        if bin ~= "main" then
            cmd = "cargo run --bin " .. bin
        end

        vim.cmd("split term://" .. cmd)
        api.nvim_buf_set_keymap(0, "n", "q", "<C-\\><C-N>:bd!<cr>", keyopts)
        vim.cmd("stopinsert")
        vim.cmd("normal G")
    end

    local function run_and_wait(cmd)
        vim.cmd("split")
        vim.cmd("enew")
        local jobid = fn.termopen(cmd)
        local status = fn.jobwait({jobid})[0]
    end

    function Cargo_check()
        run_and_wait("cargo check")
        local line = fn.search("^error")
        if line == 0 then
            vim.cmd("echo 'No errors found!'")
            vim.cmd("normal G")
        end
        vim.cmd("stopinsert")
        api.nvim_buf_set_keymap(0, "n", "q", "<C-\\><C-N>:bd!<cr>", keyopts)
    end

    function Cargo_test()
        run_and_wait("cargo test")
        local line = fn.search("^error:")
        if line == 0 then
            vim.cmd("echo 'No errors found!'")
            vim.cmd("normal G")
        end
        vim.cmd("stopinsert")
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

function Setup_sexp()
    vim.g.sexp_filetypes = ""
    api.nvim_exec(
        [[
    au FileType clojure nmap <silent><buffer> <M-h> <Plug>(sexp_emit_tail_element)
    au FileType clojure imap <silent><buffer> <M-h> <esc><Plug>(sexp_emit_tail_element)i
    au FileType clojure nmap <silent><buffer> <M-l> <Plug>(sexp_capture_next_element)
    au FileType clojure imap <silent><buffer> <M-l> <esc><Plug>(sexp_capture_next_element)i
    ]],
        ""
    )
end

function Setup_conjure()
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

function Setup_neoterm()
    vim.g.neoterm_size = 25
    vim.g.neoterm_autoinsert = 1
    vim.g.neoterm_default_mod = "botright"

    api.nvim_set_keymap("n", "<C-j>", ":botright Ttoggle<cr>", keyopts)
    api.nvim_set_keymap("i", "<C-j>", "<C-\\><C-N><C-w><C-p>:botright Ttoggle<cr>", keyopts)
    api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-N><C-w><C-p>:botright Ttoggle<cr>", keyopts)
    api.nvim_exec(
        [[
    au TermOpen * setlocal nonumber 
    au FileType neoterm nnoremap <silent> <buffer> go <C-w>p
    au FileType neoterm nnoremap <silent> <buffer> <C-j> <C-\><C-N><C-w><C-p>:Tclose<cr>
    au FileType neoterm nnoremap <silent> <buffer> q <C-\><C-N><C-w><C-p>:Tclose<cr>
    au FileType neoterm nnoremap <silent> <buffer> <C-q> <C-\><C-N><C-w><C-p>:Tclose<cr>
    au FileType neoterm inoremap <silent> <buffer> <C-q> <C-\><C-N><C-w><C-p>:Tclose<cr>
    au FileType neoterm tnoremap <silent> <buffer> <C-w><C-w> <C-\><C-N><C-w><C-w>
    au FileType neoterm tnoremap <silent> <buffer> <C-q> <C-\><C-N><C-w><C-p>:Tclose<cr>
    au FileType neoterm tnoremap <Esc> <c-\><c-n>
    au FileType neoterm tnoremap jk <c-\><c-n>
    ]],
        ""
    )
end

function Setup_theme()
    function Mytheme(theme, bg)
        vim.o["background"] = bg or vim.o["background"]
        vim.cmd("colorscheme " .. (theme or vim.g.colors_name or "base16-tomorrow-night"))
        api.nvim_exec(
            [[
        hi! link TSError Normal
        hi! errormsg guibg=none
        hi! delimiter guifg=none
        hi! identifier guifg=none
        hi! operator guibg=none
        hi! link macro function
        hi! vertsplit guibg=none
        hi! type guifg=none
        hi! linenr guibg=none
        hi! signcolumn guibg=none
        hi! SignifySignAdd guibg=none
        hi! SignifySignChange guibg=none
        hi! SignifySignDelete guibg=none
        hi! SignifySignDeleteFirstLine guibg=none
        hi! gitgutteradd guibg=NONE 
        hi! gitgutterchange guibg=NONE 
        hi! gitgutterchangedelete guibg=NONE 
        hi! gitgutterdelete guibg=NONE 
        hi! link cocrustchaininghint nontext
        hi! link cocerrorfloat errormsg 
        hi! link cocerrorsign errormsg
        hi! link cocerrorvirtualtext comment
        hi! link lspdiagnosticserror errormsg
        hi! link lspdiagnosticswarning warningmsg
        hi! link lspdiagnosticsunderline underlined 
        hi! link cocwarningfloat warningmsg
        hi! link cocwarningsign comment 
        hi! link cocwarningsign warningmsg 
        hi! link cocwarningvirtualtext comment 
        hi! link character constant
        hi! rustenumvariant guifg=none
        hi! ruststorage guifg=none
        hi! rustsigil guifg=none
        hi! link rustattributeXX comment
        hi! link rustderive comment
        hi! link rustassert macro 
        hi! mkdlinebreak guibg=none
        hi! link helpexample string
        hi! link helpcommand string
        hi! matchparen guifg=orange
		]],
            ""
        )
        if vim.g.colors_name == "base16-github" then
            api.nvim_exec(
                [[
            hi! link repeat keyword
            hi! statusline guifg=#222222
            hi! string guifg=green
            hi! linenr guifg=#dcdcdc
            hi! nontext guifg=#dbdbdb
            hi! normalfloat guibg=#e3e3e3
            hi! warningmsg guifg=orange guibg=none
            hi! errormsg guifg=red guibg=none
            hi! normal guibg=#f6f8fa
            hi! pmenu guibg=#e0e0e0
            hi! cursorline guibg=#f0f0f0
            hi! startifyfile guifg=#000000
            hi! cursorlinenr guifg=#222222 guibg=NONE
		]],
                ""
            )
        elseif vim.g.colors_name == "base16-gruvbox-dark-hard" then
            api.nvim_exec([[
            hi! warningmsg guifg=#fadd2f
            hi! link repeat keyword
		]], "")
        elseif vim.g.colors_name == "base16-one-light" then
            api.nvim_exec(
                [[
            hi! statusline guifg=#222222
            hi! linenr guifg=#dcdcdc
            hi! nontext guifg=#dbdbdb
            hi! tabline guifg=#bbbbbb
            hi! normalfloat guibg=#e3e3e3
            hi! tablinesel guifg=#222222
		]],
                ""
            )
        elseif vim.g.colors_name == "base16-onedark" then
            api.nvim_exec(
                [[
            hi! XXstatusline guifg=#222222
            hi! XXlinenr guifg=#dcdcdc
            hi! XXnontext guifg=#dbdbdb
		]],
                ""
            )
        elseif vim.g.colors_name == "base16-material" then
            api.nvim_exec(
                [[
            hi! statusline guifg=#dddddd
            hi! XXlinenr guifg=#dcdcdc
            hi! XXnontext guifg=#dbdbdb
		]],
                ""
            )
        elseif vim.g.colors_name == "base16-tomorrow-night" then
            api.nvim_exec(
                [[
            hi! warningmsg guifg=#f0c674 guibg=none
            hi! normalfloat guibg=#373b41
            hi! statusline guibg=#dcdcdc guifg=#000000
            hi! statuslineNC guibg=#888888 guifg=#000000
            hi! cursorline guibg=#393b3e
            hi! cursorline guibg=#282a2e
            hi! link repeat keyword
            hi! nontext guifg=#444444
            hi! linenr guifg=#484b52
            hi! comment guifg=#5f5f5f
            hi! constant guifg=#c69f83
            hi! link number constant
            hi! link boolean constant
            hi! cursorlinenr guifg=#ffffff 
            hi! pmenu guifg=#eeeeee guibg=#404040
            hi! pmenusel guibg=#c0c0c0
		]],
                ""
            )
        else
        end
    end

    api.nvim_exec(
        [[
        command! -nargs=* SetTheme lua Mytheme(<f-args>)
        command! -nargs=* Mytheme call fzf#run(fzf#wrap({'source': ['base16-tomorrow-night', 'base16-one-light', 'base16-gruvbox-dark-hard', 'base16-github', 'base16-material'], 'sink': 'SetTheme'}))
        ]],
        ""
    )

    Mytheme("base16-tomorrow-night", "dark")
end

function Setup_redbush()
    vim.g.redbush_bin = "redbush" -- '~/dev/rust/redbush/target/debug/redbush'
    vim.g.redbush_filepath = "/tmp/redbush-eval.clj"
    vim.g.redbush_filesize = 1000
    vim.g.redbush_is_vertical = true
    vim.g.redbush_winsize = 40
end

function Setup_startify()
    vim.g.startify_lists = {{type = "files", header = {"    MRU"}}}
    vim.g.startify_fortune_use_unicode = 1
    vim.g.startify_files_number = 15
end

function Setup_coc()
    vim.g.coc_global_extensions = {"coc-rust-analyzer", "coc-json", "coc-lua", "coc-ultisnips", "coc-go", "coc-metals"}
    api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", keyopts)
    api.nvim_set_keymap("n", "K", ":call CocAction('doHover')<cr>", keyopts)
    api.nvim_set_keymap("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], keyopts)

    local opts_noremap = {nowait = true, noremap = false, silent = true}
    api.nvim_set_keymap("n", "<space>ac", [[<Plug>(coc-codeaction)]], opts_noremap)
    api.nvim_set_keymap("n", "<space>al", [[<Plug>(coc-codelens-action)]], opts_noremap)
    api.nvim_set_keymap("n", "<space>af", [[<Plug>(coc-fix-current)]], opts_noremap)
    api.nvim_set_keymap("n", "gd", [[<Plug>(coc-definition)]], opts_noremap)
    api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", opts_noremap)
    api.nvim_set_keymap("n", "<f2>", "<Plug>(coc-rename)", opts_noremap)
    api.nvim_set_keymap("n", "<M-n>", "<Plug>(coc-diagnostic-next)", opts_noremap)
    api.nvim_set_keymap("n", "<M-p>", "<Plug>(coc-diagnostic-prev)", opts_noremap)
    api.nvim_set_keymap("n", "<space>F", "<Plug>(coc-format)", opts_noremap)
    api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], keyopts)
    api.nvim_set_keymap("i", "<expr><cr>", [[pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]], keyopts)

    api.nvim_exec(
        [[
    function! Check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : Check_back_space() ? "\<Tab>" : coc#refresh()
    inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    augroup mygroup
      autocmd!
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end
      ]],
        ""
    )
end

function Setup_ultisnips()
    vim.g.UltiSnipsExpandTrigger = "<C-.>"
end

function Setup_anyfold()
    -- vim.cmd("AnyFoldActivate")
end

function Setup_lightline()
    vim.g.lightline = {
        active = {left = {{"mode", "paste"}, {"readonly", "absolutepath", "modified"}}},
        colorscheme = "wombat",
        mode_map = {n = "N", i = "I", R = "R", v = "V", V = "VL", c = "C", s = "S", S = "SL", t = "T"}
    }
end

function Setup_vemtabline()
    vim.g.vem_tabline_show = 2
end

function Setup_fugitive()
    api.nvim_set_keymap("n", "<C-x>g", ":Gstatus<cr>", keyopts)
end

function Setup_fern() 
    api.nvim_exec(
        [[
        au FileType fern nmap <silent><buffer> I <Plug>(fern-action-hidden-toggle)
        au FileType fern nmap <silent><buffer> q :bd<CR>
        au FileType fern nmap <silent><buffer> U <Plug>(fern-action-leave)
        au FileType fern nmap <silent><buffer> R <Plug>(fern-action-move)
    
      ]],
        ""
    )
end

function Setup_bufferline()
    require'bufferline'.setup{
      options = {
        view = "multiwindow",
        numbers = "none",
        number_style = "", 
        mappings = true,
        close_icon = "x",
        max_name_length = 18,
        tab_size = 18,
        show_buffer_close_icons = false,
        separator_style = "thin",
        enforce_regular_tabs = false,
      }
    }
end

function Setup_plugins()
    Setup_fugitive()
    Setup_nvimtree()
    Setup_ultisnips()
    Setup_vimrooter()
    Setup_easymotion()
    Setup_sexp()
    Setup_redbush()
    Setup_autopairs()
    Setup_fzf()
    Setup_neoterm()
    Setup_vista()
    Setup_gutentags()
    Setup_tagbar()
    Setup_anyjump()
    Setup_anyfold()
    -- Setup_bufferline()
    -- Setup_fern()
    -- Setup_neoformat()
    -- Setup_lightline()
    Setup_startify()
    Setup_signify()
    Setup_treesitter()
    -- Setup_coc()
    Setup_lsp()

    --     vim.cmd [[packadd packer.nvim]]
    --     vim._update_package_paths()
    --     return require("packer").startup(
    --         function(use)
    --             use {"wbthomason/packer.nvim", opt = true}
    --             use {"cespare/vim-toml"}
    --             use {"farmergreg/vim-lastplace"}
    --             use {"honza/vim-snippets"}
    --             use {"sheerun/vim-polyglot"}
    --             use {"tpope/vim-commentary"}
    --             use {"tpope/vim-surround"}
    --             use {"wincent/ferret"}
    --             use {"diepm/vim-rest-console"}
    --             use {"chriskempson/base16-vim"}
    --             use {"kyazdani42/nvim-web-devicons"}
    --             use {"ryanoasis/vim-devicons"}
    --             use {"mbbill/undotree"}
    --             use {"tpope/vim-fugitive", config = Setup_fugitive()}
    --             use {"kyazdani42/nvim-tree.lua", config = Setup_nvimtree()}
    --             use {"SirVer/ultisnips", config = Setup_ultisnips()}
    --             use {"airblade/vim-rooter", config = Setup_vimrooter()}
    --             use {"easymotion/vim-easymotion", config = Setup_easymotion()}
    --             use {"guns/vim-sexp", ft = "clojure", config = Setup_sexp()}
    --             use {"jasilven/redbush", run = "cargo install --path .", ft = "clojure", config = Setup_redbush()}
    --             use {"jiangmiao/auto-pairs", config = Setup_autopairs()}
    --             use {"junegunn/fzf", run = "./install --all"}
    --             use {"junegunn/fzf.vim", config = Setup_fzf()}
    --             use {"kassio/neoterm", config = Setup_neoterm()}
    --             use {"liuchengxu/vista.vim", config = Setup_vista()}
    --             use {"ludovicchabant/vim-gutentags", config = Setup_gutentags()}
    --             use {"majutsushi/tagbar", config = Setup_tagbar()}
    --             use {"pechorin/any-jump.vim", config = Setup_anyjump()}
    --             use {"pseewald/vim-anyfold", config = Setup_anyfold()}
    --             use {"sbdchd/neoformat", config = Setup_neoformat()}
    --             use {"mhinz/vim-startify", config = Setup_startify()}
    --             use {"pacha/vem-tabline", config = Setup_vemtabline()}
    --             use {"mhinz/vim-signify", config = Setup_signify()}
    --             -- use {"neoclide/coc.nvim", branch = "release", config = Setup_coc()}
    --             -- use {"norcalli/nvim-colorizer.lua"}
    --             -- use {'nvim-treesitter/nvim-treesitter', config = Setup_treesitter() }
    --             -- use {'neovim/nvim-lsp', requires = {{'nvim-lua/completion-nvim'}, {'nvim-lua/diagnostic-nvim'}}, config = Setup_lsp()}
    --             use {'neovim/nvim-lsp', requires = {{'nvim-lua/completion-nvim'}, {'nvim-lua/diagnostic-nvim'}}}
    --         end
    --     )
end

function Setup()
    Setup_keymaps()
    Setup_options()
    Setup_general()

    Setup_plugins()

    Setup_cargo()
    Setup_go()

    Setup_theme()

    print("Setup done!")
end

Setup()
