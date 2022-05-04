local g = vim.g

g.nvim_tree_special_files = {}

g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 0,
  folder_arrows = 1,
}

g.nvim_tree_icons = {
  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

local list_mappings = {
  { key = { "l", "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
  { key = { "h" }, cb = tree_cb("close_node") },
}

nvim_tree.setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  git = {
    enable = false,
  },
  view = {
    width = 40,
    height = 30,
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = false,
      list = list_mappings,
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
})
