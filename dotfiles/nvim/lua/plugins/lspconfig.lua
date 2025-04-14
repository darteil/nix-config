return {
  "neovim/nvim-lspconfig",
  after = { "nvim-cmp" },
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  dependencies = {
    "b0o/schemastore.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local schemastore = require("schemastore")

    -- Mappings.
    local function map(mode, key, result, opts)
      opts = vim.tbl_extend("keep", opts or {}, {
        noremap = true,
        silent = true,
        expr = false,
      })
      vim.keymap.set(mode, key, result, opts)
    end

    local on_attach = function(client)
      local opts = { noremap = true, silent = true }

      map("n", "K", vim.lsp.buf.hover, opts)
      map("n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      map("n", "<Leader>d", function()
        vim.diagnostic.config({
          virtual_lines = not vim.diagnostic.config().virtual_lines,
        })
      end, opts)

      -- Disable Autoformat
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()
    local servers = { "ts_ls", "html", "cssls", "bashls", "gopls" }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        },
      })
    end

    lspconfig.jsonls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      },
      settings = {
        json = {
          schemas = schemastore.json.schemas(),
          validate = { enable = true },
        },
      },
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      },
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })

    lspconfig.eslint.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      },
      settings = {
        workingDirectories = { mode = "auto" },
        experimental = {
          useFlatConfig = true,
        },
      },
    })

    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = false,
      signs = true,
      underline = false,
      severity_sort = true,
    })

    local hover = vim.lsp.buf.hover
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.lsp.buf.hover = function()
      return hover({
        border = "single",
        max_width = math.floor(vim.o.columns * 0.7),
        max_height = math.floor(vim.o.lines * 0.7),
      })
    end
  end,
}
