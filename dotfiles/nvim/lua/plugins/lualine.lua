return {
  "hoob3rt/lualine.nvim",
  config = function()
    local lualine = require("lualine")

    local kanagawa_colors = {
      black0 = "#181616",
      black1 = "#282727",
      white = "#c5c9c5",
      red = "#c4746e",
      green = "#87a987",
      blue = "#658594",
      yellow = "#ffa066",
      gray = "#727169",
      violet = "#957fb8",
    }

    local kanagawa_theme = {
      normal = {
        a = { bg = kanagawa_colors.green, fg = kanagawa_colors.black0, gui = "bold" },
        b = { bg = kanagawa_colors.gray, fg = kanagawa_colors.black0 },
        c = { bg = kanagawa_colors.black1, fg = kanagawa_colors.white },
      },
      insert = {
        a = { bg = kanagawa_colors.blue, fg = kanagawa_colors.black0, gui = "bold" },
        b = { bg = kanagawa_colors.gray, fg = kanagawa_colors.black0 },
        c = { bg = kanagawa_colors.black1, fg = kanagawa_colors.white },
      },
      visual = {
        a = { bg = kanagawa_colors.yellow, fg = kanagawa_colors.black0, gui = "bold" },
        b = { bg = kanagawa_colors.gray, fg = kanagawa_colors.black0 },
        c = { bg = kanagawa_colors.black1, fg = kanagawa_colors.white },
      },
      replace = {
        a = { bg = kanagawa_colors.violet, fg = kanagawa_colors.black0, gui = "bold" },
        b = { bg = kanagawa_colors.gray, fg = kanagawa_colors.black0 },
        c = { bg = kanagawa_colors.black1, fg = kanagawa_colors.white },
      },
      command = {
        a = { bg = kanagawa_colors.red, fg = kanagawa_colors.black0, gui = "bold" },
        b = { bg = kanagawa_colors.gray, fg = kanagawa_colors.black0 },
        c = { bg = kanagawa_colors.black1, fg = kanagawa_colors.white },
      },
      inactive = {
        a = { bg = kanagawa_colors.gray, fg = kanagawa_colors.black0, gui = "bold" },
        b = { bg = kanagawa_colors.gray, fg = kanagawa_colors.black0 },
        c = { bg = kanagawa_colors.black1, fg = kanagawa_colors.white },
      },
    }

    local function virtual_lines_show_status()
      if vim.diagnostic.config().virtual_lines then
        return "diagnostic"
      else
        return ""
      end
    end

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = kanagawa_theme,
        component_separators = { "", "" },
        section_separators = { "", "" },
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
        lualine_c = { { "filename", icons_enabled = false, path = 1 } },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },
            symbols = { error = "E", warn = "W", info = "I", hint = "H" },
          },
          { virtual_lines_show_status, color = { fg = kanagawa_colors.black0, bg = kanagawa_colors.red } },
          { "progress", color = { fg = kanagawa_colors.black0, bg = kanagawa_colors.green } },
        },
        lualine_y = {},
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
