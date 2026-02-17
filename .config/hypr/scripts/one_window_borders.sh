#!/usr/bin/env bash

# Configurable defaults
BORDER_DEFAULT=2    # your normal border size
ROUNDING_DEFAULT=10 # your normal rounding
BORDER_SINGLE=0     # border when only one window
ROUNDING_SINGLE=0   # rounding when only one window

SIG="${HYPRLAND_INSTANCE_SIGNATURE}"
SOCK="/tmp/hypr/${SIG}/.socket2.sock"

get_active_workspace_id() {
    hyprctl activeworkspace -j | jq '.id'
}

count_windows_on_workspace() {
    local ws_id="$1"
    hyprctl clients -j | jq "[.[] | select(.workspace.id == ${ws_id} and .mapped == true)] | length"
}

apply_single_window_decoration() {
    hyprctl keyword general:border_size "${BORDER_SINGLE}"
    hyprctl keyword decoration:rounding "${ROUNDING_SINGLE}"
}

apply_default_decoration() {
    hyprctl keyword general:border_size "${BORDER_DEFAULT}"
    hyprctl keyword decoration:rounding "${ROUNDING_DEFAULT}"
}

recalc() {
    local ws_id
    ws_id="$(get_active_workspace_id)"
    [ -z "$ws_id" ] && return

    local count
    count="$(count_windows_on_workspace "$ws_id")"

    if [ "$count" -eq 1 ]; then
        apply_single_window_decoration
    else
        apply_default_decoration
    fi
}

# Initial run
recalc

# Listen to Hyprland events and recalc on changes
socat - UNIX-CONNECT:"${SOCK}" | while read -r line; do
    case "$line" in
    workspace* | activewindow* | openwindow* | closewindow*)
        recalc
        ;;
    esac
done
