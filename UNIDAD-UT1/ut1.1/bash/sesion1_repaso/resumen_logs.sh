#!/bin/bash
# Ejercicio C1: resumen_logs.sh

CARPETA=$1

# Validar que se ha ingresado una carpeta como argumento
if [ -z "$CARPETA" ]; then
    echo "Uso: $0 <ruta_carpeta>"
    exit 1
fi

# Recorrer los ficheros .log del directorio indicado
for archivo in "$CARPETA"/*.log; do
    # Verificar que existen archivos con esa extensión
    if [ -f "$archivo" ]; then
        NOMBRE=$(basename "$archivo")
        
        # Contar cuantas lineas contienen WARNING y ERROR
        WARNINGS=$(grep -c "WARNING" "$archivo")
        ERRORS=$(grep -c "ERROR" "$archivo")
        
        echo "$NOMBRE -> $WARNINGS WARNING, $ERRORS ERROR"
    fi
done
