#!/bin/bash

sudo apt-get update

sudo apt-get install zenity -y

zenity --notification --window-icon="info" --text="Actualizacion de repositorios"

sudo apt-get update

zenity --notification --window-icon="info" --text="Instalando aplicaciones"

sudo apt-get install mplayer ristretto cron wondershaper wakeonlan ethtool ssh -y

zenity --notification --window-icon="info" --text="Actualizando Sistema y limpiando"

sudo apt-get dist-upgrade -y

sudo apt autoremove -y

zenity --notification --window-icon="info" --text="Configurando ssh y agregando ejecuciones"

sudo nano /etc/ssh/sshd_config

zenity --info --width=300 --height=300 --text="
#agrega las siguientes lineas sin el "#"
58 21 * * * ~/script/time.sh
00 22 * * * ~/script/shutdown.sh
"

crontab -e

cp -rf script ~/ && rm -rf script
cp -f Readme ~/script && rm -rf Readme
cp -f install.sh ~/script && rm -rf install.sh

zenity --info \
--text="Ahora puede reiniciar su equipo"
