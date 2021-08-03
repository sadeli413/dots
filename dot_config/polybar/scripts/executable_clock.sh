#!/bin/bash

# Custom bash script to print clock time
while :
do
    hour=$(date +"%I")
    case $hour in
        00) echo 🕛;;
        01) echo 🕐;;
        02) echo 🕑;;
        03) echo 🕒;;
        04) echo 🕓;;
        05) echo 🕔;;
        06) echo 🕕;;
        07) echo 🕖;;
        08) echo 🕗;;
        09) echo 🕘;;
        10) echo 🕚;;
        11) echo 🕚;;
        12) echo 🕛;;
    esac
    sleep 1m
done
