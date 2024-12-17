return {
  "nyngwang/NeoZoom.lua",
  config = function()
    require("neo-zoom").setup({
      exclude_buftypes = { "nofile" },
      winopts = {
        offset = {
          top = "center",
          left = "center",
        },
        border = "single",
      },
    })
    vim.keymap.set("n", "<Leader>z", function()
      vim.cmd("NeoZoomToggle")
    end, { silent = true, nowait = true })
  end,
}
