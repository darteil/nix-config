return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  -- tag = "v1.10.0",
  lazy = false,
  config = function()
    local api = require("nvim-tree.api")

    local function mappings(bufnr)
      local oil = require("oil")
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set("n", "s", api.node.open.vertical, opts("Open: Vertical Split"))
      vim.keymap.set("n", "S", api.node.open.horizontal, opts("Open: Horizontal Split"))
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))

      vim.keymap.set("n", "l", function()
        local node = api.tree.get_node_under_cursor()

        if node.type == "file" then
          api.node.open.edit()
          api.tree.close()
        elseif node.type == "directory" then
          api.node.open.edit()
        end
      end, opts("Open"))

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

    require("nvim-tree").setup({
      on_attach = mappings,
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
      update_focused_file = {
        enable = true,
      },
      modified = {
        enable = true,
      },
      git = {
        enable = true,
        show_on_dirs = false,
      },
      view = {
        signcolumn = "no",
      },
      renderer = {
        icons = {
          show = {
            file = false,
            folder = false,
            folder_arrow = true,
            git = true,
            modified = true,
            hidden = false,
            diagnostics = false,
            bookmarks = false,
          },
          git_placement = "after",
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
            git = {
              unstaged = "[m]",
              staged = "[s]",
              unmerged = "[c]",

              renamed = "[r]",
              untracked = "[ut]",
              deleted = "[d]",
              ignored = "[i]",
            },
          },
        },
      },
    })

    local git_ignored_hl = vim.tbl_extend("force", vim.api.nvim_get_hl(0, { name = "Comment" }), { italic = false })
    vim.api.nvim_set_hl(0, "NvimTreeGitIgnoredIcon", git_ignored_hl)

    vim.keymap.set("n", "<Leader>e", function()
      api.tree.toggle({ current_window = true })
    end, { noremap = true, silent = true })
  end,
}
