local vim = vim
local api = vim.api
local fn = vim.fn
local keyopts = {nowait = true, noremap = true, silent = true}

-- COLOR
if vim.g.colors_name == nil then
    vim.cmd("colorscheme mynext")
else
    vim.cmd("colorscheme " .. vim.g.colors_name)
end

-- PLUGINS
require "plugins"

-- KEYS
local keymaps = {
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x"}, lhs = "<C-g>", rhs = "<Esc>"},
    -- {mods = {"c", "i", "l", "n", "o", "s", "v", "x", "t"}, lhs = "<C-t>", rhs = "<C-\\><C-N>:term<cr>"},
    {mods = {"c", "i", "l", "n", "o", "s", "v", "x"}, lhs = "<C-d>", rhs = "<C-\\><C-N>:update<cr>:qa!<cr>"},
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
    {mods = {"n"}, lhs = "P", rhs = "<Nop>"},
    {mods = {"n"}, lhs = "gr", rhs = "<Nop>"},
    {mods = {"n"}, lhs = "P", rhs = "\"0p"},
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
    {mods = {"n"}, lhs = "<f9>", rhs = ":luafile ~/dotfiles/config/nvim/init.lua<cr>"},
    {mods = {"t"}, lhs = "<C-d>", rhs = "<C-\\><C-N>:bd!<cr>"},
    {mods = {"n"}, lhs = "*", rhs = ":let @/='\\V\\<'.escape(expand('<cword>'), '\\').'\\>'<cr>:set hls<cr>"}
}
for _, keymap in pairs(keymaps) do
    for _, mod in pairs(keymap.mods) do
        api.nvim_set_keymap(mod, keymap.lhs, keymap.rhs, keymap.opt or {nowait = true, noremap = true})
    end
end

-- OPTIONS
vim.o["autoread"] = false
vim.o["backup"] = false
vim.o["writebackup"] = false
vim.o["clipboard"] = "unnamedplus"
vim.o["completeopt"] = "menuone,noinsert,noselect"
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
-- vim.o["wildmode"] = "full"
vim.o["wildmode"] = "longest:full,full"
vim.o["wrap"] = false
vim.o["grepprg"] = "rg --no-heading --vimgrep --smart-case"
vim.o["grepformat"] = "%f:%l:%c:%m"
vim.o["formatoptions"] = "tcrqnb"
vim.o["fsync"] = false
vim.wo["wrap"] = false
vim.wo["foldenable"] = false
vim.wo["foldmethod"] = "expr"
vim.wo["foldexpr"] = "nvim_treesitter#foldexpr()"
vim.wo["number"] = true
vim.wo["signcolumn"] = "yes:1"
vim.wo["cursorline"] = true

-- NEOVIDE
api.nvim_exec( [[
    set guifont=FiraCode\ Nerd\ Font:h16
    let g:neovide_cursor_vfx_mode = "torpedo"
    let g:neovide_cursor_animation_length=0.05
    let g:neovide_cursor_trail_length=0.5
    let g:neovide_refresh_rate=140
    nnoremap <D-v> "+p
]],"")

    -- nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"  . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>
-- GLOBAL SETTTINGS
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_hide = 1
api.nvim_exec( [[
    au FileType markdown set shiftwidth=2
    au TermOpen * startinsert
    au Bufenter term://*fish* startinsert
    au TextYankPost * silent! lua vim.highlight.on_yank()
    au Filetype lua,html setlocal ts=4 sts=4 sw=4
    let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' 
    vmap <LeftRelease> "+ygv
    vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
    inoremap <F5> <C-R>=strftime("%a %d %b %Y")<CR>
    nnoremap <space>/ *:%s/<c-r><c-w>//g<left><left>
    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    cnoremap <expr> <up> pumvisible() ? "<C-p>" : "\\<C-p>"
    cnoremap <expr> <down> pumvisible() ? "<C-n>" : "\\<C-n>"
    command! -bar -range Execute silent <line1>,<line2>yank z | let @z = substitute(@z, '\n\s*\\', '', 'g') | @z
    command! Bd bp | sp | bn | bd
    cnoreabbrev hon nohl 
    cnoreabbrev hoh nohl 
    augroup autoquickfix
      autocmd!
      au QuickFixCmdPost [^l]* cwindow
      au QuickFixCmdPost    l* lwindow
    augroup END
    ]], "")

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

setup_go()
setup_rust()

