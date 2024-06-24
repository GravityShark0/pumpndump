#!/bin/sh
# This script runs once
# (sleep 5 && bloatwindow) &
gentoo-pipewire-launcher restart &
exec dbus-launch --exit-with-session awesome
# exec dbus-launch --sh-syntax --exit-with-session awesome
