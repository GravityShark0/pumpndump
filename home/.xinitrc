#!/bin/sh
# This script runs once
# (sleep 5 && bloatwindow) &
# gammastep &
~/.scripts/monitor/auto.sh
gentoo-pipewire-launcher &
# kitty -1 --start-as minimized &
exec dbus-launch --exit-with-session awesome
# exec dbus-launch --sh-syntax --exit-with-session awesome
