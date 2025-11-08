-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- Changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- Defining the default padding
local default_padding = {
	left = 152,
	right = 152,
	top = 0,
	bottom = 10,
}

-- Applying the default padding
config.window_padding = default_padding

wezterm.on("update-status", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local title = pane:get_title()

	-- Checking if Neovim is running (title contains 'nvim' or 'n-vi-m-')
	if string.find(title, "nvim") or string.find(title, "^n-vi-m-.*") then
		-- If Neovim, set padding to zero
		overrides.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
	else
		-- Otherwise, use the default padding
		overrides.window_padding = default_padding
	end

	window:set_config_overrides(overrides)
end)

-- configures whether the window has a title bar and/or resizable border
config.window_decorations = "RESIZE"

-- the tab bar will be rendered at the bottom of the window
-- config.tab_bar_at_bottom = true
config.enable_tab_bar = false

-- Changing the font size and color scheme.

config.font = wezterm.font("AtkynsonMono Nerd Font")
config.font_size = 16
config.line_height = 1.25

-- Changing the font size and color scheme.

-- Default Color Scheme
config.color_scheme = "Quotidian"
-- config.color_scheme = "Silk Dark (base16)"
-- config.color_scheme = "Avalution"
-- config.color_scheme = "Ryuuko"
-- config.color_scheme = "Ocean (base16)"
-- config.color_scheme = "PaleNightHC"
-- config.color_scheme = "Oceanic-Next"
-- config.color_scheme = "Flat (base16)"
-- config.color_scheme = "Mariana"

-- Avalution's Color Schemes
-- config.color_scheme = "Avalution"
-- config.color_scheme = "Avalution_Flow"
-- config.color_scheme = "Green_Years"
-- config.color_scheme = "Avalution_Paper"

-- favourite light background schemes
-- config.color_scheme = "Zenbones_light"
-- config.color_scheme = "Mexico Light (base16)"
-- config.color_scheme = "Harmonic16 Light (base16)"
-- config.color_scheme = "Atelier Savanna Light (base16)"
-- config.color_scheme = "Novel"

-- favourite dark background schemes
-- config.color_scheme = "Silk Dark (base16)"
-- config.color_scheme = "Ryuuko"
-- config.color_scheme = "Ocean (base16)"
-- config.color_scheme = "PaleNightHC"
-- config.color_scheme = "Oceanic-Next"
-- config.color_scheme = "Flat (base16)"
-- config.color_scheme = "Mariana"
-- config.color_scheme = "Chester"
-- config.color_scheme = "Breeze"
-- config.color_scheme = "Nova (base16)"
-- config.color_scheme = "MaterialDesignColors"
-- config.color_scheme = "Navy and Ivory (terminal.sexy)"

-- Spawn a fish shell in login mode
config.default_prog = { "/usr/bin/fish", "-l" }

-- Finally, return the configuration to wezterm:
return config
