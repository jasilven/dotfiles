local vim = vim
local api = vim.api
local fn = vim.fn
local keyopts = {nowait = true, noremap = true, silent = true}

-- COLOR
vim.o.background = 'light'
vim.cmd("colorscheme mycolor")

-- vim.cmd("syntax reset")
-- require('mycolor')
-- if vim.g.colors_name == nil then
--     vim.cmd("colorscheme mymonolight")
-- else
--     vim.cmd("colorscheme " .. vim.g.colors_name)
-- end

-- PLUGINS
require "plugins"

-- GLOBAL KEYS
local keymaps = {
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<Esc>", rhs = "<C-\\><C-N>"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x"}, lhs = "<2-RightMouse>", rhs = ":bn<cr>"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x"}, lhs = "<3-RightMouse>", rhs = ":bn<cr>"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x"}, lhs = "<4-RightMouse>", rhs = ":bn<cr>"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x"}, lhs = "<C-d>", rhs = "<C-\\><C-N>:update<cr>:qa!<cr>"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x"}, lhs = "<C-g>", rhs = "<Esc>"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x"}, lhs = "<RightDrag>", rhs = "<Nop>"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x"}, lhs = "<RightMouse>", rhs = ":bn<cr>"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x"}, lhs = "<RightRelease>", rhs = "<Nop>"},
    {mods = {"i"}, lhs = "<F5>", rhs = '<C-R>=strftime("%a %d %b %Y")<CR>'},
    {mods = {"i"}, lhs = "jk", rhs = "<C-\\><C-N>"},
    {mods = {"n", "i"}, lhs = "<C-q>", rhs = "<C-\\><C-N>:Bd<cr>"},
    {mods = {"n", "v"}, lhs = "gh", rhs = "0"},
    {mods = {"n", "v"}, lhs = "gl", rhs = "$"},
    {mods = {"n", "v"}, lhs = "gm", rhs = "%"},
    {mods = {"n"}, lhs = "*", rhs = ":let @/='\\V\\<'.escape(expand('<cword>'), '\\').'\\>'<cr>:set hls<cr>"},
    {mods = {"n"}, lhs = "<C-N>", rhs = "<C-\\><C-N>:vs +enew<cr>"},
    {mods = {"n"}, lhs = "<C-S-Down>", rhs = ":m .+1<CR>=="},
    {mods = {"n"}, lhs = "<C-S-up>", rhs = ":m .-2<CR>=="},
    {mods = {"n"}, lhs = "<C-l>", rhs = "<C-l>:nohl<CR>"},
    {mods = {"n"}, lhs = "<f1>", rhs = ":help <C-r><C-w><cr>"},
    {mods = {"n"}, lhs = "<f4>", rhs = ":%s/<C-r><C-w>//gc<left><left><left>"},
    {mods = {"n"}, lhs = "<f9>", rhs = ":luafile ~/dotfiles/config/nvim/init.lua<cr>:PackerCompile<cr>"},
    {mods = {"n"}, lhs = "<space>/", rhs = "*:%s/<c-r><c-w>//g<left><left>"},
    {mods = {"n"}, lhs = "<space><tab>", rhs = "<C-^>"},
    {mods = {"n"}, lhs = "<space>Q", rhs = ":qall<cr>"},
    {mods = {"n"}, lhs = "<space>o", rhs = ":only<cr>"},
    {mods = {"n"}, lhs = "<space>w", rhs = ":update<cr>"},
    {mods = {"n"}, lhs = "P", rhs = "<Nop>"},
    {mods = {"n"}, lhs = "P", rhs = "\"0p"},
    {mods = {"n"}, lhs = "Q", rhs = "q"},
    {mods = {"n"}, lhs = "dh", rhs = "d0"},
    {mods = {"n"}, lhs = "dl", rhs = "d$"},
    {mods = {"n"}, lhs = "gH", rhs = "<C-\\><C-N><C-w>h"},
    {mods = {"n"}, lhs = "gL", rhs = "<C-\\><C-N><C-w>l"},
    {mods = {"n"}, lhs = "gJ", rhs = "<C-\\><C-N><C-w>j"},
    {mods = {"n"}, lhs = "gK", rhs = "<C-\\><C-N><C-w>k"},
    {mods = {"n"}, lhs = "gf", rhs = "<C-w>vgF", {noremap = false}},
    {mods = {"n"}, lhs = "go", rhs = "<C-\\><C-N><C-w>w"},
    {mods = {"n"}, lhs = "gr", rhs = "<Nop>"},
    {mods = {"n"}, lhs = "q", rhs = ":close<cr>"},
    {mods = {"n"}, lhs = "yh", rhs = "y0"},
    {mods = {"n"}, lhs = "yl", rhs = "y$"},
    {mods = {"t"}, lhs = "<C-d>", rhs = "<C-\\><C-N>:bd!<cr>"},
    {mods = {"t"}, lhs = "<C-q>", rhs = "<C-\\><C-N>:bd!<cr>"},
    {mods = {"v"}, lhs = "<C-S-Down>", rhs = ":m '>+1<CR>gv=gv"},
    {mods = {"v"}, lhs = "<C-S-up>", rhs = ":m '<-2<CR>gv=gv"},
}

