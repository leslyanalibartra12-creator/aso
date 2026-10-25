#Ejercicio 2: Validar una dirección MAC

#!/bin/bash
if [[ $# -eq 0 ]]; then
  echo "Uso: $0 <mac>"
  exit 1
fi

mac=$1
re='^[0-9a-fA-F]{2}([:-][0-9a-fA-F]{2}){5}$'

if [[ $mac =~ $re ]]; then
  echo "$mac es una MAC válida"
else
  echo "$mac no es una MAC válida"
fi