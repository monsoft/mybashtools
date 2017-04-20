#!/bin/sh
# 2560x1080 screen resolution for Bunsenlabs Linux

xrandr --newmode "2560x1080"  230.00  2560 2720 2992 3424  1080 1083 1093 1120 -hsync +vsync
xrandr --addmode Virtual1 2560x1080
xrandr --output Virtual1 --mode 2560x1080 --pos 0x0 --rotate normal 
