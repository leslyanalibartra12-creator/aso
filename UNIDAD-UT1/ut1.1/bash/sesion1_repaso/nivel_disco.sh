#!/bin/bash
bytes_usados=$1
bytes_totales=$2

# Calcular el porcentaje mediante $(( ))
PORCENTAJE=$(( $bytes_usados * 100 / $bytes_totales ))

if [ $PORCENTAJE -lt 70 ]; then
    echo "OK"
elif [ $PORCENTAJE -ge 70 ] && [ $PORCENTAJE -le 89 ]; then
    echo "AVISO"
else
    echo "CRÍTICO"
fi
