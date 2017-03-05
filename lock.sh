#!/bin/bash
scrot ~/.i3/lockscreen.png
convert ~/.i3/lockscreen.png -resize %10 -blur 2x8 ~/.i3/lockscreen.png
convert ~/.i3/lockscreen.png -resize %1000 ~/.i3/lock.png -gravity center -composite -matte ~/.i3/lockscreen.png

i3lock -i ~/.i3/lockscreen.png
