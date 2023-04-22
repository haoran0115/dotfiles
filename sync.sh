#!/usr/bin/bash

# rc files
cp ~/.bashrc  .
cp ~/.alias   .
cp ~/.xinitrc .
cp ~/.proxy   .
cp ~/.inputrc .

# user config files
for i in picom dunst nvim; do
    mkdir -p ./.config/$i
    cp -r ~/.config/$i/* ./.config/$i/
done
for i in alacritty kitty mpv zathura; do
    mkdir -p ./.config/$i
    cp    ~/.config/$i/* ./.config/$i/
done

# system config files
cp /etc/dnf/dnf.conf ./etc/dnf
cp /etc/NetworkManager/conf.d/wifi-powersave-off.conf etc/NetworkManager/conf.d/

# scripts
cp ~/.set_zathura .
cp ~/.fehbg       .
cp ~/.randbg      .
cp ~/.local/bin/clipmenu.sh    ./.local/bin/
cp ~/.local/bin/maim_notify.sh ./.local/bin/
cp ~/.local/bin/gg             ./.local/bin/


