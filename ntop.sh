#!/bin/bash
# Author: Pelochus
# Brief: A very basic 'top' style program that shows the status of the NPU in Rockchip's SoCs 

while true; do
    clear
    cat /sys/kernel/debug/rknpu/load
    sleep 0.5
done
