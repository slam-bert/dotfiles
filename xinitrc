#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/Xresources
sysmodmap=/etc/X11/xinit/Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -n "`/etc/X11/chooser.sh`" ]; then
 command="`/etc/X11/chooser.sh`"
else
 failsafe="yes"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?* ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [ -n "$failsafe" ]; then
 xrandr -s 3440x1440 -r 120
 urxvtd --quiet --opendisplay --fork &
 dbus-launch --sh-syntax --exit-with-session; pulseaudio --kill; gentoo-pipewire-launcher &
 dunst &
 nitrogen --restore &
 picom --experimental-backends &
 xsetroot -cursor_name left_ptr
 sxhkd -c ~/.config/bspwm/sxhkd &
 eval $(dbus-launch --sh-syntax --exit-with-session bspwm)
fi
