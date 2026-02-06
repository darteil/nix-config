return {
  "ibhagwan/fzf-lua",
  opts = {},
  config = function()
    local fzf_lua = require("fzf-lua")
    local map = vim.keymap.set

    fzf_lua.setup({
      fzf_opts = {
        ["--prompt"] = "> ",
        ["--no-bold"] = true,
      },
      file_icons = false,
      git_icons = false,
      winopts = {
        border = "none",
        fullscreen = true,
        preview = {
          horizontal = "right:45%",
          scrollbar = false,
          -- default = "bat",
          border = "single",
        },
      },
      files = {
        cwd_prompt = false,
      },
      diagnostics = {
        winopts = {
          preview = {
            layout = "vertical",
            vertical = "down:35%",
          },
        },
      },
    })

    map("n", "<leader>f", fzf_lua.files, { noremap = true, silent = true })
    map("n", "<leader><leader>", fzf_lua.live_grep, { noremap = true, silent = true })
    map("n", "<leader>h", fzf_lua.helptags, { noremap = true, silent = true })

    map("n", "gd", fzf_lua.lsp_definitions, { noremap = true, silent = true })
    map("n", "gr", fzf_lua.lsp_references, { noremap = true, silent = true })
    map("n", "gp", "<cmd>NeovimProjectDiscover<CR>", { noremap = true, silent = true })

    map("n", "<leader>t", fzf_lua.diagnostics_document, { noremap = true, silent = true })
    map("n", "<leader><Tab>", ":b#<cr>", { noremap = true, silent = true })
  end,
}
