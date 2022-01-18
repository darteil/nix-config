#!/bin/sh

echo "CPU:$(sensors | grep 'Package id 0:' | head -1 | tr -d '+' | awk '{print substr($4, 1, length($4)-4)}')° \
GPU:$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)°"
