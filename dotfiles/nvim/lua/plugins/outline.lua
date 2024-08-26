return {
  "hedyhli/outline.nvim",
  config = function()
    require("outline").setup({
      outline_items = {
        auto_set_cursor = false,
      },
      symbol_folding = {
        markers = { "+", "-" },
      },
      symbols = {
        icons = {
          File = { icon = "File", hl = "Identifier" },
          Module = { icon = "Module", hl = "Include" },

          Namespace = { icon = "Namespace", hl = "Include" },
          Package = { icon = "Package", hl = "Include" },

          Class = { icon = "Class", hl = "Type" },
          Method = { icon = "Method", hl = "Function" },

          Property = { icon = "Property", hl = "Identifier" },
          Field = { icon = "Field", hl = "Identifier" },
          Constructor = { icon = "Constructor", hl = "Special" },
          Enum = { icon = "Enum", hl = "Type" },
          Interface = { icon = "Interface", hl = "Type" },
          Function = { icon = "Function", hl = "Function" },
          Variable = { icon = "Variable", hl = "Constant" },
          Constant = { icon = "Constant", hl = "Constant" },
          String = { icon = "String", hl = "String" },

          Number = { icon = "Number", hl = "Number" },
          Boolean = { icon = "Boolean", hl = "Boolean" },
          Array = { icon = "Array", hl = "Constant" },
          Object = { icon = "Object", hl = "Type" },
          Key = { icon = "Key", hl = "Type" },
          Null = { icon = "NULL", hl = "Type" },
          EnumMember = { icon = "EnumMember", hl = "Identifier" },
          Struct = { icon = "Struct", hl = "Structure" },

          Event = { icon = "Event", hl = "Type" },
          Operator = { icon = "Operator", hl = "Identifier" },
          TypeParameter = { icon = "TypeParameter", hl = "Identifier" },
          Component = { icon = "Component", hl = "Function" },

          Fragment = { icon = "Fragment", hl = "Constant" },
          TypeAlias = { icon = "TypeAlias ", hl = "Type" },

          Parameter = { icon = "Parameter ", hl = "Identifier" },
          StaticMethod = { icon = "StaticMethod ", hl = "Function" },
          Macro = { icon = "Macro ", hl = "Function" },
        },
      },
    })
    vim.keymap.set("n", "<Leader>o", ":Outline<CR>", { noremap = true, silent = true, desc = "Toggle Outline" })
  end,
}
