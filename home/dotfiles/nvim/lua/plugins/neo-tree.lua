return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  branch = "v3.x",
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, position = "float" })
      end,
      desc = "Explorer NeoTree",
    },
  },
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
  end,
  config = function()
    local neo_tree = require("neo-tree")

    neo_tree.setup({
      -- popup_border_style = "rounded",
      open_files_do_not_replace_types = { "Trouble", "bufexplorer" },
      source_selector = {
        winbar = false,
        statusline = true,
        sources = {
          { source = "filesystem" },
          { source = "git_status" },
        },
      },
      enable_diagnostics = false,
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      default_component_configs = {
        indent = {
          with_markers = false,
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_empty = "󰜌",
          folder_empty_open = "󰜌",
          default = "",
        },
        modified = {
          symbol = "+",
          highlight = "GruvboxGreen",
        },
        git_status = {
          symbols = {
            -- Change type
            added = "a",
            deleted = "d",
            modified = "m",
            renamed = "r",
            -- Status type
            untracked = "ut",
            ignored = "i",
            unstaged = "us",
            staged = "s",
            conflict = "c",
          },
        },
        file_size = {
          enabled = true,
          required_width = 110,
        },
        type = {
          enabled = false,
        },
        last_modified = {
          enabled = false,
        },
        created = {
          enabled = false,
        },
      },
      window = {
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
        },
      },
    })

    vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { link = "GruvboxGreen" })
    vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { link = "GruvboxRed" })
    vim.api.nvim_set_hl(0, "NeoTreeGitModified", { link = "GruvboxOrange" })
    vim.api.nvim_set_hl(0, "NeoTreeGitRenamed", { link = "GruvboxAqua" })
    vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { link = "GruvboxOrange" })
    vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { link = "GruvboxGray" })
    vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", { link = "GruvboxBlue" })
    vim.api.nvim_set_hl(0, "NeoTreeGitStaged", { link = "GruvboxYellow" })
    vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { link = "GruvboxRed" })
    vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { link = "GruvboxOrangeSign" })
    vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { bg = "#83A598", fg = "#282828" })

    -- vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { link = "NeoTreeFloatNormal" })
  end,
}
