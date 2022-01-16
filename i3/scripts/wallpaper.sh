#!/bin/bash

# 每60秒自动切换壁纸

killall feh

#!/bin/sh
while true;
do
    feh --bg-scale --no-fehbg --randomize ~/Pictures/wallpapers
    sleep 1m
done
