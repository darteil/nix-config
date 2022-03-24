#!/bin/sh

echo "GPU:$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)°"
