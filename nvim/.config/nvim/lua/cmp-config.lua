local cmp = require "cmp"
local lspkind = require "lspkind"

cmp.setup(
  {
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
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
      ["<CR>"] = cmp.mapping.confirm({select = true})
    },
    sources = cmp.config.sources(
      {
        {name = "nvim_lsp"},
        {name = "path"}
      },
      {
        {name = "buffer"}
      }
    ),
    formatting = {
      format = lspkind.cmp_format(
        {
          with_text = true,
          menu = {
            buffer = "[buf]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[api]",
            path = "[path]"
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
        }
      ),
      experimental = {
        native_menu = false
      }
    }
  }
)
