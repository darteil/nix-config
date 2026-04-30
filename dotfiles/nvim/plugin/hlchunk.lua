vim.pack.add({ "https://github.com/shellRaining/hlchunk.nvim" })

require("hlchunk").setup({
  exclude_filetypes = {
    bufexplorer = true,
  },
  chunk = {
    enable = true,
    delay = 0,
    chars = {
      horizontal_line = "─",
      vertical_line = "│",
      left_top = "┌",
      left_bottom = "└",
      right_arrow = "─",
    },
  },
})
