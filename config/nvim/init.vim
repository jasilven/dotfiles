call plug#begin('~/.local/share/nvim/site/plugged')
" call plug#begin('~/.config/nvim/plugged')
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'cespare/vim-toml'
Plug 'easymotion/vim-easymotion'
Plug 'farmergreg/vim-lastplace'
Plug 'gruvbox-community/gruvbox'
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'honza/vim-snippets'
Plug 'jasilven/redbush', { 'do': 'cargo install --path .' }
Plug 'jiangmiao/auto-pairs', { 'tag': 'v2.0.0' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kassio/neoterm'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'liuchengxu/vista.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'neovim/nvim-lsp'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-lua/completion-nvim'
Plug 'steelsojka/completion-buffers'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'pechorin/any-jump.vim'
Plug 'pseewald/vim-anyfold' 
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'mhinz/vim-startify'
" Plug '/home/jari/dev/rust/redbush/plugin'
call plug#end()

" lua require'plugins'
lua require'init'.setup()
