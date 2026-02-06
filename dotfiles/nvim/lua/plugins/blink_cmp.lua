return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",
  opts = {
    completion = {
      documentation = {
        window = {
          border = "single",
        },
        auto_show = false,
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
      menu = {
        max_height = 15,
        border = "single",
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
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
}
