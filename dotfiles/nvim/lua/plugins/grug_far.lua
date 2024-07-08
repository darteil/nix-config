return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({
      icons = {
        enabled = false,
      },
      spinnerStates = false,
      resultsSeparatorLineChar = "=",
    })
  end,
}
