return {
  "windwp/nvim-ts-autotag",
  ft = { "typescriptreact", "tsx", "html", "javascriptreact", "jsx" },
  config = function()
    require("nvim-ts-autotag").setup({
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = { "typescriptreact", "tsx", "html", "javascriptreact", "jsx" },
      },
    })
  end,
}
