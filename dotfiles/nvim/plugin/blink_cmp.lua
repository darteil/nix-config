vim.pack.add({
  { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("*") },
})

require("blink.cmp").setup({
  completion = {
    documentation = {
      auto_show = false,
    },
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
    list = {
      selection = {
        preselect = true,
        auto_insert = true,
      },
    },
    menu = {
      max_height = 15,
      scrollbar = false,
      draw = {
        columns = {
          { "label", "label_description", gap = 1 },
          { "kind" },
        },
      },
    },
  },
  keymap = {
    preset = "default",

    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },

    ["<Up>"] = { "snippet_forward", "fallback" },
    ["<Down>"] = { "snippet_backward", "fallback" },

    ["<CR>"] = { "accept", "fallback" },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
})
