return {
  "jose-elias-alvarez/buftabline.nvim",
  config = function()
    require("buftabline").setup({
      tab_format = " #{b}#{f} ",
      go_to_maps = false,
      flags = {
        modified = " +",
        not_modifiable = "-",
        readonly = "RO",
      },
      hlgroups = {
        normal = "Folded",
        current = "TermCursor",
        modified_normal = "IncSearch",
        modified_current = "TermCursor",
      },
    })
  end,
}