for _, keymap in pairs(keymaps) do
    for _, mod in pairs(keymap.mods) do
        api.nvim_set_keymap(mod, keymap.lhs, keymap.rhs, keymap.opt or {nowait = true, noremap = true})
    end
end

-- OPTIONS
vim.opt.autoread = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.confirm = true
-- vim.opt.encoding = "utf-8"
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.fileformats = "unix"
vim.opt.fillchars = "eob: ,vert:│"
vim.opt.termguicolors = true
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver50,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.hidden = true
-- vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
-- vim.opt.incsearch = true
vim.opt.lazyredraw = true
vim.opt.linebreak = true
-- vim.opt.list = false
vim.opt.listchars = "tab:→ ,space:·,nbsp:␣,trail:•,eol:$,precedes:«,extends:»"
vim.opt.mouse = "a"
vim.opt.scrolloff = 2
vim.opt.sessionoptions = "blank,curdir,help,tabpages,winsize"
vim.opt.shiftwidth = 4
-- vim.opt.shortmess = "IcatFo"
vim.opt.shortmess = "Icato"
vim.opt.showcmd = false
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.smartindent = true
vim.opt.softtabstop = 4
-- vim.opt.spell = false
vim.opt.spelllang = "en_us"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.synmaxcol = 200
vim.opt.tabstop = 4
-- vim.opt.ttyfast = true
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.wildignore = "tmp/**,*.so,*.swp,*.zip,*.pyc,*.db,.git/**,target/**,*~,tags,node_modules/**,classes/**"
vim.opt.wildmenu = true
-- vim.opt.wildmode = "full"
vim.opt.wildmode = "longest:full,full"
vim.opt.wrap = false
vim.opt.grepprg = "rg --no-heading --vimgrep --smart-case --color=ansi"
vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
vim.opt.formatoptions = "tcrqnb"
vim.opt.fsync = false
vim.opt.wrap = false
vim.opt.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.number = true
vim.opt.signcolumn = "yes:1"
vim.opt.cursorline = true

-- DISABLE LOADING
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_man = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins = 1
vim.g.python_host_skip_check = 1
vim.g.python2_host_skip_check = 1
vim.g.python3_host_skip_check = 1
vim.g.loaded_python_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- PUM
vim.cmd([[inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"]])
vim.cmd([[cnoremap <expr> <up> pumvisible() ? "<C-p>" : "\\<C-p>"]])
vim.cmd([[cnoremap <expr> <down> pumvisible() ? "<C-n>" : "\\<C-n>"]])

-- MISC
vim.cmd([[au BufRead,BufNewFile *.fish setfiletype fish]])
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])
vim.cmd([[au Filetype * setlocal ts=4 sts=4 sw=4]])
vim.cmd([[au FileType markdown setlocal sw=2]])
vim.cmd([[command! -bar -range Execute silent <line1>,<line2>yank z | let @z = substitute(@z, '\n\s*\\', '', 'g') | @z]])
vim.cmd([[command! Bd bp | sp | bn | bd]])
vim.cmd([[cnoreabbrev hon nohl]])
vim.cmd([[cnoreabbrev noh nohl]])
api.nvim_exec( [[
    augroup autoquickfix
      autocmd!
      au QuickFixCmdPost [^l]* cwindow
      au QuickFixCmdPost    l* lwindow
    augroup END
    ]], "")

-- GO
local function setup_go()
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

setup_go()

-- RUST
local function setup_rust()
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
setup_rust()

function Pwd()
   print(string.match(vim.fn.getcwd(),"[^/]*$"))
end
vim.cmd([[command! Pwd call v:lua.Pwd()]])

