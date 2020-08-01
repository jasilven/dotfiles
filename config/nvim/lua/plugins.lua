-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Temporary until https://github.com/neovim/neovim/pull/12632 is merged
vim._update_package_paths()

local packer = require("packer")
-- packer.init({package_root = "/home/jari/.local/share/nvim/site/pack"})
-- packer.init()
return packer.startup(
    function()
        -- Packer can manage itself as an optional plugin
        use {"wbthomason/packer.nvim", opt = true}
        use "9mm/vim-closer"
        use "SirVer/ultisnips"
        use "airblade/vim-gitgutter"
        use "airblade/vim-rooter"
        use "cespare/vim-toml"
        use "easymotion/vim-easymotion"
        use "farmergreg/vim-lastplace"
        use "gruvbox-community/gruvbox"
        use {"guns/vim-sexp", ft = {"clojure"}}
        use "honza/vim-snippets"
        use {"jasilven/redbush", run = "cargo install --path ."}
        use "jiangmiao/auto-pairs"
        use "junegunn/fzf"
        use "junegunn/fzf.vim"
        use "kassio/neoterm"
        use "kyazdani42/nvim-tree.lua"
        use "kyazdani42/nvim-web-devicons"
        use "liuchengxu/vista.vim"
        use "ludovicchabant/vim-gutentags"
        use "majutsushi/tagbar"
        use "mbbill/undotree"
        use "neovim/nvim-lsp"
        use "norcalli/nvim-colorizer.lua"
        use "nvim-lua/completion-nvim"
        use "steelsojka/completion-buffers"
        use "nvim-treesitter/nvim-treesitter"
        use "pechorin/any-jump.vim"
        use "pseewald/vim-anyfold"
        use "sbdchd/neoformat"
        use "sheerun/vim-polyglot"
        use "tpope/vim-commentary"
        use "tpope/vim-fugitive"
        use "tpope/vim-surround"
        use "nvim-lua/diagnostic-nvim"
    end
)
