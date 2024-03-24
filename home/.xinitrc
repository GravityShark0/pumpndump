#!/bin/sh

# (emacs --daemon && emacsclient -nc) &
# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto

~/.scripts/monitor/auto.sh
# ~/.scripts/monitor/dual.sh
# ~/.scripts/monitor/single.sh

gentoo-pipewire-launcher &
picom --animations -b

# ( sleep 1 && dash ~/.scripts/bloatedrun.sh ) &
(sleep 3 && timeout 10 st -c update -g 43x1 -e dash ~/.scripts/bloatprompt) &

exec dbus-launch --sh-syntax --exit-with-session awesome
