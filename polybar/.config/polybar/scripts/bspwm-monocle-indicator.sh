#!/bin/sh

monitor="HDMI-0"

bspc subscribe desktop_focus desktop_layout node_remove node_add node_transfer | while read -r _; do

    monocle=$(bspc query -D -m "$monitor" focused.monocle)

    if [[ $monocle ]]; then
      desktop=$(bspc query -D -m "$monitor" -d --names)
      number_of_windows=$(bspc query -N -d "$desktop" -n .window | wc -l)
      echo "[M]=$number_of_windows"
    else
      echo ""
    fi
done
