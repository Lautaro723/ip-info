#!/bin/bash

PWD$(pwd)
source $PWD/colores.sh
clear
echo -e "$azul]$cyan>$verde iniciando actualizacion de paquetes"
apt update && apt  upgrade
echo -e "$azul]$cyan>$verde iniciando la instalacion de requisitos "
pkg install git
pkg install jq
echo -e "$azul]$cyan>$verde gracias por su espera $cyan<$azul["
clear

echo -e "$azul]$cyan>$verde formas de ejecutar la herramienta"
echo -e "$azul]${cyan}1>$verde bash ip-info.sh"
echo -e "$azul]${cyan}1>$verde ip + la ip que quieren obtener la imfo"

cp ip $PREFIX/bin
cp colores.sh $PREFIX/bin
