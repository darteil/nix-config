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
  hijack_cursor = true,
  update_cwd = true,
  reload_on_bufenter = true,
  git = {
    enable = true,
  },
  renderer = {
    highlight_opened_files = "all",
    group_empty = true,
    icons = {
      git_placement = "before",
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
      glyphs = {
        git = {
          unstaged = "m",
          staged = "s",
          unmerged = "um",
          renamed = "r",
          untracked = "ut",
          deleted = "d",
          ignored = "i",
        },
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
      },
    },
  },
  view = {
    hide_root_folder = false,
    width = 40,
    adaptive_size = true,
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
