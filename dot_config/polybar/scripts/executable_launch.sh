#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
# polybar on both screens https://github.com/polybar/polybar/issues/763
if type "xrandr"; then
  for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload left &
    MONITOR=$m polybar --reload spotify &
    MONITOR=$m polybar --reload right &
  done
else
  polybar --reload left &
  polybar --reload spotify &
  polybar --reload right &
fi

echo "Polybar launched..."
