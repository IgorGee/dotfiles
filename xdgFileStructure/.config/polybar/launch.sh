#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Multimonitor support
if type "xrandr"; then
  # if there's only one monitor present, then don't do anything special
  if [[ $(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l) -eq 1 ]]; then
    polybar --reload bar &
  else
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1 | tail -n +2); do
      MONITOR=$m polybar --reload bar &
    done
  fi
else
  polybar --reload bar &
fi

echo "Polybar launched..."
