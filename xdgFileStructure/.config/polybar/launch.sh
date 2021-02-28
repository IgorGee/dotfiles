#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Multimonitor support
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1 | tail -n +2); do
    MONITOR=$m polybar --reload bar &
  done
else
  polybar --reload bar &
fi

echo "Polybar launched..."
