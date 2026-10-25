#EJERCICIO 1: Formato de una dirección IP
#!/bin/bash

if [[ $# -eq 0 ]]; then
  echo "Uso: $0 <ip>"
  exit 1
fi

ip=$1
re='^[0-9]{1,3}(\.[0-9]{1,3}){3}$'

if [[ $ip =~ $re ]]; then
  echo "$ip tiene formato de IP"
else
  echo "$ip no tiene formato de IP"
fi

#!/bin/bash
# validar_ip.sh
# Comprueba si el parámetro tiene formato de dirección IPv4.
# Uso: ./validar_ip.sh <ip>

if [[ $# -eq 0 ]]; then
  echo "Uso: $0 <ip>"
  exit 1
fi

ip=$1
re='^[0-9]{1,3}(\.[0-9]{1,3}){3}$'

if [[ $ip =~ $re ]]; then
  echo "$ip tiene formato de IP"
else
  echo "$ip no tiene formato de IP"
fi

# Pregunta: ¿qué responde el script con 999.999.999.999? ¿Es una IP válida?
# El script responde que tiene formato de IP, porque son cuatro números de
# 1 a 3 cifras separados por puntos, pero no es una IP válida. En este ejercicio la expresión regular solo comprueba
# el formato, no el valor. Para terminar de validar la IP del todo habría que comprobar
# cada octeto con una comparación numérica.