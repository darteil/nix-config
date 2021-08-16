local function getBufLineCount()
  local excludeBuffers = {"startify", "fern"}
  local currentBufIsExclude = false
  local result = ""

  for _, name in ipairs(excludeBuffers) do
    if vim.bo.filetype == name then
      currentBufIsExclude = true
    end
  end

  if not currentBufIsExclude then
    result = tostring(vim.api.nvim_buf_line_count(vim.fn.winbufnr(vim.g.statusline_winid)))
  end

  return result
end

require "lualine".setup {
  options = {
    icons_enabled = true,
    theme = "gruvbox",
    component_separators = {"", ""},
    section_separators = {"", ""},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {
      {
        "branch",
        icon = "BRANCH:"
      }
    },
    lualine_c = {{"filetype", icons_enabled = false}},
    lualine_x = {
      {
        "diagnostics",
        sources = {"nvim_lsp"},
        sections = {"error", "warn", "info", "hint"},
        symbols = {error = "E", warn = "W", info = "I", hint = "H"}
      }
    },
    lualine_y = {{"encoding", left_padding = 2}, {"fileformat", icons_enabled = false, right_padding = 2}},
    lualine_z = {
      {
        getBufLineCount,
        icon = "Lines:"
      }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}