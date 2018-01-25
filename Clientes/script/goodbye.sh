#!/bin/bash

# minuto(0-59) hora(0-23) dia(1-31) mes(1-12) dia_de_la_semana(0=domingo) 

#crontab -e

#50 21 * * * ~/script/goodbye.sh

export DISPLAY=:0

zenity --warning \
--text="ingresa tu mensaje aquí,<b>letras en negritas</b> "



