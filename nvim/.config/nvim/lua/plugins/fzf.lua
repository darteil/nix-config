return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf_lua = require("fzf-lua")

    fzf_lua.setup({
      "default",
      winopts = {
        fullscreen = true,
        border = "single",
      },
    })

    vim.keymap.set("n", "<Leader>f", ":FzfLua files<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<Leader>r", ":FzfLua live_grep_native<CR>", { noremap = true, silent = true })
  end,
}
