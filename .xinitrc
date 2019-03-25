#! /bin/sh

compton -b &
nitrogen --restore &

~/bin/startdwm &

exec dwm
