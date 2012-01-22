#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Update X resources db manually because we're not using a desktop environment
xrdb -merge -I$HOME/.config/xrdb $HOME/.config/Xresources

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Start XScreenSaver daemon
exec xscreensaver -no-splash &

# Start window manager
exec awesome & wmpid=$!

# Start additional applications
# TODO: implement me

# Wait until window manager has stopped
wait $wmpid

# Exit XScreenSaver process gracefully
exec xscreensaver-command -exit
