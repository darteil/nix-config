local protocol = require "vim.lsp.protocol"
vim.o.completeopt = "menuone,noselect"

require "compe".setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "always",
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    path = true,
    nvim_lsp = true
  }
}

-- nvim-autopairs plugin
require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
  auto_select = false,  -- auto select first item
})

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn["compe#complete"]()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

protocol.CompletionItemKind = {
  " [text]",
  " [method]",
  " [function]",
  " [constructor]",
  " [field]",
  " [variable]",
  " [class]",
  " [interface]",
  " [module]",
  " [property]",
  " [unit]",
  " [value]",
  " [enum]",
  " [key]",
  "﬌ [snippet]",
  " [color]",
  " [file]",
  " [reference]",
  " [folder]",
  " [enum member]",
  " [constant]",
  " [struct]",
  "⌘ [event]",
  " [operator]",
  "⌂ [type]"
}
