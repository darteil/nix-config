local g = vim.g

g.startify_files_number = 5
g.startify_session_persistence = 1
g.startify_lists = {
  {type = "sessions", header = {"   Saved sessions"}},
  {type = "bookmarks", header = {"   Bookmarks"}},
  {type = "dir", header = {"   Recent files"}}
}

g.startify_custom_header = {
  "   ",
  "                   ┏┓┏   ╻ ╻   ╻   ┏┳┓",
  "                   ┃┃┃   ┃┏┛   ┃   ┃┃┃",
  "                   ┛┗┛   ┗┛    ╹   ╹ ╹",
  "  +-+ +-+ +-+ +-+ +-+ +-+ +-+   +-+ +-+   +-+ +-+ +-+ +-+",
  "  |w| |e| |l| |c| |o| |m| |e|   |t| |o|   |h| |e| |l| |l|",
  "  +-+ +-+ +-+ +-+ +-+ +-+ +-+   +-+ +-+   +-+ +-+ +-+ +-+",
  "   "
}

g.startify_bookmarks = {
  "~/.config/nvim/init.lua",
  "/etc/pulse/default.pa"
}
