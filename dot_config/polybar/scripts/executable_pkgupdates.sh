#!/bin/bash

while ! fakeroot /usr/bin/pacman -Qu --dbpath /tmp/checkup-db-1000 >/dev/null 2>&1; do
    sleep 1
done

# polybar color formatting
RED='%{T5}%{F#D46CA5}%{u#D46CA5}%{+u}'
PURPLE='%{T5}%{F#E397F3}'
FONT='%{T1}'
NIL='%{-u}%{F-}%{T-}'

CHECKUPDATES=$(fakeroot /usr/bin/pacman -Qu --dbpath /tmp/checkup-db-1000 2>/dev/null)
CRITICAL=$(echo "$CHECKUPDATES" | grep linux)
COUNT=$(echo "$CHECKUPDATES" | wc -l)
[[ -z $CRITICAL ]] && echo "$PURPLE$FONT $COUNT$NIL  " || echo "$RED󰮯$FONT $COUNT$NIL  " 
