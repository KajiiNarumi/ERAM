#!/bin/bash
export DISPLAY=:0

xinput set-int-prop 12 "Device Enabled" 8 1
xinput set-int-prop 11 "Device Enabled" 8 1
xinput set-int-prop 10 "Device Enabled" 8 1
xinput set-int-prop 9 "Device Enabled" 8 1
xinput set-int-prop 8 "Device Enabled" 8 1
xinput set-int-prop 7 "Device Enabled" 8 1

pkill mplayer
pkill ristretto
