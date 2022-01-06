local status_ok, buftabline = pcall(require, "buftabline")
if not status_ok then
  return
end

buftabline.setup({
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
