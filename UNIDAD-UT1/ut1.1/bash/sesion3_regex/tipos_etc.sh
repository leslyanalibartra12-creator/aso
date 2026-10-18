#Ejercicio 2. Tipos de fichero en /etc
conf=0
bak=0

echo "Ficheros de configuración:"

for fichero in /etc/*; do
  if [[ $fichero =~ \.conf$ ]]; then
    echo "  $fichero"
    ((conf++))
  elif [[ $fichero =~ (\.bak|~)$ ]]; then
    ((bak++))
  fi
done

echo "---"
echo "Configuración: $conf"
echo "Copias de seguridad: $bak"