vim.pack.add({ "https://github.com/rebelot/kanagawa.nvim" })

local kanagawa = require("kanagawa")

kanagawa.setup({
  statementStyle = { bold = false },
  typeStyle = { italic = false, bold = false },
  commentStyle = { italic = false },
  keywordStyle = { italic = false },
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
      BlinkCmpMenu = { fg = colors.palette.dragonWhite, bg = theme.ui.bg_p1 },
      BlinkCmpMenuBorder = { fg = colors.palette.dragonWhite, bg = theme.ui.bg_p1 },
      BlinkCmpDoc = { fg = colors.palette.dragonWhite, bg = theme.ui.bg_p1 },
      BlinkCmpDocBorder = { fg = colors.palette.dragonWhite, bg = theme.ui.bg_p1 },
      BlinkCmpMenuSelection = { fg = "none", bg = theme.ui.bg_p2 },
      BlinkCmpScrollBarThumb = { bg = colors.palette.oldWhite },

      NormalFloat = { fg = colors.palette.dragonWhite, bg = theme.ui.bg_p1 },
      FloatBorder = { fg = colors.palette.dragonWhite, bg = theme.ui.bg_p1 },
      FloatTitle = { bg = "none" },

      WinSeparator = { fg = colors.palette.surimiOrange },

      Bold = { bold = false },
      Boolean = { bold = false },
      CurSearch = { fg = theme.ui.fg, bg = theme.ui.bg_search, bold = false },
      ["@keyword.operator"] = { fg = theme.syn.operator, bold = false },
      ["@lsp.typemod.function.readonly"] = { fg = theme.syn.fun, bold = false },
      ["@variable.builtin"] = { italic = false },
    }
  end,
})

vim.cmd([[colorscheme kanagawa-dragon]])
