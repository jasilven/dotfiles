local wezterm = require 'wezterm';
return {
   font = wezterm.font("JetBrainsMono Nerd Font", {weight="Medium"}),
   font_size = 16.5,
   -- color_scheme = "Github",
   hide_tab_bar_if_only_one_tab = false,
   inactive_pane_hsb = {
       saturation = 1.0,
       brightness = 1.0,
   },
   set_environment_variables = {
       VTE_VERSION = '6003',
   },
   -- use_dead_keys = false,
   window_padding = {
       left = 0,
       right = 0, -- This will become the scrollbar width if you have enabled the scrollbar!
       top = 0,
       bottom = 0,
   },
   keys = {
       -- Turn off the default CMD-m Hide action on macOS by making it
       -- send the empty string instead of hiding the window
       {key=" ", mods="CTRL|SHIFT", action="ActivateCopyMode"},
       {key="Tab", mods="CTRL", action=wezterm.action{ActivateTabRelative=1}},
       {key="RightArrow", mods="CTRL", action=wezterm.action{ActivateTabRelative=1}},
       {key="LeftArrow", mods="CTRL", action=wezterm.action{ActivateTabRelative=-1}},
       {key="Enter", mods="CTRL", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
       {key="Enter", mods="CTRL|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
   },
   colors = {
      foreground = "black",
      background = "#f8f8f8",
      cursor_bg = "black",
      cursor_fg = "white",
      cursor_border = "black",
      selection_fg = "black",
      selection_bg = "BurlyWood",
      scrollbar_thumb = "#222222",
      split = "black",
      ansi = {"black", "darkred", "darkgreen", "darkgoldenrod", "navy", "purple", "darkcyan", "#d5d5d5"},
      brights = {"black", "indianred","darkgreen", "olive", "navy", "purple", "teal", "#d5d5d5"},
      tab_bar = {
          background = "black",
          active_tab = {
              bg_color = "steelblue",
              bg_color2 = "#4d4d66",
              fg_color = "white",
              intensity = "Bold",
              underline = "None",
              italic = false,
              strikethrough = false,
          },
          inactive_tab = {
              bg_color = "#212138",
              bg_color2 = "#1b1032",
              fg_color = "darkgrey",
              italic = true,
          },
          inactive_tab_hover = {
              bg_color = "darkblue",
              fg_color = "white",
              italic = false,
          }
      }
    }
}

