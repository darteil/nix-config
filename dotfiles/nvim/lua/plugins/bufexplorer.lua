return {
  "jlanzarotta/bufexplorer",
  config = function()
    local g = vim.g

    g.bufExplorerDisableDefaultKeyMapping = 1
    g.bufExplorerShowRelativePath = 1
    g.bufExplorerDefaultHelp = 1

    vim.keymap.set("n", "<Tab>", ":BufExplorer<CR>", { noremap = true, silent = true })

    local grp = vim.api.nvim_create_augroup("UserPrefix_BufExplorerGroup", { clear = true })
    vim.api.nvim_create_autocmd("User", {
      group = grp,
      pattern = "BufExplorer_Started",
      callback = function()
        vim.keymap.set(
          "n",
          "s",
          "<Plug>(BufExplorer_OpenBufferSplitRight)",
          { noremap = true, silent = true, buffer = true }
        )
        vim.keymap.set(
          "n",
          "S",
          "<Plug>(BufExplorer_OpenBufferSplitBelow)",
          { noremap = true, silent = true, buffer = true }
        )
      end,
    })
  end,
}
