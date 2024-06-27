return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local kanagawa = require("kanagawa")

    kanagawa.setup({
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
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          WinSeparator = { fg = theme.ui.nontext },

          TelescopePromptBorder = { fg = theme.ui.nontext },
          TelescopeResultsBorder = { fg = theme.ui.nontext },
          TelescopePreviewBorder = { fg = theme.ui.nontext },
        }
      end,
    })

    vim.cmd([[colorscheme kanagawa-dragon]])

    local colors = require("kanagawa.colors").setup()
    local palette_colors = colors.palette

    vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = palette_colors.springGreen })
    vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = palette_colors.samuraiRed })
    vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = palette_colors.roninYellow })
    vim.api.nvim_set_hl(0, "NeoTreeGitRenamed", { fg = palette_colors.waveAqua1 })
    vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = palette_colors.surimiOrange })
    vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = palette_colors.katanaGray })
    vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", { fg = palette_colors.dragonBlue })
    vim.api.nvim_set_hl(0, "NeoTreeGitStaged", { fg = palette_colors.roninYellow })
    vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { fg = palette_colors.samuraiRed })
    vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = palette_colors.dragonBlue })
    vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = palette_colors.dragonBlue })
    vim.api.nvim_set_hl(0, "Search", { link = "IncSearch" })
    vim.api.nvim_set_hl(0, "CurSearch", { bg = "none", fg = palette_colors.springBlue })

    -- vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { link = "GruvboxWhite" })
  end,
}
