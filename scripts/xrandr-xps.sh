#!/bin/sh

noExternals=$(xrandr | grep -c "DP-. disconnected")
if [[ $noExternals -eq 3 ]]; then
  xrandr -s 1920x1080
  xrandr --dpi 96
else
  xrandr --output eDP-1 --off --output DP-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-2 --mode 1920x1080 --pos 3840x0 --rotate normal --output DP-3 --mode 1920x1080 --pos 0x0 --rotate normal
fi
