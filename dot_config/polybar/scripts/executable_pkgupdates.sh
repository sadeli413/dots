#!/bin/bash

while ! /usr/bin/fakeroot /usr/bin/pacman -Qu --dbpath /tmp/checkup-db-1000 >/dev/null 2>&1; do
    sleep 1
done

# polybar color formatting
RED='%{T5}%{F#f38ba8}'
YELLOW='%{T5}%{F#f9e2af}'
FONT='%{T4}'
NIL='%{F-}%{T4}'

CHECKUPDATES=$(/usr/bin/fakeroot /usr/bin/pacman -Qu --dbpath /tmp/checkup-db-1000 2>/dev/null)
CRITICAL=$(echo "$CHECKUPDATES" | grep linux)
COUNT=$(echo "$CHECKUPDATES" | wc -l)
[[ -z $CRITICAL ]] && echo "$YELLOW󰮯$FONT $COUNT$NIL" || echo "$RED$FONT $COUNT$NIL" 
# [[ -z $CRITICAL ]] && echo "$YELLOW󰮯$FONT $COUNT$NIL  " || echo "$RED$FONT $COUNT$NIL  " 
