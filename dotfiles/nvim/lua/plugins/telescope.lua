return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local map = vim.keymap.set

    telescope.setup({
      defaults = {
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        prompt_prefix = " ",
        selection_caret = "> ",
        layout_strategy = "flex",
        layout_config = {
          horizontal = {
            width = 0.9,
            height = 0.9,
          },
        },
      },
      pickers = {
        find_files = {
          disable_devicons = true,
        },
        live_grep = {
          disable_devicons = true,
        },
        diagnostics = {
          disable_devicons = true,
          layout_strategy = "vertical",
        },
        lsp_definitions = {
          disable_devicons = true,
        },
        lsp_references = {
          disable_devicons = true,
          show_line = false,
        },
      },
    })

    map("n", "<leader>f", builtin.find_files, {})
    map("n", "<leader><leader>", builtin.live_grep, {})
    map("n", "<leader>h", builtin.help_tags, {})

    map("n", "gd", builtin.lsp_definitions, { noremap = true, silent = true })
    map("n", "gr", builtin.lsp_references, { noremap = true, silent = true })

    map("n", "<leader>t", builtin.diagnostics, {})
  end,
}
