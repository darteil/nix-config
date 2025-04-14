return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      modules = {},
      sync_install = false,
      auto_install = true,
      ensure_installed = {
        "bash",
        "json",
        "typescript",
        "tsx",
        "lua",
        "luadoc",
        "vimdoc",
        "javascript",
        "html",
        "nix",
        "http",
      },
      ignore_install = {},
      highlight = {
        enable = true,
        disable = {},
      },
      incremental_selection = {
        enable = false,
      },
    })
  end,
}
