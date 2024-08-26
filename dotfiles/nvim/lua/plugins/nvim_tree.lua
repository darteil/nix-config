return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  config = function()
    local function mappings(bufnr)
      local api = require("nvim-tree.api")
      local oil = require("oil")
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set("n", "s", api.node.open.vertical, opts("Open: Vertical Split"))
      vim.keymap.set("n", "S", api.node.open.horizontal, opts("Open: Horizontal Split"))
      vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
      vim.keymap.set("n", "o", function()
        local node = api.tree.get_node_under_cursor()
        local absolute_path = node.absolute_path

        api.tree.close()

        if node.type == "file" then
          local path = absolute_path:match("^(.-)([^\\/]-)%.([^\\/%.]-)%.?$")
          oil.open(path)
        elseif node.type == "directory" then
          oil.open(absolute_path)
        end
      end, opts("Open in oil.nvim"))
    end

    local HEIGHT_RATIO = 0.8
    local WIDTH_RATIO = 0.5

    local function float_config()
      local screen_w = vim.opt.columns:get()
      local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
      local window_w = screen_w * WIDTH_RATIO
      local window_h = screen_h * HEIGHT_RATIO
      local window_w_int = math.floor(window_w)
      local window_h_int = math.floor(window_h)
      local center_x = (screen_w - window_w) / 2
      local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
      return {
        border = "single",
        relative = "editor",
        row = center_y,
        col = center_x,
        width = window_w_int,
        height = window_h_int,
      }
    end

    require("nvim-tree").setup({
      on_attach = mappings,
      update_focused_file = {
        enable = true,
      },
      modified = {
        enable = true,
      },
      git = {
        enable = false,
      },
      view = {
        float = {
          enable = true,
          quit_on_focus_loss = true,
          open_win_config = float_config,
        },
      },
      renderer = {
        icons = {
          show = {
            file = false,
            folder = false,
            folder_arrow = true,
            git = false,
            modified = true,
            hidden = false,
            diagnostics = false,
            bookmarks = false,
          },
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "",
            modified = "[+]",
            hidden = "",
            folder = {
              arrow_closed = "+",
              arrow_open = "-",
              default = "",
              open = "",
              empty = "/",
              empty_open = "+",
              symlink = "",
              symlink_open = "",
            },
          },
        },
      },
    })

    vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
  end,
}
