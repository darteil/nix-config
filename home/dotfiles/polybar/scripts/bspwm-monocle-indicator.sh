#!/bin/sh

bspc subscribe desktop_focus desktop_layout node_remove node_add node_transfer | while read -r _; do

    monocle=$(bspc query -D -d focused.monocle)

    if [[ $monocle ]]; then
      desktop=$(bspc query -D -d focused --names)
      number_of_windows=$(bspc query -N -d "$desktop" -n .window | wc -l)
      echo "Monocle = $number_of_windows"
    else
      echo ""
    fi
done
