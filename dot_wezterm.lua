local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

config.default_prog = { "nu" }
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 14

config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 2
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.switch_to_last_active_tab_when_closing_tab = true

config.max_fps = 240

-- tmux-like keybinds
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
    {
        key = "-",
        mods = "LEADER",
        action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
        key = "\\",
        mods = "LEADER",
        action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
        key = "h",
        mods = "CTRL|SHIFT",
        action = action.AdjustPaneSize({ "Left", 5 }),
    },
    {
        key = "l",
        mods = "CTRL|SHIFT",
        action = action.AdjustPaneSize({ "Right", 5 }),
    },
    {
        key = "j",
        mods = "CTRL|SHIFT",
        action = action.AdjustPaneSize({ "Down", 5 }),
    },
    {
        key = "k",
        mods = "CTRL|SHIFT",
        action = action.AdjustPaneSize({ "Up", 5 }),
    },
    {
        key = "m",
        mods = "LEADER",
        action = action.TogglePaneZoomState,
    },
    {
        key = "h",
        mods = "LEADER",
        action = action.ActivatePaneDirection("Left") ,
    },
    {
        key = "l",
        mods = "LEADER",
        action = action.ActivatePaneDirection("Right") ,
    },
    {
        key = "j",
        mods = "LEADER",
        action = action.ActivatePaneDirection("Down") ,
    },
    {
        key = "k",
        mods = "LEADER",
        action = action.ActivatePaneDirection("Up") ,
    },
    { 
        key = "[", 
        mods = "LEADER", 
        action = action.ActivateCopyMode 
    },
    {
        key = "x",
        mods = "LEADER",
        action = action.CloseCurrentPane {confirm = false} ,
    },
}

return config
