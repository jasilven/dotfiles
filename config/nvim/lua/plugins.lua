return require('packer').startup(function(use)
    use {'tjdevries/colorbuddy.nvim'}
    use {'wbthomason/packer.nvim'}
    use {'terrortylor/nvim-comment', config = function() require('nvim_comment').setup() end }
    use {'kyazdani42/nvim-web-devicons'}
    use {'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end }
    use {'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end }
    -- use {'ethanholz/nvim-lastplace', config = function() require'nvim-lastplace'.setup() end}
    use {'sindrets/diffview.nvim', cmd = "DiffviewOpen"}
    use {'lewis6991/gitsigns.nvim', requires = {{ 'nvim-lua/plenary.nvim'}}, config = function() require('gitsigns').setup() end }
    use {'f-person/git-blame.nvim', cmd = "GitBlameToggle", setup = function() vim.g.gitblame_enabled = 0 end}
    use {'kyazdani42/nvim-tree.lua', requires = {{'kyazdani42/nvim-web-devicons', opt = true}},
        keys = {"<space>n"},
        config = function()
                local keyopts = {nowait = true, noremap = true, silent = true}
                vim.api.nvim_set_keymap("n", '<space>n', ":NvimTreeToggle<CR>", keyopts)
            end}
    use {'hrsh7th/nvim-compe',
        config = function()
            require'compe'.setup {
              enabled = true;
              autocomplete = true;
              debug = false;
              min_length = 1;
              preselect = 'enable';
              throttle_time = 80;
              source_timeout = 200;
              resolve_timeout = 800;
              incomplete_delay = 400;
              max_abbr_width = 100;
              max_kind_width = 100;
              max_menu_width = 100;
              documentation = true;

              source = {
                path = true;
                buffer = true;
                calc = false;
                nvim_lsp = true;
                nvim_lua = true;
                vsnip = false;
                ultisnips = false;
                luasnip = false;
              };
            }
        end }
    use {'simrat39/symbols-outline.nvim',
        keys = "<space>i",
        setup = function()
            vim.g.symbols_outline = {
                highlight_hovered_item = false,
                show_guides = true,
                auto_preview = false,
                position = 'right',
                keymaps = {
                    close = "<Esc>",
                    goto_location = "<Cr>",
                    focus_location = "o",
                    hover_symbol = "K",
                    rename_symbol = "r",
                    code_actions = "a",
                },
                lsp_blacklist = {},
            }
        end,
        config = function()
            local keyopts = {nowait = true, noremap = true, silent = true}
            vim.api.nvim_set_keymap("n", '<space>i', ":SymbolsOutline<CR>", keyopts)
        end }

    use {'TimUntersberger/neogit', requires = {{'nvim-lua/plenary.nvim'}},
        cmd = "Neogit",
        config = function()
            local neogit = require('neogit')
            neogit.setup { disable_context_highlighting = true, }
        end }

    use {'hoob3rt/lualine.nvim',
        requires = {{'kyazdani42/nvim-web-devicons', opt = true}},
        config = function()
            local function lsp_progress()
                local messages = vim.lsp.util.get_progress_messages()
                if #messages == 0 then
                    return "lsp"
                end
                local status = {}
                for _, msg in pairs(messages) do
                    table.insert(status, (msg.percentage or 0) .. "%% " .. (string.lower(msg.title) or ""))
                end
                return table.concat(status, " | ")
            end
            local function lspclient()
                if next(vim.lsp.buf_get_clients()) == nil then
                    return ""
                else
                    return lsp_progress()
                end
            end
            local function dir()
                local d = string.match(vim.fn.getcwd(),"[^/]*$")
                if d == nil then
                    d = "<n/a>"
                end
                return d
            end
            require('lualine').setup{
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {},
                    lualine_c = {{'branch'}, {dir}, {'filename', path = 1, shorten = false, full_name = true}, {'diagnostics', sources = {'nvim_lsp'}, color_error = '#ffffff', color_warn = '#ffffff', color_info = '#ffffff', color_hint = '#ffffff'}, {'diff', colored = false}},
                    lualine_x = {{lspclient},  {'filetype', colored = false}, 'encoding', 'fileformat', 'location'},
                    lualine_y = {},
                    lualine_z = {} },
                extensions = { 'fzf' },
                options = {
                    theme = 'nord',
                    section_separators = '',
                    component_separators = ''} }
        end }

    use {'nvim-treesitter/playground',
        keys = {"<f10>"},
        config = function ()
            local keyopts = {nowait = true, noremap = true, silent = true}
            vim.api.nvim_set_keymap("n", "<f10>", ":TSHighlightCapturesUnderCursor<CR>", keyopts)
        end}

    use {'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {{'nvim-treesitter/nvim-treesitter-textobjects'}, {'nvim-treesitter/nvim-treesitter-refactor'}},
        config = function()
            require "nvim-treesitter.configs".setup {
                highlight = { enable = true },
                incremental_selection = { enable = false },
                refactor = { highlight_definitions = { enable = true },
                    highlight_current_scope = { enable = false },
                    smart_rename = { enable = true, keymaps = { smart_rename = "<f3>" } },
                    navigation = { enable = false }
                },
                textobjects = {
                    select = {
                        enable = true,
                        keymaps = { ["af"] = "@function.outer", }
                    }
                },
                indent = { enable = true },
                ensure_installed = "maintained",
            }
        end }

    use {'junegunn/fzf.vim',
        opt = true,
        requires = {{'junegunn/fzf', dir = '~/.fzf'}},
        -- requires = {{'junegunn/fzf', dir = '~/.fzf', run = './install --all'}},
        cmd = {"Files", "Rg"},
        keys = {"<space>s", "<space>l", "<space>F"},
        config = function()
            local keyopts = {nowait = true, noremap = true, silent = true}
            -- vim.g.fzf_layout = {down = "40%"}
            vim.g.fzf_layout = { window = { width = 1.0, height = 0.5, relative=false, yoffset= 1.0 } }
            vim.g.vim_buffers_jump = 1
            -- vim.g.fzf_commits_log_options = "--graph --color=always --format='%C(auto)%h%d %s %C(black)%C(bold)%cr'"
            vim.g.fzf_commits_log_options = "--graph --color=always --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Creset(%cr) %Creset<%an>%Creset' --abbrev-commit"
            vim.api.nvim_set_keymap("n", "<space>F", ":Files<CR>", keyopts)
            vim.api.nvim_set_keymap("n", '<space>s', ":Rg<CR>", keyopts)
            vim.api.nvim_set_keymap("n", "<space>l", ":BLines<CR>", keyopts)
            -- vim.api.nvim_set_keymap("n", "<M-x>", ":Commands<cr>", keyopts)
            -- vim.api.nvim_set_keymap("n", '<space>h', ":History<CR>", keyopts)
            -- vim.api.nvim_set_keymap("n", '<space>b', ":Buffers<CR>", keyopts)
            -- vim.api.nvim_set_keymap("n", '<space> ', ":Buffers<CR>", keyopts)
            vim.api.nvim_exec(
                [[
                command! -bar -bang -range=% Commits    <line1>,<line2>call fzf#vim#commits(fzf#vim#with_preview({ "placeholder": "" }), <bang>0)
                au FileType fzf tnoremap <buffer> jk jk
                au FileType fzf tmap <buffer> <Esc> <c-g>
                au FileType fzf tmap <buffer> <C-d> <c-g>
                au FileType fzf imap <buffer> <Esc> <c-g>
                au FileType fzf tmap <buffer> <C-j> <Down>
                au FileType fzf tmap <buffer> <Tab> <Down>
                au FileType fzf tmap <buffer> <S-Tab> <Up>
                au FileType fzf set laststatus=0 noshowmode
                au BufEnter term://*fzf* startinsert
                au BufLeave term://*fzf* set laststatus=2
                let g:fzf_action = { 'ctrl-o': '!open ', 'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit'}
                ]], "")
        end }

    use {'pechorin/any-jump.vim',
        keys = {"<space>J"},
        setup = function()
            vim.g.any_jump_window_width_ratio = 0.8
            vim.g.any_jump_window_height_ratio = 0.5
        end,
        config = function()
            local keyopts = {nowait = true, noremap = true, silent = true}
            vim.api.nvim_set_keymap("n", "<space>J", ":AnyJump<cr>", keyopts)
        end }

    use { 'phaazon/hop.nvim', as = 'hop',
        keys = {"f"},
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
            local keyopts = {nowait = true, noremap = true, silent = true}
            vim.api.nvim_set_keymap("n", "f", ":HopChar1<cr>", keyopts)
        end }


    use {'airblade/vim-rooter',
        config = function()
            vim.g.rooter_change_directory_for_non_project_files = 'current'
            vim.g.rooter_silent_chdir = 1
            vim.g.rooter_patterns = { "project.clj", "deps.edn", "go.mod", "package.json", "build.sbt", "sbt", "pom.xml", ".git", ".gitignore" }
        end }

    use {'kassio/neoterm',
        keys = {"<C-j>"},
        config = function()
            local keyopts = {nowait = true, noremap = true, silent = true}
            vim.g.neoterm_size = 25
            vim.g.neoterm_autoinsert = 1
            vim.g.neoterm_default_mod = "botright"
            vim.api.nvim_set_keymap("n", "<C-j>", ":botright Ttoggle<cr>", keyopts)
            vim.api.nvim_set_keymap("i", "<C-j>", "<C-\\><C-N><C-w><C-p>:botright Ttoggle<cr>", keyopts)
            vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-N><C-w><C-p>:botright Ttoggle<cr>", keyopts)
            vim.api.nvim_exec(
                [[
                au TermOpen * setlocal nonumber 
                au FileType neoterm nnoremap <silent> <buffer> <C-j> <C-\><C-N><C-w><C-p>:Tclose<cr>
                au FileType neoterm nnoremap <silent> <buffer> q <C-\><C-N><C-w><C-p>:Tclose<cr>
                au FileType neoterm tnoremap <silent> <buffer> <C-h> <C-\><C-N><C-\><C-N>:BufferPrevious<cr>
                au FileType neoterm tnoremap <silent> <buffer> <C-l> <C-\><C-N><C-\><C-N>:BufferNext<cr>
                au FileType neoterm tnoremap <silent> <buffer> <C-q> <C-\><C-N><C-w><C-p>:Tclose<cr>
                au FileType neoterm tnoremap <Esc> <c-\><c-n>
                ]], "")
        end }
    -- au FileType neoterm tnoremap jk <c-\><c-n>
    use {'nvim-telescope/telescope.nvim',
        disable = false,
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function()
            local keyopts = {nowait = true, noremap = true, silent = true}
            vim.api.nvim_set_keymap("n", '<space>f', ":Telescope find_files theme=get_ivy<CR>", keyopts)
            vim.api.nvim_set_keymap("n", '<space>b', ":Telescope buffers theme=get_ivy<CR>", keyopts)
            vim.api.nvim_set_keymap("n", '<tab>', ":Telescope buffers theme=get_ivy<CR>", keyopts)
            vim.api.nvim_set_keymap("n", '<space>h', ":Telescope oldfiles theme=get_ivy<CR>", keyopts)
            vim.api.nvim_set_keymap("n", '<space>m', ":Telescope marks theme=get_ivy<CR>", keyopts)
            vim.api.nvim_set_keymap("n", '<space>r', ":Telescope registers theme=get_ivy<CR>", keyopts)
            -- vim.api.nvim_set_keymap("n", '<space>l', ":Telescope current_buffer_fuzzy_find theme=get_ivy<CR>", keyopts)
            -- vim.api.nvim_set_keymap("n", '<space>i', ":Telescope lsp_document_symbols theme=get_ivy<CR>", keyopts)
            vim.api.nvim_set_keymap("n", '<M-x>', ":Telescope commands<CR>", keyopts)
            local actions = require('telescope.actions')
            require('telescope').setup{
                defaults = {
                    scroll_strategy = nil,
                    path_display = {
                      "absolute",
                    },
                    prompt_prefix="> ",
                    border = {},
                    selection_caret = "▶ ",
                    mappings = {
                        i = {
                            ["<PageDown>"] = actions.preview_scrolling_down,
                            ["<PageUp>"] = actions.preview_scrolling_up,
                            ["<esc>"] = actions.close,
                        },
                        n = {
                            ["<PageDown>"] = actions.preview_scrolling_down,
                            ["<PageUp>"] = actions.preview_scrolling_up,
                        }
                    }
                },
            }
        end }

    use {'neovim/nvim-lspconfig',
        requires = {{'kabouzeid/nvim-lspinstall', as='lspinstall'}},
        ft = {'rs', 'ts', 'js', 'tsx', 'yaml', 'json', 'lua', 'go', 'html'},
        config = function()
            local on_attach = function(client, bufnr)
                local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

                vim.api.nvim_exec([[autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 300)]], "")

                buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

                local opts = { noremap=true, silent=true }
                buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
                buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>zz', opts)
                buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                buf_set_keymap('n', 'gi', ':Telescope lsp_implementations theme=get_ivy<CR>', opts)
                buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
                buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
                buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
                buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
                buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
                buf_set_keymap('n', '<f2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                buf_set_keymap('n', 'gr', ':Telescope lsp_references theme=get_ivy<CR>', opts)
                buf_set_keymap('n', '<space>ee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
                buf_set_keymap('n', '<space>ep', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
                buf_set_keymap('n', '<space>en', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
                buf_set_keymap('n', '<space>el', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
                if client.resolved_capabilities.document_formatting then
                    buf_set_keymap("n", "<space>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
                end
            end
            vim.fn.sign_define('LspDiagnosticsSignError', { text = "▲", texthl = "LspDiagnosticsDefaultError"})
            vim.fn.sign_define('LspDiagnosticsSignWarning', { text = "▲", texthl = "LspDiagnosticsDefaultWarning"})
            vim.fn.sign_define('LspDiagnosticsSignInfo', { text = "ⓘ", texthl = "LspDiagnosticsDefaultInfo"})
            vim.fn.sign_define('LspDiagnosticsSignHint', { text = "", texthl = "LspDiagnosticsDefaultHint"})
            local lua_settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                        path = vim.split(package.path, ';'),
                    },
                    diagnostics = {
                        globals = {'vim'},
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                        },
                    },
                }
            }
            local rust_settings =  {
                 ["rust-analyzer"] = {
                      assist = {
                        importMergeBehavior = "last",
                        importPrefix = "by_self",
                      },
                      diagnostics = {
                        disabled = { "unresolved-proc-macro" }
                      },
                      cargo = {
                          loadOutDirsFromCheck = true
                      },
                      procMacro = {
                          enable = true
                      },
                      checkOnSave = {
                          command = "clippy"
                      },
                    }
                  }
            local scala_settings =  {
                 ["metals"] = {
                    sbtScript = "/Users/e103270/bin/sbt",
                  }
            }

            local function make_config()
                local capabilities = vim.lsp.protocol.make_client_capabilities()
                capabilities.textDocument.completion.completionItem.snippetSupport = true
                return {
                    capabilities = capabilities,
                    on_attach = on_attach,
                }
            end

            local function setup_servers()
                require'lspinstall'.setup()
                local servers = require'lspinstall'.installed_servers()
                -- ... and add manually installed servers
                table.insert(servers, "metals")
                -- table.insert(servers, "rust_analyzer")

                for _, server in pairs(servers) do
                    local config = make_config()
                    if server == "lua" then
                        config.settings = lua_settings
                    end
                    if server == "rust" then
                        config.settings = rust_settings
                    end
                    if server == "metals" then
                        config.cmd = {"/Users/e103270/Library/Application Support/Coursier/bin/metals"}
                        config.root_dir =  require'lspconfig'.util.root_pattern("sbt")
                        config.settings = scala_settings
                    end
                    require'lspconfig'[server].setup(config)
                end
            end

            setup_servers()

            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    virtual_text = true, signs = true, update_in_insert = false,
                }
            )
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with( vim.lsp.handlers.hover, { border = nil })

            require'lspinstall'.post_install_hook = function ()
                setup_servers()
                vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
            end
        end }

    -- use {'kosayoda/nvim-lightbulb',
    --     after = {'nvim-lspconfig'},
    --     config = function()
    --         vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
    --         vim.fn.sign_define('LightBulbSign', { text = "⚡", texthl = "LspDiagnosticsSignHint", linehl="", numhl="" })
    --         require'nvim-lightbulb'.update_lightbulb {
    --             sign = { enabled = true, priority = 10, },
    --             float = { enabled = false, text = "A", win_opts = {}, },
    --             virtual_text = { enabled = false, text = "A", }
    --         }
    --     end }

    -- use {'RishabhRD/nvim-lsputils',
    --     after = {'nvim-lspconfig'},
    --     config = function()
    --         vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
    --         vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
    --         vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
    --         vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
    --         vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
    --         vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
    --         vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
    --         vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
    --     end }

    -- use {'nvim-lua/lsp_extensions.nvim',
    --     after = {'nvim-lspconfig'},
    --     config = function()
    --         require'lsp_extensions'.inlay_hints{
    --             aligned = false,
    --             only_current_line = false }
    --             vim.api.nvim_exec([[ autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{highlight = 'NonText', prefix= ' » ', enabled = {"TypeHint", "ChainingHint", "ParameterHint"} } ]], "")
    --     end }

    -- use {'neoclide/coc.nvim', branch = 'release',
    -- config = function()
    --         local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    --         -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    --         local opts = { noremap=true, silent=true }
    --         buf_set_keymap('n', 'gD', '<Plug>(coc-declaration)<CR>', opts)
    --         buf_set_keymap('n', 'gd', '<Plug>(coc-definition)<CR>', opts)
    --         buf_set_keymap('n', 'gr', '<Plug>(coc-references)<CR>', opts)
    --         buf_set_keymap('n', '<space>a', '<Plug>(coc-codeaction)<CR>', opts)
    --         vim.api.nvim_set_keymap('n', 'K', ":call CocActionAsync('doHover')<CR>", opts)
    --         -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    --         -- buf_set_keymap('n', 'gi', ':Telescope lsp_implementations theme=get_ivy<CR>', opts)
    --         -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    --         -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    --         -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    --         -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    --         -- buf_set_keymap('n', '<f2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    --         -- buf_set_keymap('n', '<space>ee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    --         -- buf_set_keymap('n', '<space>ep', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    --         -- buf_set_keymap('n', '<space>en', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    --         -- buf_set_keymap('n', '<space>el', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    --     end}
    --
    -- use {'nvim-lua/completion-nvim',
    --     config = function()
    --         vim.api.nvim_exec([[autocmd BufEnter * lua require'completion'.on_attach()]],"")
    --     end}
end)
