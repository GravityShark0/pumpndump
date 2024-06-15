#!/bin/sh
# This script runs once
# (sleep 5 && bloatwindow) &
nohup gentoo-pipewire-launcher restart > /dev/null &
exec dbus-launch --exit-with-session awesome
# exec dbus-launch --sh-syntax --exit-with-session awesome
