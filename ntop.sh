#!/bin/bash
# Author: Pelochus
# Brief: A very basic 'top' style program that shows the status of the NPU in Rockchip's SoCs 

# Variables
$CLEAR

# Parameters check
if [ $1 -eq "-h" ]; then
    # TODO: Help menu
elif [ $1 -eq "-c" ]; then
    $CLEAR=clear
fi

while true; do
    $CLEAR
    cat /sys/kernel/debug/rknpu/load
    sleep 0.5
done
