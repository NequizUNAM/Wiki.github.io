
-- mysql.exe -u root -p
-- mysql -u root -p


-- Example
-- mysql.exe -u USR_NEQUIZ -p
-- mysql.exe -h 192.168.1.100 -u usuario_remoto -p

-- ================================================
-- mysql.exe -h 10.2.147.110 -u USR_NEQUIZ -p


-- ================================================
Paso 2: Usar el comando mysqldump
El comando mysqldump es el que se utiliza para exportar bases de datos MySQL. Aquí tienes la estructura básica del comando:


mysqldump -u [nombre_usuario] -p [nombre_base_datos] > [archivo_destino].sql
[nombre_usuario]: Es el nombre de usuario de MySQL.
[nombre_base_datos]: Es el nombre de la base de datos que deseas exportar.
[archivo_destino].sql: Es el nombre que le darás al archivo SQL de salida donde se guardará la exportación.
Ejemplo práctico
Supongamos que tienes una base de datos llamada mi_base_datos y el usuario de MySQL es root. Para exportarla a un archivo llamado backup.sql, el comando sería algo así:

bash
Copiar código
mysqldump -u root -p mi_base_datos > backup.sql
Al ejecutar este comando, se te pedirá que ingreses la contraseña del usuario de MySQL (root en este caso). Una vez que ingreses la contraseña y presiones Enter, el comando mysqldump generará un archivo backup.sql que contendrá todos los comandos SQL necesarios para recrear la base de datos y todos sus datos.

Consideraciones adicionales
Si el servidor MySQL no está instalado localmente o si estás accediendo a un servidor remoto, asegúrate de tener acceso adecuado y los permisos necesarios para realizar la exportación.
El archivo backup.sql que se genera contendrá todas las sentencias SQL necesarias para crear las tablas, índices, y datos de la base de datos. Puedes usar este archivo para importar la base de datos en otro servidor o para respaldar tus datos.