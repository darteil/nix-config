local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "

map("n", "<C-h>", "<C-w>h", {silent = true})
map("n", "<C-j>", "<C-w>j", {silent = true})
map("n", "<C-k>", "<C-w>k", {silent = true})
map("n", "<C-l>", "<C-w>l", {silent = true})

-- Search files
map("n", "<Leader>f", ":Files<CR>", {noremap = true})

-- Buffers list
map("n", "<Leader><Tab>", ":b ", {noremap = true})

-- Fern
map("n", "<Leader>e", ":Fern . -reveal=%<CR>", {noremap = true})

-- Startify
map("n", "<Leader>st", ":Startify<CR>", {noremap = true})
