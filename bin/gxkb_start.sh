#!/bin/bash


if [ -f ~/.config/gxkb/gxkb.cfg ]; then
     rm ~/.config/gxkb/gxkb.cfg
fi

gxkb & disown
