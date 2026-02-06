return {
  "esmuellert/codediff.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = "CodeDiff",
  config = function()
    require("codediff").setup({
      explorer = {
        indent_markers = false,
        view_mode = "list",
        file_filter = {
          ignore = {},
        },
      },
    })
  end,
}
