local status_ok, tz = pcall(require, "true-zen")
if not status_ok then
  return
end

tz.setup({
  ui = {
    bottom = {
      laststatus = 0,
      ruler = false,
      showmode = false,
      showcmd = false,
      cmdheight = 1,
    },
    top = {
      showtabline = 0,
    },
    left = {
      number = false,
      relativenumber = true,
      signcolumn = "no",
    },
  },
  modes = {
    ataraxis = {
      padding = {
        left = 52,
        right = 52,
        top = 0,
        bottom = 0,
      },
      ideal_writing_area_width = { 0 },
      auto_padding = false,
      keep_default_fold_fillchars = true,
      custom_bg = { "none", "" },
      bg_configuration = true,
      quit = "untoggle",
      ignore_floating_windows = true,
      minimum_writing_area = {
        width = 120,
      },
      affected_higroups = {
        NonText = true,
        FoldColumn = true,
        ColorColumn = true,
        VertSplit = true,
        StatusLine = true,
        StatusLineNC = true,
        SignColumn = true,
      },
    },
    focus = {
      margin_of_error = 5,
      focus_method = "experimental",
    },
  },
  integrations = {
    vim_gitgutter = false,
    galaxyline = false,
    tmux = true,
    gitsigns = false,
    nvim_bufferline = false,
    limelight = false,
    twilight = false,
    vim_airline = false,
    vim_powerline = false,
    vim_signify = false,
    express_line = false,
    lualine = true,
    lightline = false,
    feline = false,
  },
  misc = {
    on_off_commands = false,
    ui_elements_commands = false,
    cursor_by_mode = false,
  },
})
