return {
  "sindrets/diffview.nvim",
  config = function()
    local actions = require("diffview.actions")

    require("diffview").setup({
      use_icons = false,
      icons = {
        folder_closed = "+ ",
        folder_open = "- ",
      },
      signs = {
        fold_closed = "+",
        fold_open = "-",
        done = "✓",
      },
      keymaps = {
        view = {
          { "n", "<leader>b", actions.focus_files, { desc = "Bring focus to the file panel" } },
          { "n", "<leader>e", actions.toggle_files, { desc = "Toggle the file panel." } },
        },
      },
    })
  end,
}
