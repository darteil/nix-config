return {
  "dnlhc/glance.nvim",
  config = function()
    local glance = require("glance")
    local actions = glance.actions

    glance.setup({
      border = {
        enable = true,
        top_char = "=",
        bottom_char = "=",
      },
      list = {
        position = "left",
      },
      mappings = {
        list = {
          ["<leader>l"] = actions.enter_win("preview"),
        },
        preview = {
          ["<leader>h"] = actions.enter_win("list"),
        },
      },
    })

    vim.keymap.set("n", "gd", "<CMD>Glance definitions<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "gr", "<CMD>Glance references<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "gy", "<CMD>Glance type_definitions<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "gm", "<CMD>Glance implementations<CR>", { noremap = true, silent = true })

    vim.api.nvim_set_hl(0, "GlanceWinBarTitle", { link = "PmenuSel" })
    vim.api.nvim_set_hl(0, "GlanceWinBarFilepath", { link = "PmenuSel" })
    vim.api.nvim_set_hl(0, "GlanceWinBarFilename", { link = "PmenuSel" })
    vim.api.nvim_set_hl(0, "GlancePreviewMatch", { link = "Search" })
  end,
}
