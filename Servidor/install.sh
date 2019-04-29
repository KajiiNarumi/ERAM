#!/bin/bash

sudo apt-get update

sudo apt-get install zenity -y

zenity --notification --window-icon="info" --text="Actualizacion de repositorios"

sudo apt-get update

zenity --notification --window-icon="info" --text="Instalando aplicaciones"

sudo apt-get install ssh nmap expect wakeonlan system-config-printer-gnome network-manager-gnome -y

zenity --notification --window-icon="info" --text="Actualizando Sistema y limpiando"

sudo apt-get dist-upgrade -y

sudo apt autoremove -y

zenity --notification --window-icon="info" --text="Configurando ssh, moviendo archivos y agregando ejecuciones"

cp -rf ERAM ~/ && rm -rf ERAM
cp -f ERAM.sh ~/Escritorio && rm -rf ERAM.sh
cp -f install.sh ~/ERAM && rm -rf install.sh
cp -f Readme ~/ERAM && rm -rf Readme

sudo nano /etc/ssh/sshd_config

zenity --info \
--text="

utilice el siguiente comando para buscar los equipos conectados en su red y poder obtener la informacion de las mac

sudo nmap -sP x.x.x.x-x

establesca el rango de su ip

192.168.0.1-254

aqui escanea de la ip 192.168.0.1 a la 192.168.0.254

"
