#!/bin/sh
( st -c update -e timeout 10 syncclock || st -c update -e tmux new-session -s Update 'doas emerge --sync || doas emerge -avuDN --with-bdeps=y @world || flatpak update' ) &

st -c scratchy -e dash -c "echo ' oaa' | nvim ~/Notes/index.org -s -;" &

firefox &
flatpak run org.gimp.GIMP &
flatpak run net.ankiweb.Anki &
flatpak run xyz.armcord.ArmCord &
