local status_ok, ft = pcall(require, "filetype")
if not status_ok then
  return
end

ft.setup({
  overrides = {
    literal = {
      sxhkdrc = "sxhkd",
    },
  },
})
