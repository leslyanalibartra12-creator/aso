#Actividad 4

#!/bin/bash

pedir_puerto_valido() {
  while true; do
    read -p "Introduce un puerto TCP (1-65535): " puerto
    if [[ $puerto =~ ^[0-9]+$ ]] && (( puerto >= 1 && puerto <= 65535 )); then
      break
    fi
    echo "Puerto no válido, inténtalo de nuevo."
  done
}

pedir_puerto_valido
echo "Puerto válido recibido: $puerto"