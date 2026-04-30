vim.pack.add({ "https://github.com/esmuellert/codediff.nvim" })

require("codediff").setup({
  explorer = {
    indent_markers = false,
    view_mode = "list",
    file_filter = {
      ignore = {},
    },
  },
})
