#!/bin/bash

powerDraw="󰠰 $(cat /sys/class/power_supply/BAT*/charge_now))w"


cat << EOF
{ "text":"$powerDraw", "tooltip":"power Draw $powerDraw"}  
EOF
