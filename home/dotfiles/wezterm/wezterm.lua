local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Gruvbox dark, medium (base16)"

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

return config
