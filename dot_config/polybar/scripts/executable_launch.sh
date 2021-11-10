#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

CONFIG=/home/sadeli/.config/polybar/config.ini
# Launch Polybar, using default config location ~/.config/polybar/config
# polybar on both screens https://github.com/polybar/polybar/issues/763
if type "xrandr"; then
  for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --config=$CONFIG --reload master &
    MONITOR=$m polybar --config=$CONFIG --reload spotify &
  done
else
  polybar --config=$CONFIG --reload master &
  polybar --config=$CONFIG --reload spotify &
fi

echo "Polybar launched..."
