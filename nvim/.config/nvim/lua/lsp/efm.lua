local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- local prettier = {
--   formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
--   formatStdin = true
-- }

local prettier = {
  formatCommand = 'prettierd "${INPUT}"',
  formatStdin = true,
}

local eslint_d = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintSource = "eslint_d",
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename ${INPUT}",
  formatStdin = true
}

local luaFormat = {
  formatCommand = "npx luafmt --indent-count 2 --stdin",
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
    "typescript",
    "typescriptreact",
    "javascriptreact",
    "lua",
    "css",
    "scss",
    "html",
    "json"
  },
  settings = {
    rootMarkers = {"package.json", ".git", ".git/"},
    lintDebounce = 500,
    languages = {
      typescript = {eslint_d, prettier},
      javascript = {eslint_d, prettier},
      typescriptreact = {eslint_d, prettier},
      javascriptreact = {eslint_d, prettier},
      lua = {luaFormat},
      html = {prettier},
      css = {prettier},
      scss = {eslint_d, prettier},
      json = {prettier}
    }
  }
}
