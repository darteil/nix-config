return {
  "mistweaverco/kulala.nvim",
  config = function()
    require("kulala").setup({
      default_view = "body",
      default_env = "dev",
      debug = false,
      icons = {
        inlay = {
          loading = "loading",
          done = "done ",
        },
      },
    })

    vim.api.nvim_create_user_command("KulalaRun", function()
      require("kulala").run()
    end, {})

    vim.api.nvim_create_user_command("KulalaToggle", function()
      require("kulala").toggle_view()
    end, {})
  end,
}
