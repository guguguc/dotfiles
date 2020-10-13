#!/usr/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar DP-2 &
polybar HDMI-0 &
