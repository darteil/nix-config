return {
  "neovim/nvim-lspconfig",
  after = { "blink.cmp" },
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  dependencies = {
    "b0o/schemastore.nvim",
  },
  config = function()
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

    local capabilities = require("blink.cmp").get_lsp_capabilities()
    local servers = { "ts_ls", "html", "cssls", "bashls", "gopls", "nixd" }

    for _, lsp in ipairs(servers) do
      vim.lsp.config(lsp, {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        },
      })
    end

    vim.lsp.config("jsonls", {
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

    vim.lsp.config("lua_ls", {
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
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            ignoreDir = { ".git" },
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              vim.api.nvim_get_runtime_file("lua", true),
            },
          },
        },
      },
    })

    vim.lsp.config("eslint", {
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

    vim.lsp.enable("ts_ls")
    vim.lsp.enable("html")
    vim.lsp.enable("cssls")
    vim.lsp.enable("bashls")
    vim.lsp.enable("jsonls")
    vim.lsp.enable("eslint")
    vim.lsp.enable("nixd")
    -- vim.lsp.enable("lua_ls")
    -- vim.lsp.enable("gopls")

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
        max_width = math.floor(vim.o.columns * 0.5),
        max_height = math.floor(vim.o.lines * 0.4),
      })
    end
  end,
}
