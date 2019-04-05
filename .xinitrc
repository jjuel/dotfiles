#! /bin/sh

compton -b &
nitrogen --restore &

# ~/bin/startdwm &
slstatus &

exec dwm
