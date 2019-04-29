#!/bin/bash
export DISPLAY=:0
xinput set-int-prop 17 "Device Enabled" 8 1
xinput set-int-prop 16 "Device Enabled" 8 1
xinput set-int-prop 15 "Device Enabled" 8 1
xinput set-int-prop 14 "Device Enabled" 8 1
xinput set-int-prop 13 "Device Enabled" 8 1
xinput set-int-prop 12 "Device Enabled" 8 1
xinput set-int-prop 11 "Device Enabled" 8 1
xinput set-int-prop 10 "Device Enabled" 8 1
xinput set-int-prop 9 "Device Enabled" 8 1
xinput set-int-prop 8 "Device Enabled" 8 1
xinput set-int-prop 7 "Device Enabled" 8 1
xinput set-int-prop 6 "Device Enabled" 8 1
xinput set-int-prop 5 "Device Enabled" 8 1
xinput set-int-prop 4 "Device Enabled" 8 1
xinput set-int-prop 3 "Device Enabled" 8 1
xinput set-int-prop 2 "Device Enabled" 8 1
xinput set-int-prop 1 "Device Enabled" 8 1

pkill mplayer
pkill ristretto
