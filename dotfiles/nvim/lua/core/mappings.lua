local map = vim.keymap.set
local map_arg = { silent = true, noremap = true }

vim.g.mapleader = " "
vim.g.maplocalleader = ","

map("n", "<C-h>", "<C-w>h", map_arg)
map("n", "<C-j>", "<C-w>j", map_arg)
map("n", "<C-k>", "<C-w>k", map_arg)
map("n", "<C-l>", "<C-w>l", map_arg)

-- Moving text
map("v", "J", ":m '>+1<CR>gv=gv", map_arg)
map("v", "K", ":m '<-2<CR>gv=gv", map_arg)

-- Search in centered
map("n", "n", "nzz", map_arg)
map("n", "N", "Nzz", map_arg)

-- Scrolling in centered
map("n", "<C-d>", "<C-d>zz", map_arg)
map("n", "<C-u>", "<C-u>zz", map_arg)

-- Yank into system clipboard
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>yy", '"+yy')

-- Paste from system clipboard
map("n", "<leader>p", '"+p')
