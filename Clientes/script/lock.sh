#!/bin/bash

export DISPLAY=:0
xinput set-int-prop 12 "Device Enabled" 8 0
xinput set-int-prop 11 "Device Enabled" 8 0
xinput set-int-prop 10 "Device Enabled" 8 0
xinput set-int-prop 9 "Device Enabled" 8 0
xinput set-int-prop 8 "Device Enabled" 8 0
xinput set-int-prop 7 "Device Enabled" 8 0

# quita el "#" para elegir una opcion, de misma forma en el archivo unlock.sh

mplayer -fs -shuffle -loop 0 ~/script/.bloqueo/videos/*.*
#ristretto -f -s ~/script/.bloqueo/imagenes/*.*

