vim.pack.add({ "https://github.com/hoob3rt/lualine.nvim" })

local lualine = require("lualine")

lualine.setup({
  options = {
    icons_enabled = true,
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
    lualine_x = {},
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
