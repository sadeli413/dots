#!/bin/bash

EWW="/usr/bin/eww -c $HOME/.config/eww/bar"

# Open on each monitor
BARS=""
for monitor in $(bspc query -M --names); do
  BARS+="bar_$monitor "
done

$EWW kill
$EWW open-many $BARS

# Close eww on fullscreen
bspc subscribe node_state | while read -r _ _ _ _ state flag; do
  if [ "$state" != "fullscreen" ]; then
    continue
  fi

  monitor=$(bspc query -M -m --names)
  if [ "$flag" == on ]; then
    $EWW close "bar_$monitor"
  else
    $EWW open "bar_$monitor"
  fi
done
