#!/bin/bash

#xinput --list
export DISPLAY=:0
xinput set-int-prop 12 "Device Enabled" 8 0
xinput set-int-prop 11 "Device Enabled" 8 0
xinput set-int-prop 10 "Device Enabled" 8 0
xinput set-int-prop 9 "Device Enabled" 8 0
xinput set-int-prop 8 "Device Enabled" 8 0
xinput set-int-prop 7 "Device Enabled" 8 0

ristretto -f -s ~/script/.bloqueo/imagenes/*.*

