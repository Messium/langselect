#!/bin/bash

layout=$(setxkbmap -query | grep layout)
layout_variant=$(setxkbmap -query | grep variant)

if [[ $layout == "layout:     se" ]]; then
    setxkbmap es
    nvim --server /tmp/nvim.pipe --remote-send '<cmd>set spelllang=es<cr>'
    notify-send "set español"
elif [[ $layout_variant == "variant:    cat" ]]; then
    setxkbmap se
    nvim --server /tmp/nvim.pipe --remote-send '<cmd>set spelllang=sv<cr>'
    notify-send "set svenska"
elif [[ $layout == "layout:     es" ]]; then
    setxkbmap es cat
    nvim --server /tmp/nvim.pipe --remote-send '<cmd>set spelllang=ca<cr>'
    notify-send "set català"
fi

# WIP wayland hyprland
# session=$(echo $XDG_SESSION_TYPE)
# x11 or wayland

# if [[ $session == "wayland" ]]; then
#
# layout=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')
# if [[ $layout == "Swedish" ]]; then
#     notify-send "set español"
#     nvim --server /tmp/nvim.pipe --remote-send '<cmd>set spelllang=es<cr>'
# elif [[ $layout == "Spanish" ]]; then
#     notify-send "set svenska"
#     nvim --server /tmp/nvim.pipe --remote-send '<cmd>set spelllang=se<cr>'
# fi
# hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap'
# Spanish
# Swedish
# Catalan (Spain, with middle-dot L)
# Asturian (Spain, with bottom-dot H and L)
