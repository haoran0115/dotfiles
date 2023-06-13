### launch dwm ###

# Mandatorily source xinitrc-common, which is common code shared between the
# Xsession and xinitrc scripts which has been factored out to avoid duplication
. /etc/X11/xinit/xinitrc-common

## ibus input
#export XMODIFIERS=@im=ibus
#export GTK_IM_MODULE=ibus
#export QT_IM_MODULE=ibus
#ibus-daemon -drx

# import gnome desktop style settings
# remember this directory: /etc/xdg/autostart
/usr/libexec/gsd-xsettings &

# # override style for QT applications
# export QT_STYLE_OVERRIDE=gtk


# launch gnome-polkit
/usr/libexec/polkit-gnome-authentication-agent-1 &
## init keyring, seems useless
##/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh
## export keyring globals
#export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK


# fcitx5 input
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
export INPUT_METHOD=fcitx5
export SDL_IM_MODULE=fcitx5
export GLFW_IM_MODULE=fcitx5
#export GLFW_IM_MODULE=ibus

# keep screen on
# xset dpms 0 0 0 # equivalent to xset -dpms
xset s off
xset s noblank
xset -dpms

# allow window to be transparent
# xcompmgr -c & (deprecated)
picom -b

# set wall paper
#feh --bg-fill ~/Pictures/04.png
#feh --randomize --bg-fill ~/Pictures/Teresa
#bg_image=$(shuf -e -n1 ~/Pictures/distrotube-wallpapers/*)
#feh --bg-fill $bg_image
. $HOME/.fehbg

# turn on notifications
dunst &

# set top bar have time
# bash ~/.set_dwm_time & (not used)
slstatus &

# start input
fcitx5 &

# start clipmenu (clipboard for dmenu)
CM_SELECTIONS=clipboard clipmenud &

# rofi clipboard
greenclip daemon &

## brightness
#. $HOME/.brightness

# gesture
libinput-gestures-setup start &

#. $HOME/.nvidia

# execute dwm
# exec dbus-launch dwm
# exec dwm
#exec dwm.sh

while true; do
    ## Log stderror to a file
    #dwm 2> ~/.dwm.log
    # No error logging
    dwm >/dev/null 2>&1
done


################
