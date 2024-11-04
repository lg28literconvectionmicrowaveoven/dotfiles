local wezterm = require("wezterm")
local nord = wezterm.color.get_builtin_schemes()["nord"]
nord.cursor_bg = "#81A1C1"
return {
	font = wezterm.font("JetBrainsMono Nerd Font Mono"),
	font_size = 11,
	enable_tab_bar = false,
	color_schemes = {
		["microwave_nord"] = nord,
	},
	color_scheme = "microwave_nord",
	audible_bell = "Disabled",
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		left = 11,
		right = 2,
		top = 10,
		bottom = 8,
	},
}
