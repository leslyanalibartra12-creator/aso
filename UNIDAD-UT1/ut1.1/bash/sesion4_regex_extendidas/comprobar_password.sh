#Ejercicio 4: Política de contraseñas
#!/bin/bash
if [[ $# -eq 0 ]]; then
  echo "Uso: $0 '<contraseña>'"
  exit 1
fi

password=$1
diccionario=/usr/share/dict/spanish
segura=true

resultado() {
  if [[ $2 -eq 0 ]]; then
    echo " $1: sí"
  else
    echo " $1: no"
    segura=false
  fi
}

re='^.{12,}$'
[[ $password =~ $re ]]
resultado "Tiene al menos 12 caracteres" $?

re='[[:digit:]]'
[[ $password =~ $re ]]
resultado "Contiene algún dígito" $?

re='[[:upper:]]'
[[ $password =~ $re ]]
resultado "Contiene alguna mayúscula" $?

re='[^[:alnum:]]'
[[ $password =~ $re ]]
resultado "Contiene algún símbolo" $?

if grep -qixF -- "$password" "$diccionario" 2>/dev/null; then
  resultado "No es una palabra del diccionario" 1
else
  resultado "No es una palabra del diccionario" 0
fi

if $segura; then
  echo "La contraseña es segura"
else
  echo "La contraseña no es segura"
fi

# Pregunta: ¿Caminas2026! es realmente una contraseña segura?
# Cumple las cinco condiciones, pero no me parece una contraseñarealmente segura. Se basa
# en una palabra conocida (el nombre del centro) más el año y un símbolo al
# final, que son datos o simbolos muy predecibles y simples. Existen programas o algoritmos que pueden descubrirlo en pocos segundos. Una contraseña más segura sería una frase larga y aleatoria,
# distinta en cada servicio, junto con autenticación multifactor.