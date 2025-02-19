return {
  "coffebar/neovim-project",
  opts = {
    projects = {
      "~/nix-config",
      "~/Development/github/*",
      "~/Development/work/*",
      "~/Development/other/*",
    },
    picker = {
      type = "telescope",
    },
    last_session_on_startup = false,
  },
  -- init = function()
  --   vim.opt.sessionoptions:append("globals")
  -- end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
}
