#!/bin/sh
WORKSPACE=$(hyprctl -j activeworkspace | jq -r '.id')
LAYOUT=$(hyprctl -j activeworkspace | jq -r '.tiledLayout')

if [ "$LAYOUT" != "scrolling" ]; then
  exit 0
fi

CURRENT=$(hyprctl -j getoption scrolling:focus_fit_method | jq '.int')

if [ "$CURRENT" -eq 1 ]; then
  hyprctl keyword scrolling:focus_fit_method 0
  hyprctl keyword scrolling:column_width 0.6
else
  hyprctl keyword scrolling:focus_fit_method 1
  hyprctl keyword scrolling:column_width 0.5
fi

hyprctl keyword workspace "$WORKSPACE, layout:dwindle"
hyprctl keyword workspace "$WORKSPACE, layout:scrolling"
