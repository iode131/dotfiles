-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"):
--   omarchy_preinstalled_bindings = false

-- Re-adding some of the preinstalled ones
o.bind("SUPER + SHIFT + O", "Obsidian", { launch = "obsidian", focus = "obsidian" })
o.bind("SUPER + SHIFT + W", "Omawrite", { launch = "omawrite" })
o.bind("SUPER + SHIFT + SLASH", "Passwords", { omarchy = "1password" })
o.bind("SUPER + SHIFT + Y", "YouTube", { webapp = "https://youtube.com/", focus = true })
o.bind("SUPER + SHIFT + ALT + Y", "Twitch", { webapp = "https://twitch.com/directory/following", focus = true })
o.bind("SUPER + SHIFT + ALT + G", "WhatsApp", { webapp = "https://web.whatsapp.com/", focus = true })
o.bind("SUPER + SHIFT + A", "Claude", { webapp = "https://claude.ai" })
o.bind("SUPER + SHIFT + S", "Slack", { webapp = "https://app.slack.com/client/TJTRKF5J4/C032669D5QQ", focus = true })

-- Window resizing
o.bind("SUPER + SHIFT + CTRL + LEFT", "Expand window left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
o.bind("SUPER + SHIFT + CTRL + RIGHT", "Shrink window left", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
o.bind("SUPER + SHIFT + CTRL + DOWN", "Shrink window up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
o.bind("SUPER + SHIFT + CTRL + UP", "Expand window down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))

-- Switch to workspace
o.bind("SUPER + ALT + RIGHT", "Next workspace", hl.dsp.focus({ workspace = "e+1" }))
o.bind("SUPER + ALT + LEFT", "Previous workspace", hl.dsp.focus({ workspace = "e-1" }))
o.bind("SUPER + ALT + UP", "Former workspace", hl.dsp.focus({ workspace = "previous" }))

-- Plugin bindings
o.bind("SUPER + O", "Obsidian search", "omarchy-shell shell summon bibek.obsidian-search")

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")
