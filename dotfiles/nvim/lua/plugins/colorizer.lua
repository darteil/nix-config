return {
  "catgoose/nvim-colorizer.lua",
  ft = { "css", "html" },
  config = function()
    local colorizer = require("colorizer")
    colorizer.setup({
      filetypes = {
        "css",
        html = { mode = "foreground" },
      },
      user_default_options = { mode = "virtualtext", names = false },
    })
  end,
}
