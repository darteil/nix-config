local aerial = require "aerial"

aerial.register_attach_cb(
  function(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>a", "<cmd>AerialToggle!<CR>", {})
  end
)

vim.g.aerial = {
  backends = {"lsp", "treesitter"},
}
