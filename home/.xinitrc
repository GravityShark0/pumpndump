#!/bin/sh
# This script runs once
# (sleep 5 && bloatwindow) &
~/.scripts/monitor/auto.sh
gentoo-pipewire-launcher &
exec dbus-launch --exit-with-session awesome
# exec dbus-launch --sh-syntax --exit-with-session awesome
