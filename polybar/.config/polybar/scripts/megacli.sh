#!/bin/sh

status=$(mega-sync | awk 'NR==2 {print $5}')
error=$(mega-sync | awk 'NR==2 {print $6}')

if [[ $status == "Synced" && $error == "NO" ]]; then
  echo "Synced"
  else 
    echo "Error"
fi
