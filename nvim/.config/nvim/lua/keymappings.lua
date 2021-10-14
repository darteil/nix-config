local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "

map("n", "<C-h>", "<C-w>h", {silent = true})
map("n", "<C-j>", "<C-w>j", {silent = true})
map("n", "<C-k>", "<C-w>k", {silent = true})
map("n", "<C-l>", "<C-w>l", {silent = true})

-- Moving text
map("v", "J", ":m '>+1<CR>gv=gv", {noremap = true})
map("v", "K", ":m '<-2<CR>gv=gv", {noremap = true})

-- Search files
map("n", "<Leader>f", ":Files<CR>", {noremap = true})

-- BufExplorer
map("n", "<Tab>", ":BufExplorer<CR>", {noremap = true})

-- Fern
map("n", "<Leader>e", ":Fern . -reveal=%<CR>", {noremap = true})

-- Startify
map("n", "<Leader>st", ":Startify<CR>", {noremap = true})

-- Search in centered
map("n", "n", "nzz", {noremap = true})

-- TroubleToggle
map("n", "<Leader>t", ":TroubleToggle<CR>", {noremap = true})

-- Show diagnostics in popup
map("n", "<Leader>d", ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {noremap = true})

-- dap
-- map('n', '<leader><leader>d', ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>', {noremap = true})
-- map('n', '<leader><leader>di', ':lua require"dap.ui.widgets".hover()<CR>', {noremap = true})
map('n', '<leader><leader>db', ':lua require"dap".toggle_breakpoint()<CR>', {noremap = true})