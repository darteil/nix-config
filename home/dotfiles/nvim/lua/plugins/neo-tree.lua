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
        require("neo-tree.command").execute({ toggle = true, position = "left" })
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
      popup_border_style = "single",
      open_files_do_not_replace_types = { "Trouble", "bufexplorer" },
      source_selector = {
        winbar = true,
        statusline = false,
        sources = {
          { source = "filesystem" },
        },
      },
      event_handlers = {
        {
          event = "neo_tree_popup_input_ready",
          handler = function(input)
            vim.cmd("stopinsert")
          end,
        },
      },
      enable_diagnostics = false,
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        components = {
          icon = function(config, node, state)
            if node.type == "file" then
              return {
                text = " ",
              }
            end
            return require("neo-tree.sources.common.components").icon(config, node, state)
          end,
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
          required_width = 64,
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
  end,
}
