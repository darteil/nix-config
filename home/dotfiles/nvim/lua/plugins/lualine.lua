return {
  "hoob3rt/lualine.nvim",
  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "gruvbox",
        component_separators = { "", "" },
        section_separators = { "", "" },
        disabled_filetypes = { "alpha", "bufexplorer", "Trouble" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          {
            "branch",
            icon = "BRANCH:",
          },
        },
        lualine_c = { { "filetype", icons_enabled = false } },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },
            symbols = { error = "E", warn = "W", info = "I", hint = "H" },
          },
        },
        lualine_y = { { "encoding", left_padding = 2 }, { "fileformat", icons_enabled = false, right_padding = 2 } },
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    })
  end,
}