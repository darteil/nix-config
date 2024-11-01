return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local kanagawa = require("kanagawa")

    kanagawa.setup({
      undercurl = false,
      keywordStyle = { italic = false },
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { link = "Normal" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          WinSeparator = { fg = theme.ui.nontext },

          TelescopePromptBorder = { fg = theme.ui.nontext },
          TelescopeResultsBorder = { fg = theme.ui.nontext },
          TelescopePreviewBorder = { fg = theme.ui.nontext },
        }
      end,
    })

    vim.cmd([[colorscheme kanagawa-dragon]])
  end,
}
