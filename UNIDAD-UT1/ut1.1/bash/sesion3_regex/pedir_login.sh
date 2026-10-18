#Ejercicio 4. Nombre de usuario válido
while true; do
  read -p "Nombre de usuario: " login
  if [[ $login =~ ^[a-z][a-z0-9]*$ ]]; then
    break
  fi
  echo "No es válido. Debe empezar por minúscula y tener solo minúsculas o dígitos."
done

if grep -q "^$login:" /etc/passwd; then
  echo "El usuario $login ya existe."
else
  echo "Para crearlo: sudo useradd -m -s /bin/bash $login"
fi

# Pregunta: PASS_MAX_DAYS
# PASS_MAX_DAYS es el número máximo de días que una contraseña puede ser usada y no
# antes de obligar a cambiarla. Si se pone a 99999, la contraseña no
# caduca nunca. No parece seguro, porque si se filtra una contraseña
# puede usarse indefinidamente. Sería mejor fijar o establecer un tiempo de caducidad
# (por ejemplo 90 días) y combinarlo con el uso de contraseñas robustas.
# Mencionar que trabajo con un so de MacOS, por lo que no existe el fichero /etc/login.defs. 
# Asimismo, en macOS la caducidad de contraseñas se gestiona
# con pwpolicy, y por defecto las cuentas locales no tienen caducidad, por lo que tiene el mismo riesgo que en Linux.
