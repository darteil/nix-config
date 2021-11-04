require("lsp.ts")
require("lsp.css")
require("lsp.html")
require("lsp.lua")
require("lsp.json")
require("lsp.efm")

-- Mappings.
local function map(mode, key, result, opts)
  opts =
    vim.tbl_extend(
    "keep",
    opts or {},
    {
      noremap = true,
      silent = true,
      expr = false
    }
  )
  vim.api.nvim_set_keymap(mode, key, result, opts)
end

local opts = {noremap = true, silent = true}

map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map("n", "<space>m", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = false
  }
)

-- Handle formatting in a smarter way
-- If the buffer has been edited before formatting has completed, do not try to
-- apply the changes, by Lukas Reineke
vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
  if err ~= nil or result == nil then
    return
  end

  -- If the buffer hasn't been modified before the formatting has finished,
  -- update the buffer
  if not vim.api.nvim_buf_get_option(bufnr, "modified") then
    local view = vim.fn.winsaveview()
    vim.lsp.util.apply_text_edits(result, bufnr)
    vim.fn.winrestview(view)
    if bufnr == vim.api.nvim_get_current_buf() then
      vim.cmd "noautocmd :update"

      -- Trigger post-formatting autocommand which can be used to refresh gitsigns
      vim.cmd "silent doautocmd <nomodeline> User FormatterPost"
    end
  end
end
