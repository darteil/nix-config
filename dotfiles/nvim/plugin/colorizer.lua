vim.pack.add({ "https://github.com/catgoose/nvim-colorizer.lua" })

local colorizer = require("colorizer")
colorizer.setup({
  filetypes = {
    "css",
    html = { mode = "foreground" },
  },
  user_default_options = { mode = "virtualtext", names = false },
})
