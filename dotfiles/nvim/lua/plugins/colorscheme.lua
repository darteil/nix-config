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
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
          PmenuSel = { fg = "none", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = colors.palette.oldWhite },

          NormalFloat = { theme.ui.shade0, bg = theme.ui.bg_p1 },
          FloatBorder = { bg = theme.ui.bg_p1 },
          FloatTitle = { bg = "none" },

          WinSeparator = { bg = theme.ui.bg_p2 },

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
