#Ejercicio 5. Configuración sin comentarios

fichero=${1:-/etc/login.defs}

# Si el fichero no existe: error y salida
if [[ ! -f $fichero ]]; then
  echo "Error: el fichero $fichero no existe." >&2
  exit 1
fi

total=0
utiles=0

while read -r linea || [[ -n $linea ]]; do
  ((total++))
  # Saltar comentarios que empiezan por # y líneas vacías
  if [[ -z $linea || $linea =~ ^# ]]; then
    continue
  fi
  echo "$linea"
  ((utiles++))
done < "$fichero"

echo "---"
echo "Líneas totales: $total"
echo "Líneas útiles: $utiles"
