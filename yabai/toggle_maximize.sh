#!/bin/bash

# Obtém o ID da janela focada
window_id=$(yabai -m query --windows --window | jq '.id')

# Obtém o estado de zoom da janela focada
zoom_state=$(yabai -m query --windows --window | jq '.zoom-fullscreen')

# Se a janela estiver em tela cheia, desative o modo de tela cheia, mova a janela para a esquerda 50% e reorganize
if [[ "$zoom_state" -eq 1 ]]; then
    yabai -m window --toggle zoom-fullscreen
    yabai -m window --grid 2:1:0:0:1:1
else
    yabai -m window --toggle zoom-fullscreen
fi
