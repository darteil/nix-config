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
  -- use("jlanzarotta/bufexplorer")
  use("folke/trouble.nvim")
  use("editorconfig/editorconfig-vim")
  use("nathom/filetype.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use("Pocco81/TrueZen.nvim")
  use("kovetskiy/sxhkd-vim")
  use("b0o/schemastore.nvim")
  use("nvim-tree/nvim-web-devicons")
  use("hoob3rt/lualine.nvim")
  use("kyazdani42/nvim-tree.lua")
  use("junegunn/fzf")
  use("junegunn/fzf.vim")
  use("j-morano/buffer_manager.nvim")
  use("dnlhc/glance.nvim")

  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/nvim-cmp")
  use("onsails/lspkind-nvim")
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/vim-vsnip")

  use("nvim-lua/plenary.nvim")
  use("rktjmp/lush.nvim")

  use("ellisonleao/gruvbox.nvim")
  use("lewis6991/gitsigns.nvim")
  use("sindrets/diffview.nvim")
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({ "jose-elias-alvarez/buftabline.nvim" })
  use({ "numToStr/Navigator.nvim", commit = "6bfcf7d" })
  -- use({
  --   "folke/noice.nvim",
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   },
  -- })
end)
