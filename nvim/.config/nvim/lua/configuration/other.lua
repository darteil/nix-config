local g = vim.g

-- Cursor hold
g.cursorhold_updatetime = 100

-- BufExplorer
g.bufExplorerDisableDefaultKeyMapping = 1
g.bufExplorerShowRelativePath = 1

-- Emmet
g.user_emmet_leader_key = ","

-- =================================================
-- QuickScope
-- =================================================
local function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command("augroup " .. group_name)
    vim.api.nvim_command("autocmd!")
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command("augroup END")
  end
end

nvim_create_augroups({
  qs_colors = {
    { "ColorScheme * highlight QuickScopePrimary guifg='#5fffff' gui=bold ctermfg=155 cterm=bold" },
    { "ColorScheme * highlight QuickScopeSecondary guifg='#d3869b' gui=bold ctermfg=81 cterm=bold" },
  },
})

g.qs_highlight_on_keys = { "f", "F", "t", "T" }