#!/bin/sh

# (emacs --daemon && emacsclient -nc) &
# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto
~/.scripts/monitor/auto.sh
# xrandr --output HDMI-0 --auto --output eDP-1-1 --auto
# dash ~/.screenlayout/single.sh

gentoo-pipewire-launcher &

# xset -dpms &
# picom &
# discord &
# st -e syncclock &
# tmux new-session -d -s "gravity" &
# firefox &
# qownnotes &
# st -e nvim ~/Notes/index.norg &
# xscreensaver --no-splash &
# xclipboard &

# $(xrdb ~/.config/suckless/catppuccin/mocha && st -e nvim $HOME/Notes) &
# feh ~/Media/Wallpapers/minimalistic/minimalistic/unicat.png --bg-scale &
exec dbus-launch --sh-syntax --exit-with-session awesome

