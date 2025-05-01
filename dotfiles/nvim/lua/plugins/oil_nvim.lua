return {
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup({
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
      confirmation = {
        border = "single",
      },
      preview = {
        border = "single",
      },
      progress = {
        border = "single",
      },
      ssh = {
        border = "single",
      },
      keymaps_help = {
        border = "single",
      },
      keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
      },
    })

    vim.keymap.set("n", "-", ":Oil<CR>", { noremap = true, silent = true })
  end,
}
