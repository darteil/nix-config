-- npm install -g vscode-css-languageserver-bin
local lspconfig = require "lspconfig"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, server)
  if server == "efm" then
    client.resolved_capabilities.document_formatting = true
  else
    client.resolved_capabilities.document_formatting = false
  end

  print("'" .. client.name .. "' server attached")
end

lspconfig.cssls.setup {
  cmd = {"css-languageserver", "--stdio"},
  filetypes = {"css", "scss", "less"},
  root_dir = lspconfig.util.root_pattern("package.json", "git", ".git"),
  capabilities = capabilities,
  settings = {
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    },
    sass = {
      validate = true
    }
  },
  on_attach = on_attach
}
