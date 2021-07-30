local lspconfig = require "lspconfig"

local on_attach = function(client)
  print("'" .. client.name .. "' server attached")
end

lspconfig.jsonls.setup {
  cmd = {"vscode-json-languageserver", "--stdio"},
  filetypes = {"json"},
  root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
  settings = {},
  on_attach = on_attach
}
