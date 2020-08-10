local vim = vim
local api = vim.api

local M = {}
local keyopts = {nowait = true, noremap = true, silent = true}

local keymaps = {
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x"}, lhs = "<C-g>", rhs = "<Esc>"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-S-Right>", rhs = "<C-\\><C-N>:tabnext<cr>"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-S-Left>", rhs = "<C-\\><C-N>:tabprev<cr>"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<M-k>", rhs = "<C-\\><C-N><C-w>k"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<M-j>", rhs = "<C-\\><C-N><C-w>j"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<M-h>", rhs = "<C-\\><C-N><C-w>h"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<M-l>", rhs = "<C-\\><C-N><C-w>l"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-k>", rhs = "<C-\\><C-N>:tabnew +term<cr>"},
    {mods = {"i", "t"}, lhs = "jk", rhs = "<C-\\><C-N>"},
    {mods = {"n"}, lhs = "<RightMouse>", rhs = "<LeftMouse>gdzz"},
    {mods = {"n"}, lhs = "<MiddleMouse>", rhs = "<C-o>", {noremap = false}},
    {mods = {"n"}, lhs = "gf", rhs = "<C-w>vgF", {noremap = false}},
    {mods = {"n"}, lhs = "<C-q>", rhs = ":close<cr>"},
    {mods = {"n"}, lhs = "<C-x>g", rhs = ":Gstatus<cr>"},
    {mods = {"n"}, lhs = "*", rhs = ":let @/='\\V\\<'.escape(expand('<cword>'), '\\').'\\>'<cr>:set hls<cr>"},
    {mods = {"n"}, lhs = "<space><tab>", rhs = "<C-^>"},
    {mods = {"n"}, lhs = "<tab>", rhs = ":tabnext<cr>"},
    {mods = {"n"}, lhs = "S-<tab>", rhs = ":bprev<cr>"},
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
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-q>", rhs = "<C-\\><C-N>:bd!<cr>"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-w><C-w>", rhs = "<C-\\><C-N><C-w>w"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-w>w", rhs = "<C-\\><C-N><C-w>w"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-w>h", rhs = "<C-\\><C-N><C-w>h"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-w>j", rhs = "<C-\\><C-N><C-w>j"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-w>k", rhs = "<C-\\><C-N><C-w>k"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-w>l", rhs = "<C-\\><C-N><C-w>l"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<Esc>", rhs = "<C-\\><C-N>"},
    {mods = {"n"}, lhs = "<f1>", rhs = ":help <C-r><C-w><cr>"}
}

