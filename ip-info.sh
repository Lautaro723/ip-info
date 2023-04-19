#!/bin/bash
#creditos del creador laitaro ruiz

clear 
PWD=$(pwd)
source $PWD/colores.sh
trap ctrl_c INT
ctrl_c(){
clear
echo "
  █████████████████████████████████████████
  █▄─▄█▄─▄▄─█▀▀▀▀▀██▄─▄█▄─▀█▄─▄█▄─▄▄─█─▄▄─█
  ██─███─▄▄▄█████████─███─█▄▀─███─▄███─██─█
  ▀▄▄▄▀▄▄▄▀▀▀▀▀▀▀▀▀▀▄▄▄▀▄▄▄▀▀▄▄▀▄▄▄▀▀▀▄▄▄▄▀
  "
exit
}

echo -e "$cyan
  █████████████████████████████████████████
  █▄─▄█▄─▄▄─█▀▀▀▀▀██▄─▄█▄─▀█▄─▄█▄─▄▄─█─▄▄─█
  ██─███─▄▄▄█████████─███─█▄▀─███─▄███─██─█
  ▀▄▄▄▀▄▄▄▀▀▀▀▀▀▀▀▀▀▄▄▄▀▄▄▄▀▀▄▄▀▄▄▄▀▀▀▄▄▄▄▀

$verde┌═══════════════════════════┐
┃ ${azul}Ingresa una dirección IP${verde}  ┃
└═══════════════════════════┘"
read -p $'\e[0;32m └══> \e[0;34m' ip
if [ -z "$ip" ]; then
    echo "No has ingresado una dirección IP."
else
    echo -e "${amarillo}[$rojo©${amarillo}]$azul Analizando IP:${cyan} $ip"
    response=$(curl -s "https://ipapi.co/$ip/json/")
    if [ -z "$response" ]; then
       sleep 1.3
      clear 
echo -e "
$verde┌═════════════════════════════════════════════════════┐
┃ ${azul}  no hay acceeso a internet  o la ip es incorrecta${verde}  ┃
└═════════════════════════════════════════════════════┘"
    else
        country=$(echo $response | jq -r '.country_name')
        region=$(echo $response | jq -r '.region')
        city=$(echo $response | jq -r '.city')
        latitude=$(echo $response | jq -r '.latitude')
        longitude=$(echo $response | jq -r '.longitude')
        postal=$(echo $response | jq -r '.postal')
clear
        echo -e "
$verde┌══════════════════════════════════════════════┐
$verde┃${azul} Datos obtenidos dirección IP${cyan} $ip ${verde} ┃
$verde└══════════════════════════════════════════════┘
$verde ┃
$verde └══>$azul pais:$cyan $country
$verde ┃
$verde └══>$azul region:$cyan $region
$verde ┃
$verde └══>$azul cyudad:$cyan $city
$verde ┃
$verde └══>$azul codigo postal: $cyan $postal
$verde ┃
$verde └══>$azul Latitud:$cyan $longitude
$verde ┃
$verde └══>$azul Longitud:$cyan $longitude
"
    fi
fi
