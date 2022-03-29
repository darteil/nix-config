local status_ok, navigator = pcall(require, "Navigator")
if not status_ok then
  return
end

navigator.setup({ disable_on_zoom = true })
