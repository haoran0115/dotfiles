#!/usr/bin/bash

# home rc files
cp ~/.bashrc  .
cp ~/.alias   .
cp ~/.xinitrc .
cp ~/.proxy   .
cp ~/.inputrc .

# user config files
for i in picom dunst nvim goldendict betterlockscreen; do
    mkdir -p ./dotconfig/$i
    cp -r ~/.config/$i/* ./dotconfig//$i/
done
for i in alacritty kitty mpv zathura; do
    mkdir -p ./dotconfig//$i
    cp    ~/.config/$i/* ./dotconfig//$i/
done

# system config files
cp /etc/dnf/dnf.conf ./etc/dnf
cp /etc/NetworkManager/conf.d/wifi-powersave-off.conf etc/NetworkManager/conf.d/
cp /etc/X11/xorg.conf.d/30-touchpad.conf ./etc/X11/xorg.conf.d/30-touchpad.conf

# scripts
cp ~/.set_zathura .
cp ~/.fehbg       .
cp ~/.randbg      .
cp ~/.local/bin/clipmenu.sh    ./dotlocal/bin/
cp ~/.local/bin/maim_notify.sh ./dotlocal/bin/
cp ~/.local/bin/gg             ./dotlocal/bin/
cp ~/.local/bin/lock.sh        ./dotlocal/bin/


