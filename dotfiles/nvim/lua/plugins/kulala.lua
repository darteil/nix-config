return {
  "mistweaverco/kulala.nvim",
  ft = { "http" },
  opts = {},
  config = function()
    require("kulala").setup({
      default_env = "dev",
      debug = false,
      ui = {
        icons = {
          inlay = {
            loading = "⏳",
            done = "✅",
            error = "❌",
          },
        },
        default_view = "body",
        winbar = true,
      },
    })

    vim.api.nvim_create_user_command("KulalaRun", function()
      require("kulala").run()
    end, {})
  end,
}
