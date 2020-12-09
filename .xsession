# Thinkpad enable TrackPoint scrolling using middle button
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 2
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5

# Use caps lock as ctrl key
setxkbmap -option ctrl:nocaps

nitrogen --restore
# slstatus &
dwmblocks &

# exec sdorfehs
# exec progman
# awesome
exec dwm
