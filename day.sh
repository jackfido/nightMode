#!/bin/bash

PID=$(pgrep compiz)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

theme2Stablish='Materia-light-compact'
theme=$(gsettings get org.gnome.desktop.interface gtk-theme)

if [ "$theme" != "theme2Stablish" ];
then
	gsettings set org.gnome.desktop.interface gtk-theme theme2Stablish
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
	gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Light'
#    notify-send "Day theme stablished"
fi
