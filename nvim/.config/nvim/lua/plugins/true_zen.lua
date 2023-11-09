return {
  "Pocco81/TrueZen.nvim",
  config = function()
    require("true-zen").setup({
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

    vim.keymap.set("n", "<F5>", ":TZFocus<CR>", { noremap = true })
  end,
}
