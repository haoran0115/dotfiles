## launch dwm ##

# Mandatorily source xinitrc-common, which is common code shared between the
# Xsession and xinitrc scripts which has been factored out to avoid duplication
. /etc/X11/xinit/xinitrc-common

## launch gnome-session ## !!! important !!!

# launch gnome-polkit
exec /usr/libexec/polkit-gnome-authentication-agent-1 &

# # source dpi
# . /etc/X11/Xresources # seems useless

# # ibus input
# export XMODIFIERS=@im=ibus
# export GTK_IM_MODULE=ibus
# export QT_IM_MODULE=ibus
# ibus-daemon -drx

# fcitx5 input
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
export INPUT_METHOD=fcitx5
export SDL_IM_MODULE=fcitx5
export GLFW_IM_MODULE=ibus

# keep screen on
xset dpms 0 0 0 # equivalent to xset -dpms

# allow window to be transparent
# xcompmgr -c & (deprecated)
picom -CGb --vsync &

# set wall paper
feh --bg-fill ~/Pictures/04.png

# turn on notifications
dunst &

# set top bar have time
# bash ~/.set_dwm_time & (not used)
slstatus &

# start input
fcitx5 &

# execute dwm
# exec dbus-launch dwm
exec dwm

################

