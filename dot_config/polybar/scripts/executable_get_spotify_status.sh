#!/bin/bash

# https://github.com/PrayagS/polybar-spotify
# The name of polybar bar which houses the main spotify module and the control modules.
PARENT_BAR="right"
PARENT_BAR_PID=$(pgrep -a "polybar" | grep "$PARENT_BAR" | cut -d" " -f1)

# Set the source audio player here.
# Players supporting the MPRIS spec are supported.
# Examples: spotify, vlc, chrome, mpv and others.
# Use `playerctld` to always detect the latest player.
# See more here: https://github.com/altdesktop/playerctl/#selecting-players-to-control
PLAYER="spotify"

# Format of the information displayed
# Eg. {{ artist }} - {{ album }} - {{ title }}
# See more attributes here: https://github.com/altdesktop/playerctl/#printing-properties-and-metadata
FORMAT="  {{ artist }} | {{ title }}"

# Sends $2 as message to all polybar PIDs that are part of $1
update_hooks() {
    while IFS= read -r id
    do
        polybar-msg -p "$id" hook spotify-play-pause $2 1>/dev/null 2>&1
    done < <(echo "$1")
}

PLAYERCTL_STATUS=$(playerctl --player=$PLAYER status 2>/dev/null)
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
    STATUS=$PLAYERCTL_STATUS
else
    STATUS="No player is running"
    NOSTAT="  · · · · · · · · · · · · · ·     "
fi

if [ "$1" == "--status" ]; then
    echo "$STATUS"
else
    if [ "$STATUS" = "Stopped" ]; then
        echo "$NOSTAT"
    elif [ "$STATUS" = "Paused"  ]; then
        update_hooks "$PARENT_BAR_PID" 2
        PLAYER_OUT=$(playerctl --player=$PLAYER metadata --format "$FORMAT" 2>/dev/null)
        echo "$PLAYER_OUT" "    "
    elif [ "$STATUS" = "No player is running"  ]; then
        echo -e "$NOSTAT"
    else
        update_hooks "$PARENT_BAR_PID" 1
        PLAYER_OUT=$(playerctl --player=$PLAYER metadata --format "$FORMAT" 2>/dev/null)
        echo "$PLAYER_OUT" "    "
    fi
fi
