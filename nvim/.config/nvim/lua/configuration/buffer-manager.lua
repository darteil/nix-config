local status_ok, buffer_manager = pcall(require, "buffer_manager")
if not status_ok then
  return
end

buffer_manager.setup({})
