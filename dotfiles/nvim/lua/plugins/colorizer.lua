return {
  "NvChad/nvim-colorizer.lua",
  ft = { "javascript", "css", "html" },
  config = function()
    local colorizer = require("colorizer")

    colorizer.setup({
      filetypes = {
        "css",
        "javascript",
        html = { mode = "foreground" },
      },
      user_default_options = { mode = "virtualtext", names = false },
    })
  end,
}
