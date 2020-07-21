#!/bin/bash

rofi_command="rofi -theme powermenu.rasi -location 2 -lines 2 -dmenu -p power"
option_reboot=" reboot"
option_shutdown=" shutdown"

options="$option_reboot\n$option_shutdown"

chosen="$(echo -e "$options" | $rofi_command)"
case $chosen in
    $option_reboot)
        systemctl reboot;;
    $option_shutdown)
        systemctl poweroff;;
esac
