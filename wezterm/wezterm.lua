-- Docs are here: https://wezfurlong.org/wezterm/config/files.html
-- Pull in the wezterm API
local wezterm = require "wezterm"

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "AdventureTime"

config.window_padding = {
    left = 2,
    right = 5,
    top = 0,
    bottom = 0
}
-- config.window_background_opacity = 0.75

config.line_height = 0.9

-- Spawn a zsh shell
config.default_prog = {"/usr/bin/zsh"}

-- Tabs
config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.tab_max_width = 120

-- Visual bell
config.visual_bell = {
    fade_in_function = "EaseIn",
    fade_in_duration_ms = 150,
    fade_out_function = "EaseOut",
    fade_out_duration_ms = 150
}
config.colors = {
    visual_bell = "#202020"
}

-- wezterm.on(
--     "format-window-title",
--     function(tab, pane, tabs, panes, cfg)
--         local zoomed = ""
--         if tab.active_pane.is_zoomed then
--             zoomed = "[Z] "
--         end
--
--         local index = ""
--         if #tabs > 1 then
--             index = string.format("[%d/%d] ", tab.tab_index + 1, #tabs)
--         end
--
--         -- return zoomed .. index .. "afjal"
--         return zoomed .. index .. tab.active_pane.get_current_working_dir()
--     end
-- )

-- and finally, return the configuration to wezterm
return config
