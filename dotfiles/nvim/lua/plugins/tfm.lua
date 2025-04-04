return {
  "rolv-apneseth/tfm.nvim",
  config = function()
    ---@diagnostic disable: missing-fields
    require("tfm").setup({
      file_manager = "vifm",
      replace_netrw = true,
      enable_cmds = false,
      ui = {
        border = "single",
        height = 0.9,
        width = 0.9,
        x = 0.5,
        y = 0.5,
      },
    })

    vim.api.nvim_create_user_command("Vifm", function()
      require("tfm").open()
    end, {})
  end,
}
