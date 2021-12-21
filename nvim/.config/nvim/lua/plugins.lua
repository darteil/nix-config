return require("packer").startup(
  function()
    use "wbthomason/packer.nvim"

    use "ryanoasis/vim-devicons"
    use "windwp/nvim-autopairs"
    use "mhinz/vim-startify"
    use "tpope/vim-surround"
    use "christoomey/vim-tmux-navigator"
    use "mattn/emmet-vim"
    use "unblevable/quick-scope"
    use "neovim/nvim-lspconfig"
    use "antoinemadec/FixCursorHold.nvim"
    use "karb94/neoscroll.nvim"
    use "norcalli/nvim-colorizer.lua"
    use "jlanzarotta/bufexplorer"
    use "folke/trouble.nvim"
    use "folke/zen-mode.nvim"
    use "editorconfig/editorconfig-vim"
    use "nathom/filetype.nvim"
    use "stevearc/aerial.nvim"
    use "mhartington/formatter.nvim"

    use "junegunn/fzf"
    use "junegunn/fzf.vim"

    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/nvim-cmp"
    use "onsails/lspkind-nvim"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"

    use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}
    use {"sindrets/diffview.nvim", requires = {"nvim-lua/plenary.nvim"}}
    --use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {"hoob3rt/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons"}}
    use {"jose-elias-alvarez/buftabline.nvim"}
    use {"kyazdani42/nvim-tree.lua", requires = {"kyazdani42/nvim-web-devicons"}}
  end
)
