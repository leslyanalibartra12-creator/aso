#!/bin/bash
# Ejercicio B1: clasificar_entradas.sh

DIRECTORIO="$HOME/prueba_bash"

for entrada in "$DIRECTORIO"/*; do
    NOMBRE=$(basename "$entrada")
    
    if [ -d "$entrada" ]; then
        echo "$NOMBRE directorio"
    elif [ -f "$entrada" ]; then
        echo "$NOMBRE fichero"
    fi
done
