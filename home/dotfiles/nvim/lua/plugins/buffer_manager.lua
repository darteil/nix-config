return {
  "j-morano/buffer_manager.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("buffer_manager").setup({
      select_menu_item_commands = {
        v = {
          key = "<C-l>",
          command = "vsplit",
        },
        h = {
          key = "<C-j>",
          command = "split",
        },
      },
      borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    })
    vim.keymap.set(
      "n",
      "<Tab>",
      "<CMD>lua require('buffer_manager.ui').toggle_quick_menu()<CR>",
      { noremap = true, silent = true }
    )
  end,
}
