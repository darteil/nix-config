return require("packer").startup(
  function()
    use "wbthomason/packer.nvim"

    use "ryanoasis/vim-devicons"
    use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    use "windwp/nvim-autopairs"
    use "mhinz/vim-startify"
    use "tpope/vim-surround"
    use "christoomey/vim-tmux-navigator"
    use "mattn/emmet-vim"
    use "unblevable/quick-scope"
    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-compe"
    use "lambdalisue/fern.vim"
    use "antoinemadec/FixCursorHold.nvim"
    use "junegunn/fzf"
    use "junegunn/fzf.vim"
    use "karb94/neoscroll.nvim"
    use "norcalli/nvim-colorizer.lua"
    use "jlanzarotta/bufexplorer"
    use "folke/trouble.nvim"
    use "tpope/vim-fugitive"
    use "lambdalisue/suda.vim"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {"hoob3rt/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons"}}
    use {"jose-elias-alvarez/buftabline.nvim"}
  end
)
