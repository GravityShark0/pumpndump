#!/bin/sh

if [ $DISPLAY ]; then
    hdmi_status=$(cat /sys/class/drm/card1-HDMI-A-2/status)
    if [ ! $hdmi_status ]; then
        hdmi_status=$(cat /sys/class/drm/card0-HDMI-A-2/status)
    fi
    xrandr --setprovideroutputsource modesetting NVIDIA-0
    if [ "$hdmi_status" = "connected" ]; then
        xrandr --output HDMI-0 --primary --mode 1440x900 --pos 0x0 --rotate normal --output eDP-1-1 --off
    else
        xrandr --output eDP-1-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-0 --off
        # xrandr --output HDMI-0 --primary --mode 1440x900 --pos 0x0 --rotate normal --output eDP-1-1 --mode 1600x900 --pos 1440x0 --rotate normal
    fi
fi
