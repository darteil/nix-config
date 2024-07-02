return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  cmd = "Neogit",
  config = function()
    require("neogit").setup({
      graph_style = "unicode",
      signs = {
        hunk = { "", "" },
        item = { "+", "-" },
        section = { "+", "-" },
      },
    })
  end,
}
