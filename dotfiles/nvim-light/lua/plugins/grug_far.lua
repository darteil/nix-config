return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
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
