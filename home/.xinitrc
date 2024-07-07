#!/bin/sh
# This script runs once when first opening X11
# SHEMACS
emacsclient --eval "(progn (setenv \"DBUS_SESSION_BUS_ADDRESS\" \"${DBUS_SESSION_BUS_ADDRESS}\")  (dbus-init-bus))"

# Pipewire
gentoo-pipewire-launcher &
# Setup monitors
~/.scripts/monitor/auto.sh &
nvidia-settings -l &

exec dbus-launch --exit-with-session awesome
