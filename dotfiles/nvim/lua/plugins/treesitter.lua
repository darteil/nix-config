return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdateSync" },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      ensure_installed = {
        "bash",
        "json",
        "typescript",
        "tsx",
        "lua",
        "luadoc",
        "javascript",
        "html",
        "markdown",
        "nix",
      },
      ignore_install = { "vimdoc", "help" },
      highlight = {
        enable = true,
        disable = { "vimdoc", "help" },
      },
      incremental_selection = {
        enable = false,
      },
    })
  end,
}
