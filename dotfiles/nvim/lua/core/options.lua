local cmd = vim.cmd
local opt = vim.opt

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.termguicolors = true
opt.signcolumn = "yes"
opt.mouse = "a"
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
opt.shortmess = "acsCFW"
opt.clipboard = "unnamedplus"

opt.lcs = {
  trail = "·",
}

opt.list = true
opt.scrolloff = 8
-- opt.cmdheight = 0
opt.laststatus = 3
opt.foldmethod = "indent"
opt.foldenable = false
opt.foldlevel = 99

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

-- open new split panes to right and below
opt.splitright = true
opt.splitbelow = true

cmd("filetype plugin indent on")

opt.background = "dark"

vim.filetype.add({
  extension = {
    ["http"] = "http",
  },
})
