#!/bin/sh
# This script runs once when first opening X11

# SHEMACS
emacs --daemon

# Pipewire
gentoo-pipewire-launcher &
# Setup monitors
~/.scripts/monitor/auto.sh &
nvidia-settings -l &

exec dbus-launch --exit-with-session awesome
