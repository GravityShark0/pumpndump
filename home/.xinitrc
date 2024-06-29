#!/bin/sh
# This script runs once

# Darker screen when night time
gammastep &

# Pipewire / Audio
gentoo-pipewire-launcher &

# Monitor setup
~/.scripts/monitor/auto.sh &

exec dbus-launch --exit-with-session awesome
# exec dbus-launch --sh-syntax --exit-with-session awesome
