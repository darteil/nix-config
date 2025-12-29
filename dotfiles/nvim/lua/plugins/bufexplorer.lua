return {
  "jlanzarotta/bufexplorer",
  config = function()
    local g = vim.g

    g.bufExplorerDisableDefaultKeyMapping = 1
    g.bufExplorerShowRelativePath = 1
    g.bufExplorerDefaultHelp = 1

    vim.keymap.set("n", "<Tab>", ":BufExplorer<CR>", { noremap = true, silent = true })
  end,
}
