return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'ryanoasis/vim-devicons'
  use 'gruvbox-community/gruvbox'
  use 'jiangmiao/auto-pairs'
  use 'alvan/vim-closetag'
  use 'mhinz/vim-startify'
  use 'jlanzarotta/bufexplorer'
  use 'tpope/vim-surround'
  use 'airblade/vim-gitgutter'
  use 'christoomey/vim-tmux-navigator'
  use 'mattn/emmet-vim'
  use 'szw/vim-maximizer'
  use 'unblevable/quick-scope'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'onsails/lspkind-nvim'
  use 'lambdalisue/fern.vim'
  use 'antoinemadec/FixCursorHold.nvim'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use { 'prettier/vim-prettier',  run = 'npm install' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons' }
}
end)
