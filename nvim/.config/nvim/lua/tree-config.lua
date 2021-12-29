local g = vim.g
local tree_cb = require("nvim-tree.config").nvim_tree_callback

local list = {
  { key = { "l", "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
  { key = { "h" }, cb = tree_cb("close_node") },
}

g.nvim_tree_special_files = {}
g.nvim_tree_window_picker_exclude = { filetype = {}, buftype = {} }

g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 0,
  folder_arrows = 1,
}

g.nvim_tree_icons = {
  default = "",
  symlink = "",
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

require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  auto_close = false,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  git = {
    enable = false,
  },
  view = {
    width = 40,
    height = 30,
    hide_root_folder = false,
    side = "left",
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = list,
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
