#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Update X resources db manually because we're not using a desktop environment
xrdb -merge ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

exec awesome
