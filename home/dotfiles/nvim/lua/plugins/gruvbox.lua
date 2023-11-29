return {
  "ellisonleao/gruvbox.nvim",
  config = function()
    local gruvbox = require("gruvbox")

    gruvbox.setup({
      undercurl = true,
      underline = true,
      bold = false,
      italic = {
        strings = false,
        comments = true,
        operators = false,
        folds = false,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true,
      contrast = "",
      palette_overrides = {},
      dim_inactive = false,
      transparent_mode = false,

      overrides = {},
    })

    vim.o.background = "dark"
    vim.cmd([[colorscheme gruvbox]])

    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#282828" })
  end,
}
