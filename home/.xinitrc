#!/bin/sh
# This script runs once

(sleep 5 && timeout 60 st -c float -g 43x1 -e sh ~/.scripts/bloatprompt) &

exec dbus-launch --exit-with-session awesome
# exec dbus-launch --sh-syntax --exit-with-session awesome
