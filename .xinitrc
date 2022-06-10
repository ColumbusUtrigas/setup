killall dwmblocks
xrandr
xrdb ~/.Xresources
picom --experimental-backends &
exec dbus-launch dwm
