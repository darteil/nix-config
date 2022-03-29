local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
  },
})

return packer.startup(function()
  use("wbthomason/packer.nvim")

  use("ryanoasis/vim-devicons")
  use("windwp/nvim-autopairs")
  use("unblevable/quick-scope")
  use("neovim/nvim-lspconfig")
  use("karb94/neoscroll.nvim")
  use("norcalli/nvim-colorizer.lua")
  use("jlanzarotta/bufexplorer")
  use("folke/trouble.nvim")
  use("editorconfig/editorconfig-vim")
  use("nathom/filetype.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use("Pocco81/TrueZen.nvim")

  use("junegunn/fzf")
  use("junegunn/fzf.vim")

  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/nvim-cmp")
  use("onsails/lspkind-nvim")
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/vim-vsnip")

  use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
  use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
  use({ "sindrets/diffview.nvim", requires = { "nvim-lua/plenary.nvim" } })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({ "hoob3rt/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
  use({ "jose-elias-alvarez/buftabline.nvim" })
  use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })
  use({ "numToStr/Navigator.nvim", commit = "6bfcf7d" })
end)
