return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",
  opts = {
    completion = {
      documentation = { auto_show = false },
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
      menu = {
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind" },
          },
        },
      },
    },
    keymap = {
      -- set to 'none' to disable the 'default' preset
      preset = "default",

      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },

      ["<Up>"] = { "snippet_forward", "fallback" },
      ["<Down>"] = { "snippet_backward", "fallback" },

      ["<CR>"] = { "accept", "fallback" },
    },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
}
