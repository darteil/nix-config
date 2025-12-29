local wezterm = require("wezterm")
local split_nav = require("split_nav")
local config = {}

config.font = wezterm.font("UbuntuMono Nerd Font Mono")
config.font_size = 14.0
config.color_scheme = "Kanagawa Dragon (Gogh)"
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.freetype_load_flags = "NO_HINTING"
config.cell_width = 0.90
config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0.7cell",
	bottom = 0,
}

config.disable_default_key_bindings = true
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1500 }

config.keys = {
	{ key = "-", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "=", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = ".", mods = "ALT", action = wezterm.action.ActivateTabRelative(1) },
	{ key = ",", mods = "ALT", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "Insert", mods = "SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
	split_nav("h"),
	split_nav("j"),
	split_nav("k"),
	split_nav("l"),
}

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.5,
}

config.use_fancy_tab_bar = false

config.colors = {
	tab_bar = {
		background = "#0d0c0c",
		active_tab = {
			bg_color = "#b6927b",
			fg_color = "#181616",
		},
		inactive_tab = {
			bg_color = "#7a8382",
			fg_color = "#181616",
		},
		inactive_tab_hover = {
			bg_color = "#e6c384",
			fg_color = "#181616",
		},
		new_tab = {
			bg_color = "#a6a69c",
			fg_color = "#181616",
		},
		new_tab_hover = {
			bg_color = "#e6c384",
			fg_color = "#181616",
		},
	},
}

wezterm.on("format-tab-title", function(tab)
	return {
		{ Text = " <Workspace-" .. tab.tab_index + 1 .. "> " },
	}
end)

return config
