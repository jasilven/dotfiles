
return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim'}
    use {'hrsh7th/vim-vsnip'}
    use {'mbbill/undotree'}
    use {'cespare/vim-toml'}
    use {'farmergreg/vim-lastplace'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-surround'}
    use {'kyazdani42/nvim-web-devicons'}
    use {'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end }
    use {'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end }
    use {'tpope/vim-fugitive'}
    -- use {'junegunn/vim-easy-align'}

    use {'romgrk/barbar.nvim',
	config = function()
		local keyopts = {nowait = true, noremap = true, silent = true}
		vim.api.nvim_set_keymap("n", "<C-l>", ":BufferNext<CR>", keyopts)
		vim.api.nvim_set_keymap("n", "<M-l>", ":BufferNext<CR>", keyopts)
		vim.api.nvim_set_keymap("n", "<C-h>", ":BufferPrevious<CR>", keyopts)
		vim.api.nvim_set_keymap("n", "<M-h>", ":BufferPrevious<CR>", keyopts)
	end }

    use {'hoob3rt/lualine.nvim',
        config = function()
            require('lualine').setup{
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch'},
                    lualine_c = { {'filename', full_path= true }, {'diagnostics', {sources = {'nvim_lsp'}}}},
                    lualine_x = {''},
                    lualine_y = {'', 'filetype', 'encoding'},
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

    use {'hrsh7th/nvim-compe',
        config = function()
            require('compe').setup{
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
                    spell = true;
                    tags = true;
                    snippets_nvim = true;
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
			vim.api.nvim_set_keymap("n", "<space>j", ":AnyJump<cr>", keyopts)
		end }

    use {'easymotion/vim-easymotion',
		config = function()
			vim.g.EasyMotion_keys = "abcdefghijklmnopqrstuvwxy"
			vim.api.nvim_set_keymap("n", "f", "<Plug>(easymotion-bd-f)", {nowait = true, silent = true})
		end }

    use {'mhinz/vim-signify',
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
			vim.api.nvim_set_keymap("n", "<space>f", ":Telescope find_files<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "<space>n", ":Telescope file_browser<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "<space>h", ":Telescope oldfiles<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "<space>b", ":Telescope buffers<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "<space>i", ":Telescope lsp_document_symbols<CR>", keyopts)
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
        requires = {'RishabhRD/popfix'},
        config = function()
			local keyopts = {nowait = true, noremap = true, silent = true}
			vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "<RightMouse>", "<RightMouse><cmd>lua vim.lsp.buf.hover()<CR><esc>", keyopts)
			vim.api.nvim_set_keymap("n", "<M-k>", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", keyopts)
			-- vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_dropdown({}))<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "<f2>", "<cmd>lua vim.lsp.buf.rename()<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "<space>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "<space>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "<space>ee", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "<space>en", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "<space>ep", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "<space>el", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", keyopts)
			-- vim.api.nvim_set_keymap("n", "<space>i", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", keyopts)
			vim.api.nvim_set_keymap("n", "<f8>", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", keyopts)
			vim.api.nvim_exec("au BufWritePre *.rs lua vim.lsp.buf.formatting_sync({}, 300)", "")

            vim.fn.sign_define("LspDiagnosticsSignError", {text = "⛔", texthl = "LspDiagnosticsSignError"})
            vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "⚑", texthl = "LspDiagnosticsSignWarning"})
            vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", texthl = "LspDiagnosticsSignInformation"})
            -- vim.fn.sign_define("LspDiagnosticsSignHint", {text = "ﯦ", texthl = "LspDiagnosticsSignInformation"})

			require "lspconfig".rust_analyzer.setup {
				settings = {
				["rust-analyzer"] = {
					diagnostics = {
						enable = true,
						disabled = {"unresolved-proc-macro"},
						enableExperimental = true }
					}
				}
			}
			require "lspconfig".jsonls.setup {}
			require "lspconfig".tsserver.setup {}
			require "lspconfig".gopls.setup {}
			require "lspconfig".html.setup {}
			require "lspconfig".yamlls.setup{}
			local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
			require "lspconfig".sumneko_lua.setup{
				cmd = {"/usr/bin/lua-language-server", "-E", sumneko_root_path .. "/main.lua"},
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

    use {'nvim-lua/diagnostic-nvim',
        after = {'nvim-lspconfig'},
        config = function()
            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    virtual_text = true,
                    signs = true,
                    update_in_insert = false,
                    underline = true
				}
			)
        end }
end)
