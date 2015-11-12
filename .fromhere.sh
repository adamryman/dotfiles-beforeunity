#!/bin/bash
# Launch urxvt from current location
# https://faq.i3wm.org/question/150/how-to-launch-a-terminal-from-here/?answer=152#post-id-152
ID=$(xdpyinfo | grep focus | cut -f4 -d " ")
PID=$(($(xprop -id $ID | grep -m 1 PID | cut -d " " -f 3) + 2))
if [ -e "/proc/$PID/cwd" ]
then
    urxvt -cd $(readlink /proc/$PID/cwd) &
else
    urxvt
fi
