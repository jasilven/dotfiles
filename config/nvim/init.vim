lua require("init")

call plug#begin('~/.vim/plugged')
Plug 'cespare/vim-toml'
Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'mbbill/undotree'
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'guns/vim-sexp', { 'for': 'clojure' } 
Plug 'jasilven/redbush', { 'for': 'clojure' }
Plug 'flazz/vim-colorschemes' 
Plug 'vim-scripts/Align'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
" Plug 'junegunn/fzf' | Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }| Plug 'junegunn/fzf.vim'
" Plug 'junegunn/fzf', {'run': './install --all'} | Plug 'junegunn/fzf.vim'
Plug 'kassio/neoterm'
Plug 'liuchengxu/vista.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'pechorin/any-jump.vim'
Plug 'pseewald/vim-anyfold'
Plug 'sbdchd/neoformat'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'justinmk/vim-dirvish'
" Plug 'kyazdani42/nvim-tree.lua'
Plug 'jasilven/nvim-tree.lua', {'branch': 'feat/allow-width-resize'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig' | Plug 'nvim-lua/completion-nvim' | Plug 'nvim-lua/diagnostic-nvim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

lua Setup_vimrooter()
lua Setup_fugitive()
lua Setup_easymotion()
lua Setup_autopairs()
lua Setup_fzf()
lua Setup_neoterm()
lua Setup_vista()
lua Setup_gutentags()
lua Setup_anyjump()
lua Setup_anyfold()
lua Setup_neoformat()
lua Setup_startify()
lua Setup_signify()
lua Setup_dirvish()
lua Setup_nvimtree()
lua Setup_colorizer()
lua Setup_treesitter()
lua Setup_lsp()

lua Setup_cargo()
lua Setup_go()

"lua Setup_coc()

lua require "colors".MyColors()
