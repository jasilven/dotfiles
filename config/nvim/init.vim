call plug#begin('~/.local/share/nvim/site/plugged')

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
Plug 'liuchengxu/vista.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'pechorin/any-jump.vim'
Plug 'pseewald/vim-anyfold' 
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'joshdick/onedark.vim'

"" neovim 0.5 lsp
Plug 'nvim-lua/diagnostic-nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'neovim/nvim-lsp'

"" neovim 0.5 other 
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'norcalli/nvim-colorizer.lua'

"" disabled
"" Plug 'neoclide/coc.nvim', {'branch': 'release'}
"" Plug '/home/jari/dev/rust/redbush/plugin'
"""Plug 'steelsojka/completion-buffers'

call plug#end()

nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

lua require'init'.setup()
