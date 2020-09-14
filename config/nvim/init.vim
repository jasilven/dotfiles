call plug#begin('~/.vim/plugged')
Plug 'cespare/vim-toml'
Plug 'farmergreg/vim-lastplace'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'chriskempson/base16-vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-rooter'
Plug 'easymotion/vim-easymotion'
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'jasilven/redbush', { 'for': 'clojure' }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', {'run': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'kassio/neoterm'
Plug 'liuchengxu/vista.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'pechorin/any-jump.vim'
Plug 'pseewald/vim-anyfold'
Plug 'sbdchd/neoformat'
Plug 'mhinz/vim-startify'
Plug 'flazz/vim-colorschemes' 
Plug 'vim-scripts/Align'
Plug 'bagrat/vim-buffet' 
Plug 'mhinz/vim-signify'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lsp'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}

" Plug 'lambdalisue/fern.vim'
" Plug 'tpope/vim-vinegar'
" Plug 'wincent/ferret'
" Plug 'diepm/vim-rest-console'
" Plug 'majutsushi/tagbar'
" Plug 'wincent/loupe'
" Plug 'ap/vim-buftabline'
" Plug 'kyazdani42/nvim-tree.lua'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

lua require("init")
