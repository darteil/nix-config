#!/bin/sh

if pulseaudio -k; pulseaudio --start; then
  notify-send "Pulse audio restart success"
else
  notify-send "Pulse audio restart failed"
fi
