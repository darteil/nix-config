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
