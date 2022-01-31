local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then
  return
end

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "path" },
  }, {
    { name = "buffer" },
  }),
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
      },
      -- symbol_map = {
      --   Text = "",
      --   Method = "",
      --   Function = "",
      --   Constructor = "",
      --   Field = "ﰠ",
      --   Variable = "v",
      --   Class = "ﴯ",
      --   Interface = "",
      --   Module = "",
      --   Property = "",
      --   Unit = "塞",
      --   Value = "",
      --   Enum = "",
      --   Keyword = "",
      --   Snippet = "",
      --   Color = "",
      --   File = "",
      --   Reference = "",
      --   Folder = "",
      --   EnumMember = "",
      --   Constant = "",
      --   Struct = "פּ",
      --   Event = "",
      --   Operator = "",
      --   TypeParameter = ""
      -- }
    }),
    experimental = {
      native_menu = false,
    },
  },
})
