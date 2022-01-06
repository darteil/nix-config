local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
  return
end

trouble.setup({
  height = 20,
  signs = {
    error = "E",
    warning = "W",
    hint = "H",
    information = "I",
    other = "﫠",
  },
})
