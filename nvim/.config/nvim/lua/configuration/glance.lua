local status_ok, glance = pcall(require, "glance")
if not status_ok then
  return
end

local actions = glance.actions

glance.setup({
  border = {
    enable = true,
    top_char = "=",
    bottom_char = "=",
  },
  list = {
    position = "left",
  },
  mappings = {
    list = {
      ["<leader>l"] = actions.enter_win("preview"),
    },
    preview = {
      ["<leader>h"] = actions.enter_win("list"),
    },
  },
})
