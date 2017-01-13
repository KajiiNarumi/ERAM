#!/bin/bash

#para ver cuales son los puertos usados por el mouse y el keyboard use el siguiente comando
#xinput --list
export DISPLAY=:0
xinput set-int-prop 12 "Device Enabled" 8 0
xinput set-int-prop 11 "Device Enabled" 8 0
xinput set-int-prop 10 "Device Enabled" 8 0
xinput set-int-prop 9 "Device Enabled" 8 0
xinput set-int-prop 8 "Device Enabled" 8 0
xinput set-int-prop 7 "Device Enabled" 8 0


#en caso que quiera que se vean videos o imagenes mientras se bloquean quite el "#" a una de las siguientes opciones
#videos
#mplayer -fs -shuffle -loop 0 ~/.bloqueo/*.*
#fotos
#eog -f -s ~/.bloqueo/*.jpg

#recuerde que de ve de tener una carpeta llamada .bloqueo con las imagenes o videos para que las reprodusca
