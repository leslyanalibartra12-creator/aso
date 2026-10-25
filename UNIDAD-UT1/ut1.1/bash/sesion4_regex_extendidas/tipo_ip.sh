#Ejercicio 5: Tipo de dirección IP
#!/bin/bash

if [[ $# -eq 0 ]]; then
  echo "Uso: $0 <ip>"
  exit 1
fi

ip=$1
re_loopback='^127\.'
re_privada='^(10\.|192\.168\.|172\.(1[6-9]|2[0-9]|3[01])\.)'

if [[ $ip =~ $re_loopback ]]; then
  echo "$ip es una dirección loopback"
elif [[ $ip =~ $re_privada ]]; then
  echo "$ip es una dirección privada"
else
  echo "$ip es una dirección pública"
fi

# Pregunta: el rango de 172.16 a 172.31 no se puede escribir con una sola
# clase. ¿Cómo lo has resuelto?
# Lo he dividido en tres alternativas con el uso de "|" dentro de un grupo:
# 1[6-9], el cual cubre del 16 al 19, 2[0-9] que cubre del 20 al 29 y 3[01] que cubre el 30
# y el 31. Así, el segundo octeto solo coincide si está entre 16 y 31,
# y 172.32.x.x queda fuera de los rangos definidos.