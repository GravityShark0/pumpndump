#!/bin/sh
# This script runs once when first opening X11

# SHEMACS
emacs --daemon

# Pipewire
gentoo-pipewire-launcher &

# Setup monitors
~/.scripts/monitor/auto.sh &
# Setup external monitor colors
nvidia-settings -l &

# Open org mode
sleep 5 && org &

exec dbus-launch --exit-with-session awesome
