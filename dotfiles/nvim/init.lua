require("core")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = {
    version = false,
  },
  install = { colorscheme = { "kanagawa-dragon" } },
  checker = { enabled = false },
  icons = {},
  ui = {
    icons = {
      cmd = "cmd ",

      config = "config ",
      event = "event ",
      ft = "ft ",

      init = "init ",
      import = "import ",

      keys = "keys ",
      lazy = "lazy ",

      loaded = "●",
      not_loaded = "○",
      start = "",

      plugin = "plugin ",
      runtime = "runtime ",
      require = "require ",
      source = "source ",
      task = "task ",
    },
    border = "single",
    backdrop = 100,
  },
  change_detection = {
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