-- local function setup_plugins()
--     -- Only required if you have packer in your `opt` pack
--     vim.cmd [[packadd packer.nvim]]
--     -- Temporary until https://github.com/neovim/neovim/pull/12632 is merged
--     vim._update_package_paths()
-- 
--     local packer = require("packer")
--     -- packer.init({package_root = "/home/jari/.local/share/nvim/site/pack"})
--     packer.init()
--     packer.startup(
--         function()
--             -- Packer can manage itself as an optional plugin
--             use "9mm/vim-closer"
--             use "SirVer/ultisnips"
--             use "airblade/vim-gitgutter"
--             use "airblade/vim-rooter"
--             use "cespare/vim-toml"
--             use "easymotion/vim-easymotion"
--             use "farmergreg/vim-lastplace"
--             use "gruvbox-community/gruvbox"
--             use "honza/vim-snippets"
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
--             use "nvim-lua/diagnostic-nvim"
--             use "nvim-treesitter/nvim-treesitter"
--             use "pechorin/any-jump.vim"
--             use "pseewald/vim-anyfold"
--             use "sbdchd/neoformat"
--             use "sheerun/vim-polyglot"
--             use "steelsojka/completion-buffers"
--             use "tpope/vim-commentary"
--             use "tpope/vim-fugitive"
--             use "tpope/vim-surround"
--             use 'kyazdani42/nvim-tree.lua'
--             use 'kyazdani42/nvim-web-devicons'
--             use 'mhinz/vim-startify'
--             use 'norcalli/nvim-colorizer.lua'
--             use 'nvim-treesitter/nvim-treesitter'
--             use 'rakr/vim-one'
--             use {"guns/vim-sexp", ft = {"clojure"}}
--             use {"jasilven/redbush", run = "cargo install --path ."}
--             use {"wbthomason/packer.nvim", opt = true}
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
    vim.o["shortmess"] = "Ic"
    vim.o["showmatch"] = true
    vim.o["smartindent"] = true
    vim.o["splitbelow"] = true
    vim.o["splitright"] = true
    vim.o["synmaxcol"] = 120
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
    vim.o["shiftwidth"] = 2
    vim.o["expandtab"] = true
    vim.o["tabstop"] = 2
    vim.o["softtabstop"] = 2
end

local function setup_general()
    api.nvim_exec(
        [[
    au TermOpen * startinsert
    au Bufenter term://* startinsert
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
        toggle_dotfiles = "I",
        cd = "R"
    }
    vim.g.lua_tree_hide_dotfiles = 1
    vim.g.lua_tree_icons = {default = ""}
    vim.g.lua_tree_ignore = {".git", "node_modules", ".cache", "target"}
    vim.g.lua_tree_follow = 1
    api.nvim_exec("au FileType LuaTree nnoremap <buffer> q :LuaTreeClose<cr>", "")

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

    api.nvim_exec("command! TreeToggle call v:lua.Tree_toggle()", "")
    api.nvim_set_keymap("n", "<C-n>", ":TreeToggle<cr>", keyopts)
    api.nvim_set_keymap("t", "<C-n>", "<C-\\><C-N>:TreeToggle<cr>", keyopts)
end

local function setup_lsp()
    local function setup_diagnostics()
        vim.g.diagnostic_enable_virtual_text = 1
        vim.g.diagnostic_virtual_text_prefix = ""
        vim.g.diagnostic_trimmed_virtual_text = "200"
        vim.g.diagnostic_enable_underline = 1
        vim.g.diagnostic_insert_delay = 1
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
    local function lsp_attach()
        require "completion".on_attach()
        setup_completion()

        require "diagnostic".on_attach()
        setup_diagnostics()
    end

    require "nvim_lsp".sumneko_lua.setup {on_attach = lsp_attach}
    require "nvim_lsp".rust_analyzer.setup {on_attach = lsp_attach}
    require "nvim_lsp".jsonls.setup {on_attach = lsp_attach}
    require "nvim_lsp".vimls.setup {}
    -- api.nvim_exec("autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)", "")
    api.nvim_set_keymap("n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", keyopts)
    api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", keyopts)
    api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", keyopts)
    api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", keyopts)
    api.nvim_set_keymap("n", "<f2>", "<cmd>lua vim.lsp.buf.rename()<CR>", keyopts)
    vim.fn.sign_define("LspDiagnosticsErrorSign", {text = "✗", texthl = "LspDiagnosticsErrorSign"})
    vim.fn.sign_define("LspDiagnosticsWarningSign", {text = "⚠", texthl = "LspDiagnosticsWarningSign"})
    vim.fn.sign_define("LspDiagnosticInformationSign", {text = "", texthl = "LspDiagnosticsInformationSign"})
    vim.fn.sign_define("LspDiagnosticHintSign", {text = "ﯦ", texthl = "LspDiagnosticsHintSign"})
end

local function setup_fzf()
    vim.g.fzf_layout = {down = "~18%"}
    -- vim.g.fzf_layout = {window = "call v:lua.Float_fzf()"}
    vim.g.fzf_preview_window = "right:40%"
    vim.g.fzf_buffers_jump = 1
    vim.g.fzf_commits_log_options = "--graph --color=always --format='%C(auto)%h%d %s %C(black)%C(bold)%cr'"

    api.nvim_set_keymap("n", "<space>f", ":Files<CR>", keyopts)
    api.nvim_set_keymap("n", "<C-p>", ":Files ~<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>g", ":Rg<CR>", keyopts)
    api.nvim_set_keymap("n", "<C-f>", ":MyRgHome<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>b", ":Buffers<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>l", ":BLines<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>L", ":Rg<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>h", ":History<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>i", ":BTags<CR>", keyopts)
    api.nvim_set_keymap("n", "<space>I", ":Tags<CR>", keyopts)
    api.nvim_set_keymap("n", "<m-x>", ":Commands<cr>", keyopts)
    api.nvim_set_keymap("n", "<space><space>", ":Commands<cr>", keyopts)

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
        "command! -bang -nargs=* BLines" ..
            " call fzf#vim#grep(" ..
                "'rg --with-filename --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>) . ' ' . expand('%'), 1," ..
                    "fzf#vim#with_preview({'options': ['--layout=reverse'] }), <bang>0)",
        ""
    )

    api.nvim_exec(
        "command! -bang -nargs=* MyRgHome" ..
            " call fzf#vim#grep(" ..
                "'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>) . ' ~', 1," ..
                    "fzf#vim#with_preview({'options': ['--layout=reverse'] }), <bang>0)",
        ""
    )

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
    api.nvim_exec(string.format(fmt, "Commands", "commands", ""), "")
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
    api.nvim_exec(
        [[
    au Filetype * AnyFoldActivate
    au BufReadPre,BufRead,BufWinEnter,BufNewFile,BufEnter conjure.cljc setlocal foldmethod=marker
    ]],
        ""
    )
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
    vim.g.AutoPairsShortcutToggle = ""
    vim.g.PairsShortcutJump = ""
end

local function setup_gitgutter()
    vim.g.gitgutter_sign_modified = "│"
    vim.g.gitgutter_sign_added = "│"
    vim.g.gitgutter_sign_removed = "│"
    vim.g.gitgutter_sign_modified_removed = "│"
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

local function setup_neoformat()
    vim.g.neoformat_only_msg_on_error = 1
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
        vim.cmd("normal G")
    end

    local function run_and_wait(cmd)
        vim.cmd("split")
        vim.cmd("enew")
        local jobid = vim.fn.termopen(cmd)
        local status = vim.fn.jobwait({jobid})[0]
    end

    function Cargo_check()
        run_and_wait("cargo check")
        local line = vim.fn.search("^error")
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
    au FileType neoterm tnoremap <silent> <buffer> <C-w><C-w> <C-\><C-N><C-w><C-w>
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
    function Myfixcolors()
        api.nvim_exec(
            [[
        hi! rustmodpathseparator guifg=NONE ctermfg=NONE  
        hi! delimiter guifg=NONE ctermfg=NONE
        hi! link tabline comment 
        hi! signcolumn ctermbg=NONE 
        hi! link visual folded
        ]],
            ""
        )
    end

    function MyThemeCode()
        vim.api.nvim_set_option("background", "dark")
        -- vim.cmd("colorscheme codedark")
        api.nvim_exec(
            [[
        colorscheme codedark
        hi! statusline guibg=#375999 guifg=#ffffff
        hi! link pmenusel statusline
        hi! statuslineNC guibg=#505050 guifg=#ffffff
        hi! tablinefill guibg=#000000
        hi! tablinesel guifg=#dcdcaa gui=underline
        hi! cursorline guibg=#303030
        hi! errormsg guifg=#d16969 guibg=none gui=bold
        hi! warningmsg guifg=#fabd2f guibg=none
        hi! comment guifg=#808080
        hi! TSdefinitionusage guibg=#606060 guifg=#cccccc
        hi! type guifg=#b5cea8 
        hi! search guibg=#b57614 guifg=#222222 
        hi! incsearch guibg=#d16969 guifg=#222222
        hi! folded guibg=#b57614 guifg=#ffffff gui=none
        hi! wildmenu guifg=#268bd2 guibg=#ffffff
        hi! link visualNOS folded 
        hi! link visual folded
        hi! link keyword structure 
        hi! link cocerrorsign  errormsg
        hi! link cocerrorvirtualtext errormsg 
        hi! link cocerrorfloat errormsg 
        hi! link cocwarningsign warningmsg
        hi! link cocwarningvirtualtext warningmsg
        hi! link cocwarningfloat warningmsg
        hi! link lspdiagnosticserror errormsg 
        hi! link lspdiagnosticswarning  warningmsg
        hi! link lspdiagnosticshint comment 
        hi! link lspdiagnosticsinformation comment
        ]],
            ""
        )
        Myfixcolors()
    end

    function MyThemeGruvBoxLight()
        vim.g.gruvbox_sign_column = "bg0"
        api.nvim_set_option("background", "dark")
        vim.cmd("colorscheme gruvbox")
        api.nvim_exec(
            [[
        colorscheme gruvbox 
        hi! errormsg guifg=#d16969 guibg=NONE gui=bold
        hi! warningmsg  guifg=#b57614 gui=bold
        hi! link cocerrorsign  errormsg
        hi! link cocerrorvirtualtext errormsg 
        hi! link cocerrorfloat errormsg 
        hi! link cocwarningsign warningmsg
        hi! link cocwarningvirtualtext warningmsg
        hi! link cocwarningfloat warningmsg
        hi! link LspDiagnosticsError errormsg 
        hi! link LspDiagnosticsWarning  warningmsg
        hi! link LspDiagnosticsHint comment 
        hi! link LspDiagnosticsInformation comment
        ]],
            ""
        )
        Myfixcolors()
    end
 
    function MyThemeOneDark()
        api.nvim_set_option("background", "dark")
        vim.cmd("colorscheme onedark")
        api.nvim_exec(
        [[
        hi! link keyword function
        hi! link identifier normal
        hi! link operator normal
        hi! link LspDiagnosticsError errormsg 
        hi! link LspDiagnosticsWarning  warningmsg
        hi! link LspDiagnosticsHint comment 
        hi! link LspDiagnosticsInformation comment
        ]],
            ""
        )
    end
    api.nvim_exec("command! MyThemeCode lua MyThemeCode()", "")
    api.nvim_exec("command! MyThemeGruvBoxLight lua MyThemeGruvBoxLight()", "")
    api.nvim_exec("command! MyThemeGruvBoxLight lua MyThemeOneDark()", "")

    -- -- default theme
    vim.cmd("lua MyThemeOneDark()")
end

local function setup_redbush()
    vim.g.redbush_bin = "redbush" -- '~/dev/rust/redbush/target/debug/redbush'
    vim.g.redbush_filepath = "/tmp/redbush-eval.clj"
    vim.g.redbush_filesize = 1000
    vim.g.redbush_is_vertical = true
    vim.g.redbush_winsize = 40
end

local function setup_mytest()
    function Mytest()
        print("Mytest called")
    end

    api.nvim_exec("command! Mytest lua Mytest()", "")
end

local function setup_startify()
    vim.g.startify_lists = {{type = "files", header = {"    MRU"}}}
    vim.g.startify_fortune_use_unicode = 1
    vim.g.startify_files_number = 15
end

local function setup_coc()
    vim.g.coc_global_extensions = {"coc-rust-analyzer", "coc-json", "coc-lua", "coc-ultisnips"}
    api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", keyopts)
    api.nvim_set_keymap("n", "K", ":call CocAction('doHover')<cr>", keyopts)
    api.nvim_set_keymap("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], keyopts)
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
    hi! link cocwarningvirtualtext gruvboxyellow
    hi! link cocwarningsign gruvboxyellow
    hi! link cocrustchaininghint nontext 
    augroup mygroup
      autocmd!
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end
      ]],
        ""
    )

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
end

