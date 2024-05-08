return {
  "nyngwang/NeoZoom.lua",
  config = function()
    require("neo-zoom").setup({})
    vim.keymap.set("n", "<Leader>z", function()
      vim.cmd("NeoZoomToggle")
    end, { silent = true, nowait = true })
  end,
}
