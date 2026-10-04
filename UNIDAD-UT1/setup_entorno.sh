#!/bin/bash
# setup_entorno.sh
# Prepara el entorno de la prueba de evaluación inicial de Bash (2CFSG).
# Ejecutar en CADA máquina antes de empezar la prueba (como el usuario del alumno).
# Uso: bash setup_entorno.sh

set -e



BASE="$HOME/prueba_bash"



echo "Preparando entorno en $BASE ..."

rm -rf "$BASE"

mkdir -p "$BASE/datos"

cd "$BASE"



# --- sistema.log: usado en Bloque 2 (grep/redirección) y Bloque 1 (copia) ---

cat > sistema.log << 'EOF'

2026-09-10 08:01:03 INFO Servicio iniciado correctamente

2026-09-10 08:02:15 INFO Usuario admin ha iniciado sesión

2026-09-10 08:05:44 WARNING Uso de memoria elevado (78%)

2026-09-10 08:07:12 ERROR No se pudo conectar con la base de datos

2026-09-10 08:07:20 ERROR Timeout al conectar con la base de datos

2026-09-10 08:10:01 INFO Reintentando conexión

2026-09-10 08:10:05 INFO Conexión restablecida

2026-09-10 08:15:33 WARNING Espacio en disco por debajo del 15%

2026-09-10 08:20:10 INFO Copia de seguridad completada

2026-09-10 08:25:47 ERROR Fallo al escribir en /var/log/app.log

2026-09-10 08:30:02 INFO Usuario admin ha cerrado sesión

2026-09-10 08:35:19 INFO Servicio de red reiniciado

2026-09-10 08:40:56 WARNING Certificado SSL caduca en 10 días

2026-09-10 08:45:11 INFO Usuario operador ha iniciado sesión

2026-09-10 08:50:38 ERROR Permiso denegado al acceder a /etc/config

2026-09-10 08:55:04 INFO Tarea programada ejecutada correctamente

2026-09-10 09:00:00 INFO Servicio detenido para mantenimiento

EOF

# 4 líneas ERROR -> coincide con la solución del Bloque 2



# --- plantilla.sh: usado en Bloque 3 (permisos). Se crea SIN permiso de ejecución ---

cat > plantilla.sh << 'EOF'

#!/bin/bash

echo "Informe generado el: $(date)"

echo "Espacio en disco:"

df -h .

EOF

chmod 644 plantilla.sh # a propósito: sin permiso de ejecución



# --- datos/: usado en Bloque 6 (bucle + tamaño) y Bloque 7 (buscar .log y contar ERROR) ---

echo "Cliente: Ana Ruiz

Cliente: Pere Gil

Cliente: Marc Soler" > datos/clientes.txt



echo "producto,cantidad,precio

teclado,10,15.50

raton,25,8.20

monitor,4,120.00" > datos/ventas.csv



echo "Recordar revisar backups el viernes." > datos/notas.txt



cat > datos/app1.log << 'EOF'

2026-09-11 10:00:01 INFO arranque

2026-09-11 10:02:14 ERROR fallo de conexión

2026-09-11 10:05:33 INFO reintento correcto

2026-09-11 10:08:47 ERROR timeout base de datos

EOF



cat > datos/app2.log << 'EOF'

2026-09-11 11:00:01 INFO arranque

2026-09-11 11:01:09 WARNING memoria alta

2026-09-11 11:03:22 ERROR disco lleno

2026-09-11 11:05:40 INFO tarea completada

2026-09-11 11:07:58 ERROR permiso denegado

2026-09-11 11:09:12 ERROR permiso denegado

EOF



echo "Entorno listo en $BASE"

echo "Contenido:"

find "$BASE" -maxdepth 2 | sort 

