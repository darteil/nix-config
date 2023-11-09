return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "onsails/lspkind-nvim",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-signature-help",
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    vim.opt.completeopt = "menu,menuone,noselect"
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    cmp.setup({
      window = {
        completion = cmp.config.window.bordered({ scrollbar = false, border = "single" }),
        documentation = cmp.config.window.bordered({ border = "single" }),
      },
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
        { name = "nvim_lua" },
        { name = "vsnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "nvim_lsp_signature_help" },
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
  end,
}
