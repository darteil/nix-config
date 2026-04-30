vim.pack.add({ "https://github.com/j-hui/fidget.nvim" })

require("fidget").setup({
  progress = {
    display = {
      done_ttl = 3,
      done_icon = "OK",
      -- Highlight group for in-progress LSP tasks
      progress_style = "Visual",
    },
  },
  notification = {
    window = {
      avoid = { "NvimTree" },
    },
  },
})
