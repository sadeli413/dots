#!/bin/bash

# Get the array of desktop names
desktops=( $(bspc query -D -m $EWW_MONITOR --names) )

# Mainloop
workspaces() {
    active=$(bspc query -D -m $EWW_MONITOR -d '.active' --names) # Get the name of active desktops
    occupied=$(bspc query -D -m $EWW_MONITOR -d '.occupied' --names) # Get the names of occupied desktops

    # Create an eww button for each desktop
    buttons=''
    for i in "${!desktops[@]}"; do
        # Check if the desktop is active, occupied, or empty
        status="empty"
        if [[ $active == *"${desktops[$i]}"* ]]; then
            status="active"
        elif [[ $occupied == *"${desktops[$i]}"* ]]; then
            status="occupied"
        fi

        DESKTOP="$EWW_MONITOR:^$((i+1))"
        buttons+="  (button :onclick \"bspc desktop -f $DESKTOP\" :class \"workspace_$status\" \"${desktops[$i]}\")"
    done
    echo "(box :orientation \"h\" :spacing 10 :space-evenly \"false\" $buttons)"
}

workspaces
bspc subscribe desktop node_transfer | while read -r _ ; do
    workspaces
done
