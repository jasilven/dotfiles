
return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim'}
    use {'mbbill/undotree'}
    use {'cespare/vim-toml'}
    use {'farmergreg/vim-lastplace'}
    use {'terrortylor/nvim-comment' , config = function() require('nvim_comment').setup() end }
    use {'tpope/vim-surround'}
    use {'kyazdani42/nvim-web-devicons'}
    use {'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end }
    use {'tpope/vim-fugitive'}
    use {'Soares/base16.nvim', disable= true}
    use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim',
        config = function() 
            local neogit = require('neogit')
            neogit.setup {} 
        end }
    use {'sbdchd/neoformat', disable = false, cmd = 'Neoformat',
        config = function() vim.g.neoformat_enabled_yaml = {'prettier'} end }
    use {'windwp/nvim-autopairs',
        disable = false,
        config = function() require('nvim-autopairs').setup() end
    }

    use {'romgrk/barbar.nvim',
	config = function()
		local keyopts = {nowait = true, noremap = true, silent = true}
        vim.api.nvim_set_keymap("n", "<C-l>", ":BufferNext<CR>", keyopts)
        vim.api.nvim_set_keymap("n", "<C-right>", ":BufferNext<CR>", keyopts)
		vim.api.nvim_set_keymap("n", "<M-l>", ":BufferNext<CR>", keyopts)
		vim.api.nvim_set_keymap("n", "<C-h>", ":BufferPrevious<CR>", keyopts)
		vim.api.nvim_set_keymap("n", "<C-left>", ":BufferPrevious<CR>", keyopts)
		vim.api.nvim_set_keymap("n", "<M-h>", ":BufferPrevious<CR>", keyopts)
	end }

    use {'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function()
            local function lspclient()
                if next(vim.lsp.buf_get_clients()) == nil then
                   return ""
                else
                   return "✔ lsp"
                end
            end
            require('lualine').setup{
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch'},
                    lualine_c = { {'filename', full_path= true }, {'diagnostics', {sources = {'nvim_lsp'}}}},
                    lualine_x = {{lspclient},'filetype'},
                    lualine_y = {'', '', 'encoding'},
                    lualine_z = {'location'} },
                extensions = { 'fzf' },
                options = {
                    theme = 'nord',
                    section_separators = '',
                    component_separators = ''} }
        end }

    use { 'nvim-treesitter/nvim-treesitter',
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

    use {'hrsh7th/nvim-compe',
        disable = true,
        config = function()
            require('compe').setup{
                enabled = true;
                autocomplete = true;
                debug = false;
                min_length = 0;
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
                    calc = false;
                    vsnip = false;
                    nvim_lsp = true;
                    spell = true;
                    tags = false;
                    snippets_nvim = false;
                    treesitter = true;
                };
            }
        end }

    use {'junegunn/fzf.vim',
		requires = {{'junegunn/fzf'}},
		config = function()
			local keyopts = {nowait = true, noremap = true, silent = true}
			-- vim.g.fzf_layout = {down = "40%"}
			-- vim.g.fzf_preview_window = "right:50%"
			vim.g.fzf_buffers_jump = 1
			vim.g.fzf_commits_log_options = "--graph --color always --format='%C(auto)%h%d %s %C(black)%C(bold)%cr'"
			vim.api.nvim_set_keymap("n", "<space>s", ":Rg<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "<space>S", ":MyRgHome<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "<space>l", ":BLines<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "<space>F", ":Files ~<CR>", keyopts)
			-- vim.api.nvim_set_keymap("n", "<M-x>", ":Commands<cr>", keyopts)
			vim.api.nvim_exec(
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
				command! -bang -nargs=* MyRgHome call fzf#vim#grep('rg -- '.shellescape(<q-args>).' ~', 1, fzf#vim#with_preview({'options': ['--preview-window=right:50%']}), <bang>0)
				command! -bang -nargs=* MyRgHomeOld call fzf#vim#grep('rg --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>).' ~', 1, fzf#vim#with_preview({'options': ['--preview-window=right:50%']}), <bang>0)
				command! -bang -nargs=* MyNotes call fzf#vim#grep("rg --line-number --no-heading --color=never --smart-case -e '^# ' -- ~/notes | sort -k5 -k4M -k3 -n --reverse | column -t -s\#", 1, fzf#vim#with_preview({'options': ['--preview-window=right:50%']}), <bang>0)
				let g:XXfzf_colors = { 'fg+':  ['fg', 'FZF'], 'bg+':  ['bg', 'FZF'], 'hl+':  ['fg', 'FZF'], 'pointer': ['fg', 'FZF'], 'marker': ['fg', 'Comment'], 'fg':  ['fg', 'Normal'], 'bg':  ['bg', 'Normal'], 'hl':  ['fg', 'keyword'], 'info': ['fg', 'Comment'], 'border': ['fg', 'VertSplit'], 'prompt': ['fg', 'Function'], 'spinner': ['fg', 'Label'], 'header': ['fg', 'Comment'],  'gutter': ['bg', 'Normal'],} 
				let g:XYfzf_colors = { 'fg+':  ['fg', 'FZF'], 'bg+':  ['bg', 'FZF'], 'hl+':  ['fg', 'FZF'], 'pointer': ['fg', 'FZF'], 'gutter': ['bg', 'Normal'], 'hl': ['fg', 'keyword'], 'header': ['fg', 'Function'], 'info': ['fg', 'Comment'], 'prompt': ['fg', 'Function']} 
				let g:fzf_action = { 'ctrl-o': '!xdg-open ', 'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit' }
			]], "")
		end }

    use {'pechorin/any-jump.vim',
		config = function()
			local keyopts = {nowait = true, noremap = true, silent = true}
			vim.g.any_jump_window_width_ratio = 0.8
			vim.g.any_jump_window_height_ratio = 0.3
			vim.api.nvim_set_keymap("n", "<space>J", ":AnyJump<cr>", keyopts)
		end }

    use {'easymotion/vim-easymotion',
		config = function()
			vim.g.EasyMotion_keys = "abcdefghijklmnopqrstuvwxy"
			vim.api.nvim_set_keymap("n", "f", "<Plug>(easymotion-bd-f)", {nowait = true, silent = true})
		end }

    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function() require('gitsigns').setup() end
    }

    use {'mhinz/vim-signify',
        disable = true,
		config = function()
			vim.g.signify_line_highlight = 0
			vim.g.signify_disable_by_default = 1
		end }

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
			au FileType neoterm tnoremap jk <c-\><c-n>
			]], "")
		end }

    use {'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
		config = function()
			local keyopts = {nowait = true, noremap = true, silent = true}
			vim.api.nvim_set_keymap("n", '<space>f', ":Telescope find_files<CR>", keyopts)
			vim.api.nvim_set_keymap("n", '<space>n', ":Telescope file_browser<CR>", keyopts)
			vim.api.nvim_set_keymap("n", '<space>h', ":Telescope oldfiles<CR>", keyopts)
			vim.api.nvim_set_keymap("n", '<space>b', ":Telescope buffers<CR>", keyopts)
			vim.api.nvim_set_keymap("n", '<space> ', ":Telescope buffers<CR>", keyopts)
			vim.api.nvim_set_keymap("n", '<space>i', ":Telescope lsp_document_symbols<CR>", keyopts)
			vim.api.nvim_set_keymap("n", '<M-x>', ":Telescope commands<CR>", keyopts)
			local actions = require('telescope.actions')
			require('telescope').setup{
				defaults = {
					scroll_strategy = nil,
					shorten_path = false,
					prompt_position = "bottom",
					prompt_prefix="> ",
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

                  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

                  local opts = { noremap=true, silent=true }
                  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
                  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
                  buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
                  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
                  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
                  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
                  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                  buf_set_keymap('n', 'gr', ':Telescope lsp_references<CR>', opts)
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
              -- table.insert(servers, "clangd")

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
              setup_servers() -- reload installed servers
              vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
            end
	    end }

    use {'kosayoda/nvim-lightbulb',
        after = {'nvim-lspconfig'},
        config = function()
            vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
            vim.fn.sign_define('LightBulbSign', { text = "⚡", texthl = "Comment", linehl="", numhl="" })
            require'nvim-lightbulb'.update_lightbulb {
                sign = {
                    enabled = true,
                    priority = 10,
                },
                float = {
                    enabled = false,
                    text = "A",
                    win_opts = {},
                },
                virtual_text = {
                    enabled = false,
                    text = "A",
                }
            }
        end }

    use {'RishabhRD/nvim-lsputils',
        after = {'nvim-lspconfig'},
        config = function()
            vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
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
