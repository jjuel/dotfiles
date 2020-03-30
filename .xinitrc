#! /bin/sh

# compton -b &
nitrogen --restore &

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

slstatus &

exec dwm
