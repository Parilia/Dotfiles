local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 12.0
config.color_scheme = "JetBrains Darcula"
config.colors = {
	cursor_bg = "#52b9c5",
	cursor_border = "#52b9c5",
	cursor_fg = "#eff0f1",
	selection_bg = "#1a3272",
	selection_fg = "#adadad",
}

config.window_background_opacity = 0.8
config.hide_tab_bar_if_only_one_tab = true
config.default_cursor_style = "BlinkingUnderline"
config.cursor_blink_rate = 550
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
-- window size
config.initial_rows = 35
config.initial_cols = 120

config.warn_about_missing_glyphs = false

return config
