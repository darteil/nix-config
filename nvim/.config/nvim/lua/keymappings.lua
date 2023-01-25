local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "

map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })

-- Moving text
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

-- Search files
map("n", "<Leader>f", ":Files<CR>", { noremap = true })

-- buffer manager
map("n", "<Tab>", "<CMD>lua require('buffer_manager.ui').toggle_quick_menu()<CR>", { noremap = true })

-- Tree
map("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true })

-- Search in centered
map("n", "n", "nzz", { noremap = true })

-- TroubleToggle
map("n", "<Leader>t", ":TroubleToggle<CR>", { noremap = true })

-- Focus
map("n", "<F5>", ":TZFocus<CR>", { noremap = true })
map("n", "<F6>", ":TZAtaraxis<CR>", { noremap = true })

-- Navigator
map("n", "<c-h>", "<CMD>lua require('Navigator').left()<CR>", { noremap = true })
map("n", "<c-k>", "<CMD>lua require('Navigator').up()<CR>", { noremap = true })
map("n", "<c-l>", "<CMD>lua require('Navigator').right()<CR>", { noremap = true })
map("n", "<c-j>", "<CMD>lua require('Navigator').down()<CR>", { noremap = true })

-- Glance
map("n", "gd", "<CMD>Glance definitions<CR>", { noremap = true })
map("n", "gr", "<CMD>Glance references<CR>", { noremap = true })
map("n", "gy", "<CMD>Glance type_definitions<CR>", { noremap = true })
map("n", "gm", "<CMD>Glance implementations<CR>", { noremap = true })
