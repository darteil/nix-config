return {
  "numToStr/Navigator.nvim",
  config = function()
    local navigator = require("Navigator")
    navigator.setup({
      disable_on_zoom = true,
    })

    vim.keymap.set("n", "<c-h>", "<CMD>lua require('Navigator').left()<CR>", { noremap = true })
    vim.keymap.set("n", "<c-k>", "<CMD>lua require('Navigator').up()<CR>", { noremap = true })
    vim.keymap.set("n", "<c-l>", "<CMD>lua require('Navigator').right()<CR>", { noremap = true })
    vim.keymap.set("n", "<c-j>", "<CMD>lua require('Navigator').down()<CR>", { noremap = true })
  end,
}
