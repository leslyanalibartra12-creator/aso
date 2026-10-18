#Ejercicio 3. Usuarios con shell bash
total=0

while read -r linea; do
  if [[ $linea =~ bash$ ]]; then
    echo "${linea%%:*}"
    ((total++))
  fi
done < /etc/passwd

echo "---"
echo "Usuarios con bash: $total"