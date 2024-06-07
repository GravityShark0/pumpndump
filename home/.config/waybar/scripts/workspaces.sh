#!/usr/bin/env bash

case "$1" in 
focus-workspace)
    niri msg action "$@" && pkill -SIGRTMIN+8 waybar;;
up)
    niri msg action focus-workspace-up && pkill -SIGRTMIN+8 waybar;;
down)
    niri msg action focus-workspace-down && pkill -SIGRTMIN+8 waybar;;
*)
	set -e

	monitor=$1

	active=""
	inactive=""

	workspace_str=""

	msg_out="$(niri msg -j workspaces | jq ".[] | .is_active")"
	for ws in $msg_out; do
		if "$ws"; then
			workspace_str="${workspace_str}${active}  "
		else
			workspace_str="${workspace_str}${inactive}  "
		fi
	done

	printf "%s" "$workspace_str"
esac
