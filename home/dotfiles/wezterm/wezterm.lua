local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font("UbuntuMono Nerd Font Mono", {})
config.font_size = 14
config.freetype_load_flags = "NO_HINTING"
config.cell_width = 0.9

config.front_end = "WebGpu"
config.use_dead_keys = false
config.scrollback_lines = 5000
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true
config.term = "wezterm"

config.colors = {
  background = "#282828",
  cursor_bg = "#d5c4a1",
  cursor_border = "#d5c4a1",
  cursor_fg = "#282828",
  foreground = "#d5c4a1",
  selection_bg = "#d5c4a1",
  selection_fg = "#282828",
  indexed = {
    [16] = "#fe8019",
    [17] = "#d65d0e",
    [18] = "#3c3836",
    [19] = "#504945",
    [20] = "#bdae93",
    [21] = "#ebdbb2",
  },
  ansi = {
    "#282828",
    "#cc231c",
    "#989719",
    "#d79920",
    "#448488",
    "#b16185",
    "#689d69",
    "#a89983",
  },
  brights = {
    "#928373",
    "#fb4833",
    "#b8ba25",
    "#fabc2e",
    "#83a597",
    "#d3859a",
    "#8ec07b",
    "#ebdbb2",
  },
}

return config
