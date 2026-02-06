return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local kanagawa = require("kanagawa")

    kanagawa.setup({
      statementStyle = { bold = false },
      typeStyle = { italic = false, bold = false },
      undercurl = false,
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
          BlinkCmpMenu = { fg = colors.palette.dragonWhite, bg = "none" },
          BlinkCmpMenuBorder = { fg = colors.palette.dragonWhite, bg = "none" },
          BlinkCmpDocBorder = { fg = colors.palette.dragonWhite, bg = "none" },
          BlinkCmpMenuSelection = { fg = "none", bg = theme.ui.bg_p2 },
          BlinkCmpScrollBarThumb = { bg = colors.palette.oldWhite },

          NormalFloat = { fg = colors.palette.dragonWhite, bg = "none" },
          FloatBorder = { fg = colors.palette.dragonWhite, bg = "none" },
          FloatTitle = { bg = "none" },

          WinSeparator = { fg = colors.palette.surimiOrange },

          Bold = { bold = false },
          Boolean = { bold = false },
          CurSearch = { fg = theme.ui.fg, bg = theme.ui.bg_search, bold = false },
          ["@keyword.operator"] = { fg = theme.syn.operator, bold = false },
          ["@lsp.typemod.function.readonly"] = { fg = theme.syn.fun, bold = false },
        }
      end,
    })

    vim.cmd([[colorscheme kanagawa-dragon]])
  end,
}
