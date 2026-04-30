vim.pack.add({
  { src = "https://github.com/coffebar/neovim-project" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/Shatur/neovim-session-manager" },
})

require("neovim-project").setup({
  projects = {
    "~/nix-config",
    "~/Development/github/*",
    "~/Development/work/*",
    "~/Development/other/*",
  },
  picker = {
    type = "fzf-lua",
  },
  last_session_on_startup = false,
})
