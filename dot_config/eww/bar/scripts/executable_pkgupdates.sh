#!/bin/bash

while ! /usr/bin/fakeroot /usr/bin/pacman -Qu --dbpath /tmp/checkup-db-1000 >/dev/null 2>&1; do
    sleep 1
done

CHECKUPDATES=$(/usr/bin/fakeroot /usr/bin/pacman -Qu --dbpath /tmp/checkup-db-1000 2>/dev/null)
COUNT=$(echo "$CHECKUPDATES" | wc -l)
if [[ "$CHECKUPDATES" == "*linux*" ]]; then
  echo "󰮯 $COUNT"
else
  echo " $COUNT"
fi
