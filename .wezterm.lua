-- Pull in the wezterm API
local wezterm = require("wezterm")

return {
	warn_about_missing_glyphs = false,
	text_background_opacity = 1.0,
	color_scheme = "Predawn (Gogh)",
	font = wezterm.font_with_fallback({
		"IntoneMonoNerdFontMono",
		"Jetbrains Mono",
		"SymbolsNerdFont-Regular",
		"MaterialIconsRound-Regular",
	}),
	font_size = 12.5,
}
