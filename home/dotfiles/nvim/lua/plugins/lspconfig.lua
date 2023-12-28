return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "b0o/schemastore.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local schemastore = require("schemastore")

    require("lspconfig.ui.windows").default_options.border = "single"
    vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "GruvboxFg1" })

    -- Mappings.
    local function map(mode, key, result, opts)
      opts = vim.tbl_extend("keep", opts or {}, {
        noremap = true,
        silent = true,
        expr = false,
      })
      vim.api.nvim_set_keymap(mode, key, result, opts)
    end

    local on_attach = function(client)
      local opts = { noremap = true, silent = true }

      map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
      map("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      map("n", "<Leader>d", "<cmd>lua vim.diagnostic.open_float(0, {scope='line'})<CR>", opts)

      -- Disable Autoformat
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local servers = { "tsserver", "html", "cssls", "bashls", "gopls" }

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
      diagnostics = {
        globals = { "vim" },
      },
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "single",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "single",
    })

    vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      update_in_insert = true,
      underline = false,
      severity_sort = true,
      float = {
        border = "single",
      },
    })
  end,
}
