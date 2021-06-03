return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim'}
    use {'terrortylor/nvim-comment', config = function() require('nvim_comment').setup() end }
    use {'tpope/vim-surround'}
    use {'kyazdani42/nvim-web-devicons'}
    use {'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end }
    use {'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end }
    use {'ethanholz/nvim-lastplace', config = function() require'nvim-lastplace'.setup() end}
    use {'sindrets/diffview.nvim'}
    use {'tamago324/lir.nvim', requires = 'nvim-lua/plenary.nvim',
        config = function()
            local actions = require'lir.actions'
            local mark_actions = require 'lir.mark.actions'
            local clipboard_actions = require'lir.clipboard.actions'
			local keyopts = {nowait = true, noremap = true, silent = true}
			vim.api.nvim_set_keymap("n", '<space>n', ":edit .<CR>", keyopts)
			vim.api.nvim_set_keymap("n", '-', ":edit .<CR>", keyopts)
            require'lir'.setup {
              show_hidden_files = false,
              devicons_enable = true,
              mappings = {
                ['l']     = actions.edit,
                ['<Enter>'] = actions.edit,
                ['q'] = actions.quit,
                ['<Esc>'] = actions.quit,
                ['<C-s>'] = actions.split,
                ['<C-v>'] = actions.vsplit,
                ['<C-t>'] = actions.tabedit,
                ['h']     = actions.up,
                ['K']     = actions.mkdir,
                ['N']     = actions.newfile,
                ['R']     = actions.rename,
                ['@']     = actions.cd,
                ['Y']     = actions.yank_path,
                ['.']     = actions.toggle_show_hidden,
                ['D']     = actions.delete,
                ['J'] = function()
                  mark_actions.toggle_mark()
                  vim.cmd('normal! j')
                end,
                ['C'] = clipboard_actions.copy,
                ['X'] = clipboard_actions.cut,
                ['P'] = clipboard_actions.paste,
              },
              float = {
                -- If you want to configure the height and width of the window individually,
                -- pass in a table like so: { width = 0.5, height = 0.8 }
                size_percentage = 0.5,
                winblend = 15,
                border = true,
                borderchars = {"╔" , "═" , "╗" , "║" , "╝" , "═" , "╚", "║"},
                -- -- If you want to use `shadow`, set `shadow` to `true`.
                -- -- Also, if you set shadow to true, the value of `borderchars` will be ignored.
                shadow = false,
              },
            }
        end}

    use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim',
        config = function()
            local neogit = require('neogit')
            neogit.setup { disable_context_highlighting = true, }
        end }

    use {'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function()
            local function lspclient()
                if next(vim.lsp.buf_get_clients()) == nil then
                   return ""
                else
                   return "lsp"
                end
            end
            local function dir()
                local dir = string.match(vim.fn.getcwd(),"[^/]*$")
                if dir == nil then
                    dir = "<n/a>"
                end
                return dir
            end
            local custom_gruvbox = require'lualine.themes.gruvbox'
            local bg = '#4d4d66'
            local inactive_bg = '#4d4d66'
            local fg = '#d9d9d9'
            custom_gruvbox.normal.a.bg = bg
            custom_gruvbox.normal.a.fg = fg
            custom_gruvbox.normal.b.bg = bg
            custom_gruvbox.normal.b.fg = fg
            custom_gruvbox.normal.c.bg = bg
            custom_gruvbox.normal.c.fg = fg

            custom_gruvbox.insert.a.bg = '#e2bf78'
            custom_gruvbox.insert.a.fg = bg
            custom_gruvbox.insert.b.bg = bg
            custom_gruvbox.insert.b.fg = fg
            custom_gruvbox.insert.c.bg = bg
            custom_gruvbox.insert.c.fg = fg

            custom_gruvbox.inactive.a.bg = inactive_bg
            custom_gruvbox.inactive.a.fg = fg
            custom_gruvbox.inactive.b.bg = inactive_bg
            custom_gruvbox.inactive.b.fg = fg
            custom_gruvbox.inactive.c.bg = inactive_bg
            custom_gruvbox.inactive.c.fg = fg

            custom_gruvbox.visual.a.bg = '#e2bf78'
            custom_gruvbox.visual.a.fg = bg
            custom_gruvbox.visual.b.bg = bg
            custom_gruvbox.visual.b.fg = fg
            custom_gruvbox.visual.c.bg = bg
            custom_gruvbox.visual.c.fg = fg

            custom_gruvbox.replace = custom_gruvbox.visual
            custom_gruvbox.command = custom_gruvbox.visual
            require('lualine').setup{
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {{dir}},
                    lualine_c = {{'filename', path = 1, shorten = false, full_name = true}, {'diagnostics', sources = {'nvim_lsp'}, color_error = '#ffffff', color_warn = '#ffffff', color_info = '#ffffff', color_hint = '#ffffff'}},
                    lualine_x = {},
                    lualine_y = {{lspclient}, 'branch', {'filetype', colored = false}, 'encoding'},
                    lualine_z = {'location'} },
                extensions = { 'fzf' },
                options = {
                    theme = custom_gruvbox,
                    section_separators = '',
                    component_separators = ''} }
        end }

    use {'nvim-treesitter/playground',
        config = function ()
		    local keyopts = {nowait = true, noremap = true, silent = true}
		    vim.api.nvim_set_keymap("n", "<f10>", ":TSHighlightCapturesUnderCursor<CR>", keyopts)
        end}

    use {'nvim-treesitter/nvim-treesitter',
        requires = {{'nvim-treesitter/nvim-treesitter-textobjects'}, {'nvim-treesitter/nvim-treesitter-refactor'}},
        run = ':TSUpdate',
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

    use {'nvim-lua/completion-nvim',
        config = function()
			vim.api.nvim_exec([[autocmd BufEnter * lua require'completion'.on_attach()]],"")
        end}

    use {'junegunn/fzf.vim',
		requires = {{'junegunn/fzf'}},
		config = function()
			local keyopts = {nowait = true, noremap = true, silent = true}
			vim.g.fzf_layout = {down = "40%"}
            vim.g.fzf_layout = { window = { width = 1.0, height = 0.4, relative=false, yoffset= 1.0 } }
			-- vim.g.fzf_preview_window = "up:50%"
			vim.g.fzf_preview_window = {}
			vim.g.fzf_buffers_jump = 1
			vim.g.fzf_commits_log_options = "--graph --color always --format='%C(auto)%h%d %s %C(black)%C(bold)%cr'"
			vim.api.nvim_set_keymap("n", "<space>s", ":Rg<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "<space>l", ":BLines<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "<space>f", ":Files<CR>", keyopts)
			-- vim.api.nvim_set_keymap("n", '<space>b', ":Buffers<CR>", keyopts)
			-- vim.api.nvim_set_keymap("n", '<space> ', ":Buffers<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "<M-x>", ":Commands<cr>", keyopts)
			vim.api.nvim_exec(
				[[
				au FileType fzf tnoremap <buffer> jk jk
				au FileType fzf tmap <buffer> <Esc> <c-g>
				au FileType fzf imap <buffer> <Esc> <c-g>
				au FileType fzf tmap <buffer> <C-j> <Down>
				au FileType fzf tmap <buffer> <Tab> <Down>
				au FileType fzf tmap <buffer> <S-Tab> <Up>
				au FileType fzf set laststatus=0 noshowmode
				au BufEnter term://*fzf* startinsert
				au BufLeave term://*fzf*  set laststatus=2
				command! -bang -nargs=* MyRgHome call fzf#vim#grep('rg -- '.shellescape(<q-args>).' ~', 1, fzf#vim#with_preview({'options': ['--preview-window=right:50%']}), <bang>0)
				let g:fzf_colors = { 'fg+':  ['fg', 'Search'], 'bg+':  ['bg', 'Search'], 'hl+':  ['fg', 'Search'], 'pointer': ['fg', 'Search'], 'gutter': ['bg', 'Normal'], 'hl': ['fg', 'Search'], 'header': ['fg', 'Function'], 'info': ['fg', 'Comment'], 'prompt': ['fg', 'Function']} 
				let g:fzf_action = { 'ctrl-o': '!open ', 'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit'}
			]], "")
		end }

    use {'pechorin/any-jump.vim',
		config = function()
			vim.g.any_jump_window_width_ratio = 0.8
			vim.g.any_jump_window_height_ratio = 0.3
			local keyopts = {nowait = true, noremap = true, silent = true}
			vim.api.nvim_set_keymap("n", "<space>J", ":AnyJump<cr>", keyopts)
		end }

    use { 'phaazon/hop.nvim', as = 'hop',
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
			local keyopts = {nowait = true, noremap = true, silent = true}
			vim.api.nvim_set_keymap("n", "f", ":HopChar1<cr>", keyopts)
        end }

    use {'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function() require('gitsigns').setup() end
    }

    use {'airblade/vim-rooter',
		config = function()
			vim.g.rooter_change_directory_for_non_project_files = 'current'
			vim.g.rooter_silent_chdir = 1
			vim.g.rooter_patterns = { "project.clj", "deps.edn", "go.mod", "package.json", "build.sbt", "pom.xml", ".git" }
		end }

    use {'kassio/neoterm',
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
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
		config = function()
			local keyopts = {nowait = true, noremap = true, silent = true}
			-- vim.api.nvim_set_keymap("n", '<space>f', ":Telescope find_files<CR>", keyopts)
			-- vim.api.nvim_set_keymap("n", '<space>s', ":Telescope grep_string<CR>", keyopts)
			-- vim.api.nvim_set_keymap("n", '<space>b', ":Telescope buffers<CR>", keyopts)
			vim.api.nvim_set_keymap("n", '<space>b', ":Telescope buffers theme=get_ivy<CR>", keyopts)
			vim.api.nvim_set_keymap("n", '<space> ', ":Telescope buffers theme=get_ivy<CR>", keyopts)
			vim.api.nvim_set_keymap("n", '<space>h', ":Telescope oldfiles theme=get_ivy<CR>", keyopts)
			vim.api.nvim_set_keymap("n", '<space>i', ":Telescope lsp_document_symbols theme=get_ivy<CR>", keyopts)
			vim.api.nvim_set_keymap("n", '<M-x>', ":Telescope commands<CR>", keyopts)
			local actions = require('telescope.actions')
			require('telescope').setup{
				defaults = {
					scroll_strategy = nil,
					shorten_path = false,
					prompt_position = "bottom",
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
        requires = {'RishabhRD/popfix', 'nvim-lua/completion-nvim', 'kabouzeid/nvim-lspinstall'},
        config = function()
              local on_attach = function(client, bufnr)
                  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

                  vim.api.nvim_exec([[autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)]], "")

                  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

                  local opts = { noremap=true, silent=true }
                  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
                  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                  buf_set_keymap('n', 'gi', ':Telescope lsp_implementations theme=get_dropdown<CR>', opts)
                  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
                  buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
                  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
                  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
                  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
                  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                  buf_set_keymap('n', '<f2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                  buf_set_keymap('n', 'gr', ':Telescope lsp_references theme=get_dropdown<CR>', opts)
                  buf_set_keymap('n', '<space>ee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
                  buf_set_keymap('n', '<space>ep', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
                  buf_set_keymap('n', '<space>en', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
                  buf_set_keymap('n', '<space>el', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
                  if client.resolved_capabilities.document_formatting then
                    buf_set_keymap("n", "<space>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
                  end
             end
             vim.fn.sign_define('LspDiagnosticsSignError', { text = "⛔", texthl = "ErrorMsg"})
             vim.fn.sign_define('LspDiagnosticsSignWarning', { text = "▲", texthl = "WarningMsg"})
             vim.fn.sign_define('LspDiagnosticsSignInfo', { text = "", texthl = "MoreMsg"})
             vim.fn.sign_define('LspDiagnosticsSignHint', { text = "", texthl = "Comment"})
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

            local function make_config()
              local capabilities = vim.lsp.protocol.make_client_capabilities()
              -- capabilities.textDocument.completion.completionItem.snippetSupport = true
              return {
                capabilities = capabilities,
                on_attach = on_attach,
              }
            end
            local function setup_servers()
              require'lspinstall'.setup()
              local servers = require'lspinstall'.installed_servers()
              -- ... and add manually installed servers
              -- table.insert(servers, "clangd")
              -- table.insert(servers, "rust_analyzer")

              for _, server in pairs(servers) do
                local config = make_config()
                if server == "lua" then
                  config.settings = lua_settings
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
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with( vim.lsp.handlers.hover, { border = "single" })
            require'lspinstall'.post_install_hook = function ()
              setup_servers()
              vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
            end
	    end }

    use {'kosayoda/nvim-lightbulb',
        after = {'nvim-lspconfig'},
        config = function()
            vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
            vim.fn.sign_define('LightBulbSign', { text = "⚡", texthl = "Comment", linehl="", numhl="" })
            require'nvim-lightbulb'.update_lightbulb {
                sign = { enabled = true, priority = 10, },
                float = { enabled = false, text = "A", win_opts = {}, },
                virtual_text = { enabled = false, text = "A", }
            }
        end }

    use {'RishabhRD/nvim-lsputils',
        after = {'nvim-lspconfig'},
        config = function()
            vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
            vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
            vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
            vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
            vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
            vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
            vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
            vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
        end }
end)
