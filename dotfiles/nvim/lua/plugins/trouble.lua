return {
  "folke/trouble.nvim",
  config = function()
    local trouble = require("trouble")

    trouble.setup({
      height = 20,
      signs = {
        error = "E",
        warning = "W",
        hint = "H",
        information = "I",
        other = "﫠",
      },
    })

    vim.keymap.set("n", "<Leader>t", "<cmd>TroubleToggle document_diagnostics<CR>", { noremap = true, silent = true })
  end,
}
