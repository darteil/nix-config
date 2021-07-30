require("buftabline").setup {
  tab_format = "  [#{b}#{f}]",
  go_to_maps = false,
  flags = {
    modified = "+ ",
    not_modifiable = "- ",
    readonly = "RO "
  }
}
