---@diagnostic disable: unused-local
require("events")

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
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.tab_max_width = 18

config.window_padding = {
  left = "0.9cell",
  right = "0.9cell",
  top = "0.5cell",
  bottom = 0,
}

config.colors = {
  background = "#282828",
  cursor_bg = "#d5c4a1",
  cursor_border = "#d5c4a1",
  cursor_fg = "#282828",
  foreground = "#d5c4a1",
  selection_bg = "#d5c4a1",
  selection_fg = "#282828",
  tab_bar = {
    background = "#282828",
  },
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

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  {
    mods = "LEADER",
    key = "-",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    mods = "LEADER",
    key = [[\]],
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    mods = "SHIFT",
    key = "RightArrow",
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    mods = "SHIFT",
    key = "LeftArrow",
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    mods = "LEADER",
    key = "z",
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    mods = "LEADER",
    key = "s",
    action = wezterm.action.PaneSelect({
      mode = "SwapWithActive",
    }),
  },
  {
    mods = "LEADER",
    key = "c",
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },
  {
    mods = "CTRL",
    key = "j",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    mods = "CTRL",
    key = "k",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    mods = "CTRL",
    key = "l",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  {
    mods = "CTRL",
    key = "h",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    mods = "LEADER",
    key = "t",
    action = wezterm.action.ShowTabNavigator,
  },
  -- {
  --   key = "R",
  --   mods = "LEADER",
  --   action = wezterm.action.PromptInputLine({
  --     description = "Enter new name for tab",
  --     action = wezterm.action_callback(function(window, _, line)
  --       if line then
  --         window:active_tab():set_title(line)
  --       end
  --     end),
  --   }),
  -- },
}

return config
