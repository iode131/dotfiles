-- Change the default Omarchy look'n'feel.

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
hl.config({
  general = {
    -- No gaps between windows or borders.
    gaps_in = 0,
    gaps_out = 0,
    border_size = 4,

    -- Change to niri-like side-scrolling layout.
    layout = "scrolling",
  },

  -- Layout-agnostic settings (introduced in 0.54)
  layout = {
      single_window_aspect_ratio = {4, 3}, -- If there is only 1 window on the workspace, it displays as a square
  },

  -- See https://wiki.hypr.land/Configuring/Scrolling-Layout/ for more
  scrolling = {
      column_width = 0.7,
      focus_fit_method = 0,
    },

  -- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
  dwindle = {
      -- pseudotile = true -- Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true, -- You probably want this
      force_split = 2, -- Always split on the right
    },

  -- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
  master = {
      new_status = master
  },

  decoration = {

    rounding = 12,

    -- https://wiki.hyprland.org/Configuring/Variables/#blur
    blur = {
        enabled = true,
        size = 6,
        passes = 1,
        vibrancy = 0.1696,
    }
  }
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
-- hl.config({
--   decoration = {
--     -- Use round window corners.
--     rounding = 8,
--
--     -- Dim unfocused windows (0.0 = no dim, 1.0 = fully dimmed).
--     dim_inactive = true,
--     dim_strength = 0.15,
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#animations
-- hl.config({
--   animations = {
--     -- Disable all animations.
--     enabled = false,
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#layout
-- hl.config({
--   layout = {
--     -- Avoid overly wide single-window layouts on wide screens.
--     single_window_aspect_ratio = { 1, 1 },
--   },
-- })

-- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
-- hl.config({
--   scrolling = {
--     -- See only one column per screen instead of two.
--     column_width = 0.97,
--   },
-- })
