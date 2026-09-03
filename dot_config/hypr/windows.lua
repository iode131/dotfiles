-- Ported from the old (dead, pre-Lua-config) windows.conf.
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/ for concepts;
-- actual API is Hyprland's native Lua config, see /usr/share/hypr/stubs/hl.meta.lua

o.window({ class = "com.mitchellh.ghostty" }, { opacity = "1.0 0.9" })
o.window({ workspace = "special:scratchpad" }, { opacity = "1.0 1.0" })
o.window({ class = "chrome-youtube.com__-Default" }, { opacity = "1.0 1.0" })
o.window({ class = "chrome-twitch.com__directory_following-Default" }, { opacity = "1.0 1.0" })

hl.workspace_rule({
  workspace = "special:scratchpad",
  gaps_out = 40,
  gaps_in = 20,
  border_size = 3,
  layout = "dwindle",
  on_created_empty = "alacritty",
})
