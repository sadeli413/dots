#!/bin/bash

# https://github.com/PrayagS/polybar-spotify
# see man zscroll for documentation of the following parameters
# --scroll-padding "  " \
zscroll -l 30 \
        --delay 0.1 \
        --match-command "$HOME/.config/polybar/scripts/get_spotify_status.sh --status" \
        --scroll-padding "" \
        --match-text "Playing" "--scroll 1" \
        --match-text "No player is running" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true "$HOME/.config/polybar/scripts/get_spotify_status.sh" &

wait
