#!/usr/bin/bash
for i in nvim zathura alacritty picom; do
    cp ~/.config/$i/* ./.config/$i/
done
cp ~/.xinitrc .
cp ~/.set_zathura .

