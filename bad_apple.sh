#!/bin/bash

# Bad Apple in linux text shell.
# by Irek Pelech (c) 2019
# https://www.seniorlinuxadmin.co.uk
#
# ffmpeg -i badapple.mp4 -vsync 0 "$filename%03d.jpg"
# ls *.jpg -v|xargs -I {} jp2a {}

SIZE=$(tput cols)x$(tput lines)


for i in $(ls *.jpg -v); do
	jp2a --size=${SIZE} $i
	sleep 0.05
done
