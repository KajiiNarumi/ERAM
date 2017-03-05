#!/bin/bash
############################################################################
#    Kajii Narumi kajiikana69@gmail.com
#    Gabriel Gottesman gottesman007@gmail.com
#    Copyright (C) 2016 ERAM
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
##############################################################################
#                          ./+o+-       
#                  yyyyy- -yyyyyy+      
#               ://+//////-yyyyyyo      
#           .++ .:/++++++/-.+sss/`      
#         .:++o:  /++++++++/:--:/-      
#        o:+o+:++.`..```.-/oo+++++/     
#       .:+o:+o/.          `+sssoo+/    
#  .++/+:+oo+o:`             /sssooo.   
# /+++//+:`oo+o               /::--:.   OS: Ubuntu 16.04 xenial
# \+/+o+++`o++o               ++////.   
#  .++.o+++oo+:`             /dddhhh.   
#       .+.o+oo:.          `oddhhhh+    
#        \+.++o+o``-````.:ohdhhhhh+     
#         `:o+++ `ohhhhhhhhyo++os:      
#           .o:`.syhhhhhhh/.oo++o`      
#               /osyyyyyyo++ooo+++/     
#                   ````` +oo+++o\:    
#                          `oo++.  
##############################################################################
#asegurese de instalar los siguientes programas
#sudo apt-get install zenity ssh nmap expect wakeonlan -y
##############################################################################
#Para saber las mac de los equipos utilice el siguiente comando
# sudo nmap -sP 192.168.1.1-254
##############################################################################
#Llene los siguientes campos 
#contraseña de ingreso al script
PASWD=""
#Nombre del Negocio o Escuela
NAME=""
#Puerto ssh
PORT=""
#Explorador de archivos
ARCH=""
#Establesca el precio por minuto
COST=""
#establesca informacion de los equipos
MAC=(0 "" "" "" "" "" "")
IP=(0 "" "" "" "" "" "")
USA=(0 "" "" "" "" "" "")
PSA=(0 "" "" "" "" "" "")
##############################################################################
# si deseas quitar la contrasela elimine las siguientes 7 lineas
ACC1="Introdusca su contraseña:"
ACC=$(zenity --title="Bienvenido" --width=200 --height=100 --entry --hide-text --text "$ACC1")
if [ $ACC = ${PASWD} ]
 then zenity --info --width=200 --height=100 --text="Que gusto verte de vuelta (^_^)"
 else zenity --error --width=250 --height=150 --text="la contraseña $ACC es incorrecta"
