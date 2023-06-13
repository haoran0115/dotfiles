#!/bin/bash
NAME=$HOME/Pictures/Screenshots/$(date +%F-%H_%M_%S).png
# maim --hidecursor $1 $NAME && \
#     xclip -selection clipboard -t image/png $NAME
maim --hidecursor $1 $NAME \
    && xclip -selection clipboard -t image/png "$NAME" \
    && notify-send  "Screenshot saved as $NAME" --icon=/home/shiroha/.local/share/icons/actions/01.png

