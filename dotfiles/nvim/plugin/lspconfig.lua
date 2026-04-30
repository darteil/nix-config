vim.pack.add({
  { src = "https://github.com/b0o/schemastore.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
})

-- Mappings.
local function map(mode, key, result, opts)
  opts = vim.tbl_extend("keep", opts or {}, {
    noremap = true,
    silent = true,
    expr = false,
  })
  vim.keymap.set(mode, key, result, opts)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    local opts = { noremap = true, silent = true }

    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    map("n", "<Leader>d", function()
      vim.diagnostic.config({
        virtual_lines = not vim.diagnostic.config().virtual_lines,
      })
    end, opts)
  end,
})

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
  signs = true,
  underline = false,
  severity_sort = true,
})

vim.lsp.config("eslint", {
  settings = {
    workingDirectories = { mode = "auto" },
    experimental = {
      useFlatConfig = true,
    },
  },
})

local schemastore = require("schemastore")
vim.lsp.config("jsonls", {
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
      validate = { enable = true },
    },
  },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = {
          "vim",
        },
      },
      workspace = {
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("html")
vim.lsp.enable("cssls")
vim.lsp.enable("bashls")
vim.lsp.enable("nixd")
vim.lsp.enable("jsonls")
vim.lsp.enable("eslint")
