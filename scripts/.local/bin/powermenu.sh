#!/bin/sh

chosen=$(printf "Lock\nLogout\nReboot\nShutdown" | rofi -dmenu -p "Power")

case "$chosen" in
    Lock)
        i3lock
        ;;
    Logout)
        i3-msg exit
        ;;
    Reboot)
        systemctl reboot
        ;;
    Shutdown)
        systemctl poweroff
        ;;
esac
