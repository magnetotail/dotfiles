#!/bin/bash
pkill polybar
pkill dunst
sleep 0.5
polybar main&
dunst -c ~/.config/dunst/dunstrc&