exit
fi
##############################################################################
#comandos enviados para controlar equipos remotos
#Numero de equipos (el script esta programado unicamente a 10 equipos)
EQP=(0 "1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
#Desbloquear Equipos
ULK="sh ~/unlock.sh"
#Bloquear Equipos
LK="sh ~/lock.sh"
#Apagar Equipos
PO="sudo -S shutdown -h now"
#Reiniciar Equipos
RB="sudo -S shutdown -r now"
#Actualizar Equipos
UG="sudo -S apt-get update && sudo -S apt-get dist-upgrade -y"
#Limpiar Clientes
ER="rm -rf ~/Descargas/* && rm -rf ~/Documentos/* && rm -rf ~/Escritorio/* && rm -rf ~/Imágenes/* && rm -rf ~/Música/* && rm -rf ~/Vídeos/* && rm -rf ~/.local/share/Trash/* "
##############################################################################
#comprobando y creando la carpeta Reporte
if [ -d ~/Reporte ]
then 
echo "Comprobando carpeta Reporte"
else
mkdir ~/Reporte
fi
###############################################################################
#inicio del scripit 
opcion=`/usr/bin/zenity --title="$NAME" --width=200 --height=400 \
                         --text="Selecciona una Acción" \
                         --list --column="Acción" \
                         --list "Desbloquear Equipos" "Consumido" "Bloquear Equipos" "Ultimos" "Encender" "Apagar" "Reiniciar" "Cerrar Sesion" "Enviar Archivos" "Actualizar Clientes" "Limpiar Clientes" `
if [ $? -eq 0 ]
then
        IFS="|"
        for opcion in $opcion
        do
        if [ "$opcion" = "Desbloquear Equipos" ];
        then 
# INICIO DEL SCRIPT desbloquear
opcion=`/usr/bin/zenity --title="Liberando" --width=50 --height=500 \
                         --text="Selecciona un Equipo" \
                         --list --column="Seleccionar" --column="Equipo" \
                         --checklist FALSE "1" FALSE "2" FALSE "3" FALSE "4" FALSE "5" FALSE "6" FALSE "7" FALSE "8" FALSE "9" FALSE "10" `
if [ $? -eq 0 ]
then
        IFS="|"
        for opcion in $opcion
        do
echo start ${USA[opcion]} >> historial
date +%D_%H:%M:%S_%s >> historial
date +%s > ~/Reporte/tem1${USA[opcion]}

#ULK="sh ~/unlock.sh"
expect -c "
spawn ssh -X -o StrictHostKeyChecking=no -p ${PORT} ${USA[opcion]}@${IP[opcion]} echo ${PSA[opcion]} | $ULK
match_max 100000
expect \"*?assword:*\"
send \"${PSA[opcion]}\r\"
send \"\r\"
expect eof
"
        done
./ERAM.sh
else
/usr/bin/zenity --info --text="<b>Terminado!</b> Para mayor información ,  \nvisita <b>http://kajiinarumi.webutu.com/</b> o contactame en Telegram <b>https://telegram.me/kajiinarumi/</b>"
fi
exit
# FIN DEL SCRIPT desbloquear
        elif [ "$opcion" = "Consumido" ]
                     then
# INICIO DEL SCRIPT Consumido
opcion=`/usr/bin/zenity --title="Consumido" --width=50 --height=500 \
                         --text="Selecciona un Equipo" \
                         --list  --column="Equipo" \
                         --list "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" `
if [ $? -eq 0 ]
then
        IFS="|"
        for opcion in $opcion
        do

date +%s >  ~/Reporte/tem2${USA[opcion]}
TEM1=$(cat ~/Reporte/tem1${USA[opcion]})
TEM2=$(cat ~/Reporte/tem2${USA[opcion]})
TIM3=$(echo $TEM2/60 - $TEM1/60 | bc)
COS=$(echo $TIM3 \* $COST | bc)

zenity --info \
--text="el tiempo consumido es ${TIM3} minutos
....$ ${COS} pesos"
  EOH
        done
./ERAM.sh
else
/usr/bin/zenity --info --text="<b>Terminado!</b> Para mayor información ,  \nvisita <b>http://kajiinarumi.webutu.com/</b> o contactame en Telegram <b>https://telegram.me/kajiinarumi/</b>"
fi
exit
# FIN DEL SCRIPT Consumido
        elif [ "$opcion" = "Bloquear Equipos" ]
                     then
# INICIO DEL SCRIPT Bloquear
opcion=`/usr/bin/zenity --title="Bloqueando" --width=50 --height=500 \
                         --text="Selecciona un Equipo" \
                         --list --column="Seleccionar" --column="Equipo" \
                         --checklist FALSE "1" FALSE "2" FALSE "3" FALSE "4" FALSE "5" FALSE "6" FALSE "7" FALSE "8" FALSE "9" FALSE "10" `
if [ $? -eq 0 ]
then
        IFS="|"
        for opcion in $opcion
        do
echo stop ${USA[opcion]} >> historial
date +%D_%H:%M:%S_%s >> historial
date +%s >  ~/Reporte/tem2${USA[opcion]}
TEM1=$(cat ~/Reporte/tem1${USA[opcion]})
TEM2=$(cat ~/Reporte/tem2${USA[opcion]})
TIM3=$(echo $TEM2/60 - $TEM1/60 | bc)
COS=$(echo $TIM3 \* $COST | bc)

zenity --info \
--text="el tiempo fue ${TIM3} minutos
....$ ${COS} pesos"
  EOH

expect -c "
set timeout -1
spawn ssh -o StrictHostKeyChecking=no -p ${PORT} ${USA[opcion]}@${IP[opcion]} echo ${PSA[opcion]} | $LK
match_max 100000
expect \"*?assword:*\"
send \"${PSA[opcion]}\r\"
send \"\r\"
expect eof
"
        done
./ERAM.sh
else
/usr/bin/zenity --info --text="<b>Terminado!</b> Para mayor información ,  \nvisita <b>http://kajiinarumi.webutu.com/</b> o contactame en Telegram <b>https://telegram.me/kajiinarumi/</b>"
fi
exit
# FIN DEL SCRIPT bloquear
        elif [ "$opcion" = "Ultimos" ]
                     then
# INICIO DEL SCRIPT ultimos
opcion=`/usr/bin/zenity --title="Ultimos" --width=50 --height=500 \
                         --text="Selecciona un Equipo" \
                         --list  --column="Equipo" \
                         --list "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" `
if [ $? -eq 0 ]
then
        IFS="|"
        for opcion in $opcion
        do

TEM1=$(cat ~/Reporte/tem1${USA[opcion]})
TEM2=$(cat ~/Reporte/tem2${USA[opcion]})
TIM3=$(echo $TEM2/60 - $TEM1/60 | bc)
COS=$(echo $TIM3 \* $COST | bc)

zenity --info \
--text="el tiempo consumido es ${TIM3} minutos
....$ ${COS} pesos"
  EOH
        done
./ERAM.sh
else
/usr/bin/zenity --info --text="<b>Terminado!</b> Para mayor información ,  \nvisita <b>http://kajiinarumi.webutu.com/</b> o contactame en Telegram <b>https://telegram.me/kajiinarumi/</b>"
fi
exit
# FIN DEL SCRIPT ultimos
        elif [ "$opcion" = "Encender" ]
                     then
# INICIO DEL SCRIPT Encender Equipos
opcion=`/usr/bin/zenity --title="Encendiendo" --width=350 --height=500 \
                         --text="Selecciona un Equipo" \
                         --list --column="Seleccionar" --column="Equipo" \
                         --checklist FALSE "1" FALSE "2" FALSE "3" FALSE "4" FALSE "5" FALSE "6" FALSE "7" FALSE "8" FALSE "9" FALSE "10" `
if [ $? -eq 0 ]
then
        IFS="|"
        for opcion in $opcion
        do
wakeonlan ${MAC[opcion]}
        done
./ERAM.sh
else
/usr/bin/zenity --info --text="<b>Terminado!</b> Para mayor información ,  \nvisita <b>http://kajiinarumi.webutu.com/</b> o contactame en Telegram <b>https://telegram.me/kajiinarumi/</b>"
fi
exit
#FIN DEL SCRIPT Encender Equipos
        elif [ "$opcion" = "Apagar" ]
                     then
# INICIO DEL SCRIPT Apagar equipos
opcion=`/usr/bin/zenity --title="Apagandando" --width=350 --height=500 \
                         --text="Selecciona un Equipo" \
                         --list --column="Seleccionar" --column="equipo" \
                         --checklist FALSE "1" FALSE "2" FALSE "3" FALSE "4" FALSE "5" FALSE "6" FALSE "7" FALSE "8" FALSE "9" FALSE "10" `
if [ $? -eq 0 ]
then
        IFS="|"
        for opcion in $opcion
        do
expect -c "
set timeout -1
spawn ssh -o StrictHostKeyChecking=no -p ${PORT} ${USA[opcion]}@${IP[opcion]} echo ${PSA[opcion]} | $PO
match_max 100000
expect \"*?assword:*\"
send \"${PSA[opcion]}\r\"
send \"\r\"
expect eof
"
        done
./ERAM.sh
else
/usr/bin/zenity --info --text="<b>Terminado!</b> Para mayor información ,  \nvisita <b>http://kajiinarumi.webutu.com/</b> o contactame en Telegram <b>https://telegram.me/kajiinarumi/</b>"
fi
exit
#FIN DEL SCRIPT Apagar equipos
        elif [ "$opcion" = "Reiniciar" ]
                     then
# INICIO DEL SCRIPT Reiniciar Equipos
opcion=`/usr/bin/zenity --title="Reinicio" --width=350 --height=500 \
                         --text="Selecciona un Equipo" \
                         --list --column="Seleccionar" --column="equipo" \
                         --checklist FALSE "1" FALSE "2" FALSE "3" FALSE "4" FALSE "5" FALSE "6" FALSE "7" FALSE "8" FALSE "9" FALSE "10" `
if [ $? -eq 0 ]
then
        IFS="|"
        for opcion in $opcion
        do
expect -c "
set timeout -1
spawn ssh -o StrictHostKeyChecking=no -p ${PORT} ${USA[opcion]}@${IP[opcion]} echo ${PSA[opcion]} | $RB
match_max 100000
expect \"*?assword:*\"
send \"${PSA[opcion]}\r\"
send \"\r\"
expect eof
"
        done
./ERAM.sh
else
/usr/bin/zenity --info --text="<b>Terminado!</b> Para mayor información ,  \nvisita <b>http://kajiinarumi.webutu.com/</b> o contactame en Telegram <b>https://telegram.me/kajiinarumi/</b>"
fi
exit
#FIN DEL SCRIPT Reiniciar Equipos
        elif [ "$opcion" = "Cerrar Sesion" ]
                     then
# INICIO DEL SCRIPT Encender Equipos
opcion=`/usr/bin/zenity --title="Cerrando" --width=350 --height=500 \
                         --text="Selecciona un Equipo" \
                         --list --column="Seleccionar" --column="Equipo" \
                         --checklist FALSE "1" FALSE "2" FALSE "3" FALSE "4" FALSE "5" FALSE "6" FALSE "7" FALSE "8" FALSE "9" FALSE "10" `
if [ $? -eq 0 ]
then
        IFS="|"
        for opcion in $opcion
        do
expect -c "
set timeout -1
spawn ssh -o StrictHostKeyChecking=no -p ${PORT} ${USA[opcion]}@${IP[opcion]} echo ${PSA[opcion]} | killall -u ${USA[opcion]}
match_max 100000
expect \"*?assword:*\"
send \"${PSA[opcion]}\r\"
send \"\r\"
expect eof
"
        done
./ERAM.sh
else
/usr/bin/zenity --info --text="<b>Terminado!</b> Para mayor información ,  \nvisita <b>http://kajiinarumi.webutu.com/</b> o contactame en Telegram <b>https://telegram.me/kajiinarumi/</b>"
fi
exit
#FIN DEL SCRIPT Encender Equipos
        elif [ "$opcion" = "Enviar Archivos" ]
                     then
# INICIO DEL SCRIPT Enviar Archivos Admin

opcion=`/usr/bin/zenity --title="Envio de Archivos" --width=350 --height=500 \
                         --text="Selecciona el Equipo a Enviar" \
                         --list --column="Seleccionar" --column="Equipo" \
                         --checklist FALSE "1" FALSE "2" FALSE "3" FALSE "4" FALSE "5" FALSE "6" FALSE "7" FALSE "8" FALSE "9" FALSE "10" `
if [ $? -eq 0 ]
then
        IFS="|"
        for opcion in $opcion
        do
${ARCH} sftp://${USA[opcion]}@${IP[opcion]}:${PORT}/home/${USA[opcion]}/Escritorio
        done
./ERAM.sh
else
/usr/bin/zenity --info --text="<b>Terminado!</b> Para mayor información ,  \nvisita <b>http://kajiinarumi.webutu.com/</b> o contactame en Telegram <b>https://telegram.me/kajiinarumi/</b>"
fi
exit
#FIN DEL SCRIPT Enviar Archivos Admin

        elif [ "$opcion" = "Actualizar Clientes" ]
                     then
# INICIO DEL SCRIPT Actualizar Equipos

opcion=`/usr/bin/zenity --title="Actualizando" --width=350 --height=500 \
                         --text="Selecciona el Equipo" \
                         --list --column="Seleccionar" --column="Equipo" \
                         --checklist FALSE "1" FALSE "2" FALSE "3" FALSE "4" FALSE "5" FALSE "6" FALSE "7" FALSE "8" FALSE "9" FALSE "10" `
if [ $? -eq 0 ]
then
        IFS="|"
        for opcion in $opcion
        do
xterm -e expect -c "
set timeout -1
spawn ssh -o StrictHostKeyChecking=no -p ${PORT} ${USA[opcion]}@${IP[opcion]} echo ${PSA[opcion]} | $UG
match_max 100000
expect \"*?assword:*\"
send \"${PSA[opcion]}\r\"
send \"\r\"
expect eof
"
        done
./ERAM.sh
else
/usr/bin/zenity --info --text="<b>Terminado!</b> Para mayor información ,  \nvisita <b>http://kajiinarumi.webutu.com/</b> o contactame en Telegram <b>https://telegram.me/kajiinarumi/</b>"
fi
exit
#FIN DEL SCRIPT Actualizar Equipos
        elif [ "$opcion" = "Limpiar Clientes" ]
                     then
# INICIO DEL SCRIPT Limpiar Clientes

opcion=`/usr/bin/zenity --title="Limpiando" --width=350 --height=500 \
                         --text="Limpia un Equipo" \
                         --list --column="Seleccionar" --column="equipo" \
                         --checklist FALSE "1" FALSE "2" FALSE "3" FALSE "4" FALSE "5" FALSE "6" FALSE "7" FALSE "8" FALSE "9" FALSE "10" `
if [ $? -eq 0 ]
then
        IFS="|"
        for opcion in $opcion
        do
expect -c "
set timeout -1
spawn ssh -o StrictHostKeyChecking=no -p ${PORT} ${USA[opcion]}@${IP[opcion]} echo ${PSA[opcion]} | $ER
match_max 100000
expect \"*?assword:*\"
send \"${PSA[opcion]}\r\"
send \"\r\"
expect eof
"
        done
./ERAM.sh
else
/usr/bin/zenity --info --text="<b>Terminado!</b> Para mayor información ,  \nvisita <b>http://kajiinarumi.webutu.com/</b> o contactame en Telegram <b>https://telegram.me/kajiinarumi/</b>"
fi
exit
#FIN DEL SCRIPT Limpiar Clientes
        fi
        done
#salir<
zenity --question \
--text="¿Desea salir?"
if [ $? -eq 1 ]
then
./ERAM.sh
else
zenity --info \
--text="<b>Terminado!</b> Para mayor información ,  \nvisita <b>http://kajiinarumi.webutu.com/</b> o contactame en Telegram <b>https://telegram.me/kajiinarumi/</b>"
exit
fi
#salir >
else
/usr/bin/zenity --info --text="<b>Terminado!</b> Para mayor información ,  \nvisita <b>http://kajiinarumi.webutu.com/</b> o contactame en Telegram <b>https://telegram.me/kajiinarumi/</b>"
fi
exit
