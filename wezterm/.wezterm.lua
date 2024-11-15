-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.adjust_window_size_when_changing_font_size = false
config.debug_key_events = false
config.enable_tab_bar = false
config.native_macos_fullscreen_mode = false
config.window_close_confirmation = "NeverPrompt"
config.color_scheme = "Catppuccin Mocha"
config.max_fps = 120
config.font_size = 13.0

-- and finally, return the configuration to wezterm
return config
