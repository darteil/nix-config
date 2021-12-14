local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local eslint_d = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintSource = "eslint_d",
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename ${INPUT}",
  formatStdin = true
}

lspconfig.efm.setup {
  root_dir = util.root_pattern(".git", vim.fn.getcwd()),
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
  end,
  init_options = {
    documentFormatting = true,
    codeAction = true
  },
  flags = {debounce_text_changes = 150},
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  },
  settings = {
    rootMarkers = {"package.json", ".git", ".git/"},
    lintDebounce = 500,
    languages = {
      typescript = {eslint_d},
      javascript = {eslint_d},
      typescriptreact = {eslint_d},
      javascriptreact = {eslint_d}
    }
  }
}
