local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  "   ",
  "                   ┏┓┏   ╻ ╻   ╻   ┏┳┓",
  "                   ┃┃┃   ┃┏┛   ┃   ┃┃┃",
  "                   ┛┗┛   ┗┛    ╹   ╹ ╹",
  "  +-+ +-+ +-+ +-+ +-+ +-+ +-+   +-+ +-+   +-+ +-+ +-+ +-+",
  "  |w| |e| |l| |c| |o| |m| |e|   |t| |o|   |h| |e| |l| |l|",
  "  +-+ +-+ +-+ +-+ +-+ +-+ +-+   +-+ +-+   +-+ +-+ +-+ +-+",
  "   ",
}

dashboard.section.buttons.val = {
  dashboard.button("n", " New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("c", " Configuration", ":e $MYVIMRC | :cd ~/.config/nvim/ | :NvimTreeToggle<CR>"),
  dashboard.button("q", " Exit", ":qa<CR>"),
}

local function footer()
  local nvim_version = vim.version()
  return "NVIM version " .. nvim_version.major .. "." .. nvim_version.minor .. "." .. nvim_version.patch
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
