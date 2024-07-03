#!/bin/sh
# This script runs once when first opening X11

# Pipewire
gentoo-pipewire-launcher &

# Setup monitors
~/.scripts/monitor/auto.sh &

org &

exec dbus-launch --exit-with-session awesome
