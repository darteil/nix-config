local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

opt.termguicolors = true
opt.signcolumn = "yes"
opt.mouse = "n"
opt.encoding = "UTF-8"
opt.relativenumber = true
opt.rnu = true
opt.autoindent = true
opt.number = true
opt.compatible = false
opt.hidden = true
opt.expandtab = true
opt.smarttab = true
opt.wildmenu = true
opt.showmatch = true
opt.undofile = true
opt.undodir = "/tmp"
opt.backup = false
opt.writebackup = false
opt.cmdheight = 1
opt.updatetime = 300
opt.shortmess = "aF"
opt.clipboard = "unnamedplus"
opt.lcs = "trail:·"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

-- open new split panes to right and below
opt.splitright = true
opt.splitbelow = true

cmd("filetype plugin indent on")

opt.background = "dark"
cmd([[colorscheme gruvbox]])

g.gruvbox_contrast_dark = "medium"
g.gruvbox_termcolors = 256
g.gruvbox_invert_selection = "1"
