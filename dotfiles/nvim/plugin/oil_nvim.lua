vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup({
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true,
  },
  float = {
    padding = 2,
    max_width = 0.4,
    max_height = 0.5,
  },
  keymaps = {
    ["<C-h>"] = false,
    ["<C-l>"] = false,
  },
})

vim.keymap.set("n", "-", ":Oil<CR>", { noremap = true, silent = true })
