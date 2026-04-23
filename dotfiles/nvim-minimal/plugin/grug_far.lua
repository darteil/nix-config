vim.pack.add({ "https://github.com/MagicDuck/grug-far.nvim" })

require("grug-far").setup({
  icons = {
    enabled = false,
  },
  spinnerStates = false,
  resultsSeparatorLineChar = "=",
})
