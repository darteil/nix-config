return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
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
        buffers = {
          path_display = function(opts, path)
            local tail = require("telescope.utils").path_tail(path)
            return string.format("%s --> %s", tail, path)
          end,
          disable_devicons = true,
          sorting_strategy = "ascending",
          layout_strategy = "vertical",
          previewer = false,
          layout_config = { width = 0.7, height = 0.6 },
          sort_mru = true,
          ignore_current_buffer = true,
          sort_lastused = true,
          initial_mode = "normal",
          mappings = {
            n = {
              ["d"] = "delete_buffer",
            },
          },
        },
        find_files = {
          disable_devicons = true,
        },
        live_grep = {
          disable_devicons = true,
        },
        diagnostics = {
          disable_devicons = true,
          layout_strategy = "vertical",
          initial_mode = "normal",
        },
        lsp_definitions = {
          disable_devicons = true,
        },
        lsp_references = {
          disable_devicons = true,
          initial_mode = "normal",
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
    map("n", "<Tab>", builtin.buffers, { noremap = true, silent = true })
  end,
}
