#!/bin/bash

while ! /usr/bin/fakeroot /usr/bin/pacman -Qu --dbpath /tmp/checkup-db-1000 >/dev/null 2>&1; do
    sleep 1
done

# polybar color formatting
RED='%{T5}%{F#F28FAD}%{u#F28FAD}%{+u}'
YELLOW='%{T5}%{F#FAE3B0}%{u#FAE3B0}%{+u}'
FONT='%{T1}'
NIL='%{-u}%{F-}%{T-}'

CHECKUPDATES=$(/usr/bin/fakeroot /usr/bin/pacman -Qu --dbpath /tmp/checkup-db-1000 2>/dev/null)
CRITICAL=$(echo "$CHECKUPDATES" | grep linux)
COUNT=$(echo "$CHECKUPDATES" | wc -l)
[[ -z $CRITICAL ]] && echo "$YELLOW󰮯$FONT $COUNT$NIL  " || echo "$RED$FONT $COUNT$NIL  " 
