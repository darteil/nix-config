return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
      },
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          -- Donwload from microsoft/vscode-js-debug
          args = { vim.fn.expand("$HOME/.debuggers/js-debug/src/dapDebugServer.js"), "${port}" },
        },
      }

      for _, language in ipairs({ "typescript", "javascript" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
          {
            name = "<--- ↓ launch.json configs ↓ --->",
            type = "",
            request = "launch",
          },
        }
      end

      ---@diagnostic disable: missing-fields
      dapui.setup({
        layouts = {
          {
            elements = {
              {
                id = "scopes",
              },
            },
            position = "left",
            size = 90,
          },
          {
            elements = {
              {
                id = "repl",
              },
            },
            position = "bottom",
            size = 10,
          },
        },
        icons = { expanded = "-", collapsed = "+", current_frame = "→" },
        controls = {
          icons = {
            pause = "pause",
            play = "play",
            step_into = "into",
            step_over = "over",

            step_out = "out",
            step_back = "back",
            run_last = "last",
            terminate = "terminate",
            disconnect = "disconnect",
          },
        },
      })

      vim.keymap.set("n", "<F9>", function()
        require("dapui").open()
      end)
      vim.keymap.set("n", "<F10>", function()
        dap.toggle_breakpoint()
      end)
      vim.keymap.set("n", "<F11>", function()
        require("dap").continue()
      end)
      vim.keymap.set("n", "<F12>", function()
        require("dap").clear_breakpoints()
        require("dap").terminate()
        require("dapui").close()
      end)
    end,
  },
}
