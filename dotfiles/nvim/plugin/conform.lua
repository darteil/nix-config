vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
  formatters_by_ft = {
    javascript = { "oxfmt" },
    typescript = { "oxfmt" },
    javascriptreact = { "oxfmt" },
    typescriptreact = { "oxfmt" },
    css = { "oxfmt" },
    html = { "oxfmt" },
    json = { "oxfmt" },
    markdown = { "oxfmt" },
    lua = { "stylua" },
    nix = { "nixpkgs_fmt" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
})