local function setup_ultisnips()
    vim.g.UltiSnipsExpandTrigger = "<C-.>"
end

local function setup_anyfold()
    vim.cmd("AnyFoldActivate")
end

function M.setup()
    -- setup_plugins()

    for _, keymap in pairs(keymaps) do
        for _, mod in pairs(keymap.mods) do
            api.nvim_set_keymap(mod, keymap.lhs, keymap.rhs, keymap.opt or {nowait = true, noremap = true})
        end
    end

    -- general
    setup_options()
    setup_general()

    -- plugin setup
    setup_fzf()
    setup_ripgrep()
    setup_anyjump()
    setup_easymotion()
    setup_tagbar()
    setup_gutentags()
    setup_autopairs()
    setup_rooter()
    setup_gitgutter()
    -- setup_neoformat()
    -- setup_vista()
    setup_sexp()
    setup_conjure()
    setup_cargo_cmds()
    setup_statusline()
    setup_neoterm()
    setup_redbush()
    -- setup_coc()
    setup_startify()
    setup_ultisnips()

    -- neovim 0.5 stuff
    setup_luatree()
    setup_treesitter()
    setup_colorizer()
    setup_lsp()

    -- misc testing thing for :Mytest-command
    setup_mytest()

    -- theme last
    setup_theme()
end

return M
