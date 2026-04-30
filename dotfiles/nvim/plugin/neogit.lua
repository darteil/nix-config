vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/NeogitOrg/neogit",
})

require("neogit").setup({
  graph_style = "unicode",
  signs = {
    hunk = { "", "" },
    item = { "+", "-" },
    section = { "+", "-" },
  },
  commit_editor = {
    kind = "tab",
    staged_diff_split_kind = "vsplit",
    spell_check = false,
  },
})
