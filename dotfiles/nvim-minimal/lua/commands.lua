-- show all active lsp clients
local function show_lsp_clients()
  local names = {}
  for _, client in ipairs(vim.lsp.get_clients()) do
    table.insert(names, vim.trim(client.name))
  end
  if next(names) == nil then
    return "There are no active lsp servers"
  else
    return table.concat(names, " | ")
  end
end

vim.api.nvim_create_user_command("LspActiveClients", function()
  print(show_lsp_clients())
end, {})
