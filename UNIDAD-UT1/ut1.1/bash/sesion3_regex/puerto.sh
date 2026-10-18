#Ejercicio 1. ¿Es un número de puerto?

if [[ $# -eq 0 ]]; then
  echo "Uso: $0 <puerto>"
  exit 1
fi

puerto=$1

# ¿son solo dígitos?
if [[ ! $puerto =~ ^[0-9]+$ ]]; then
  echo "$puerto no es un número"
# ¿está en el rango válido?
elif (( 10#$puerto < 1 || 10#$puerto > 65535 )); then
  echo "$puerto está fuera de rango (1-65535)"
else
  echo "$puerto es un puerto válido"
fi