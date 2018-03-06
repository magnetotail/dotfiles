#!/bin/sh
THEME_NAME=$(themer list | shuf -n 1)
themer activate $THEME_NAME
