" call plug#begin('~/.vim/plugged')
" Plug 'cespare/vim-toml'
" Plug 'farmergreg/vim-lastplace'
" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-surround'
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'ryanoasis/vim-devicons'
" Plug 'mbbill/undotree'
" Plug 'guns/vim-sexp', { 'for': 'clojure' } 
" Plug 'jasilven/redbush', { 'for': 'clojure' }
" Plug 'vim-scripts/Align'
" Plug 'airblade/vim-rooter'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-vinegar'
" Plug 'easymotion/vim-easymotion'
" Plug 'jiangmiao/auto-pairs'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }| Plug 'junegunn/fzf.vim'
" Plug 'kassio/neoterm'
" Plug 'liuchengxu/vista.vim'
" Plug 'pechorin/any-jump.vim'
" Plug 'pseewald/vim-anyfold'
" Plug 'sbdchd/neoformat'
" Plug 'mhinz/vim-signify'
" Plug 'norcalli/nvim-colorizer.lua'
" Plug 'nvim-treesitter/nvim-treesitter' | Plug 'nvim-treesitter/nvim-treesitter-refactor' | Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" Plug 'neovim/nvim-lspconfig' | Plug 'nvim-lua/completion-nvim' | Plug 'nvim-lua/diagnostic-nvim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Plug 'kyazdani42/nvim-tree.lua'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'justinmk/vim-dirvish'
" call plug#end()

lua require("init")
" lua Setup_vimrooter()
" lua Setup_fugitive()
" lua Setup_easymotion()
" lua Setup_autopairs()
" lua Setup_fzf()
" lua Setup_neoterm()
" lua Setup_vista()
" lua Setup_gutentags()
" lua Setup_anyjump()
" lua Setup_anyfold()
" lua Setup_neoformat()
" lua Setup_signify()
" lua Setup_dirvish()

" lua Setup_nvimtree()
" lua Setup_colorizer()
" lua Setup_treesitter()
" lua Setup_lsp()
" lua Setup_cargo()
" lua Setup_go()
"lua Setup_coc()
