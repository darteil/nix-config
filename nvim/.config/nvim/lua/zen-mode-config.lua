require("zen-mode").setup({
  window = {
    width = 120,
    height = 1,
    options = {
      signcolumn = "no", -- disable signcolumn
      number = false, -- disable number column
      relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false,
      showcmd = false,
    },
    gitsigns = { enabled = true },
    tmux = { enabled = true },
    kitty = {
      enabled = false,
      font = "12",
    },
  },
})
