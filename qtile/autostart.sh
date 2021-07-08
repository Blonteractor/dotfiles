#!/usr/bin/env bash 

lxsession &
picom --active-opacity=0.85 --inactive-opacity=0.9 --experimental-backends &
nitrogen --restore &
volumeicon &
nm-applet &
