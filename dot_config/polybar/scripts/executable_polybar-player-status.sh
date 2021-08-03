#!/bin/bash

# https://github.com/PrayagS/polybar-spotify/issues/12
set -euo pipefail

function status_to_icon {
    while read -r status; do
        if [ "$status" = "Playing" ]; then
            echo ""
        else
            echo ""
        fi
    done
}

echo ""
playerctl status --follow 2>/dev/null | status_to_icon
