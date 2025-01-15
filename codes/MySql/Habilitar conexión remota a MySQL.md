Habilitar conexión remota a MySQL
Muchos sitios web y aplicaciones empiezan alojando tanto su servidor web como su base de datos en un mismo host.

Con el tiempo, sin embargo, una configuración como esta puede presentar dificultades para escalar.

Una solución a este problema consiste en:

Configurar una base de datos con conexión remota.

De modo que tanto el servidor web, como la base de datos, crezcan a su propio ritmo en sus correspondientes host.

Un host hace referencia a una máquina física o virtual.

Uno de los problemas más comunes que tienen los usuarios es que:

Cuando intentan configurar una base de datos MySQL remota, su instancia de MySQL se encuentra configurada para escuchar únicamente conexiones a nivel local.

Pero es de esperarse, ya que:

Por defecto MySQL viene configurado para escuchar solo conexiones locales.

Veamos entonces cómo habilitar el acceso remoto a una base de datos MySQL.

Paso 1: Permitir a MySQL escuchar tráfico externo
A fin de habilitar un acceso remoto a MySQL es necesario que se habilite la escucha de direcciones IP externas.

Para activar esto, abre tu archivo mysqld.cnf:

sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
Allí debes ubicar la línea que empieza con la directiva bind-address.

Por defecto, el valor asignado es 127.0.0.1.

Esto significa que el servidor permitirá únicamente conexiones locales.

Tienes que cambiar esta directiva para que haga referencia a una dirección IP externa.

Con fines demostrativos, podemos usar wildcards (comodines) y permitir conexiones remotas en general, sin restringir a direcciones IP específicas.

Para esto asignamos el valor como *, ::, o 0.0.0.0:

lc-messages-dir = /usr/share/mysql
skip-external-locking
#
# Instead of skip-networking the default is now to listen only on
# localhost which is more compatible and is not less secure.
bind-address            = 0.0.0.0
Luego de cambiar esta línea, guarda y cierra el archivo.

Si editaste con nano, usa los comandos CTRL + X, Y, y luego ENTER.

Luego reinicia el servicio de MySQL para que los cambios realizados en mysqld.cnf tengan efecto:

sudo systemctl restart mysql
Paso 2: Permitir la conexión remota a un usuario de MySQL
Para esto, primero que todo debes conectarte a tu cliente de MySQL.

Para hacer ello, ejecuta el siguiente comando:

sudo mysql
Si tienes habilitada la autenticación por contraseña para tu usuario root, necesitarás usar en cambio el siguiente comando de MySQL:

mysql -u root -p
Alternativa 1: Actualizar un usuario existente
Si tienes un usuario de MySQL existente que quieres usar para conectarte a la base de datos de forma remota, necesitarás configurar dicho usuario para que pueda conectarse desde un servidor remoto en vez de localhost.

Para cambiar el host de un usuario, puedes usar el comando RENAME USER de MySQL.

Si el usuario que usarás para conectarte de forma remota se llama "pym", entonces usarás un comando como el siguiente:

RENAME USER 'pym'@'localhost' TO 'pym'@'ip_servidor_remoto';
En el comando anterior debes reemplazar ip_servidor_remoto por la ip del servidor remoto desde donde realizarás la conexión.

Alternativa 2 (recomendada): Crear un nuevo usuario
De manera alternativa, puedes crear un usuario nuevo, que podrá conectarse únicamente desde el host remoto.

Ello lo puedes hacer con el siguiente comando:

CREATE USER 'pym'@'ip_servidor_remoto' IDENTIFIED BY 'password';
Recuerda que:

Debes reemplazar "pym" por el nombre de usuario que quieres usar, y "password" por la contraseña que quieras asignarle.
Si reemplazas ip_servidor_remoto por %, el usuario admitirá conexiones remotas desde cualquier IP.
Luego debes asignar al nuevo usuario los privilegios apropiados según tus necesidades.

El siguiente ejemplo otorga al usuario privilegios globales para crear (CREATE), modificar (ALTER), y eliminar (DROP) bases de datos, tablas, y usuarios.
Así como permisos para hacer INSERT, UPDATE, y DELETE sobre cualquier tabla.
También le permite consultar datos con SELECT, crear claves foráneas con la palabra reservada REFERENCES, y realizar operaciones FLUSH (con el privilegio RELOAD).
Recuerda asignar sólo los permisos necesarios según tu caso en particular.

GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'pym'@'ip_servidor_remoto' WITH GRANT OPTION;
Luego de esto, es una buena práctica ejecutar el comando:

FLUSH PRIVILEGES;
Y finalmente puedes salir del cliente de MySQL ejecutando exit.

Paso 3: Habilitar el puerto de MySQL en el firewall
Por último, asumiendo que tienes un firewall configurado en tu servidor de base de datos, también necesitarás abrir el puerto 3306, que es el puerto con que trabaja MySQL por defecto.

Si planeas acceder al servidor de base de datos desde una máquina en particular, puedes otorgar el permiso de acceso de manera específica con el siguiente comando.

sudo ufw allow from remote_IP_address to any port 3306
Sólo debes reemplazar remote_IP_address con la dirección IP de la máquina desde la cuál planeas conectarte.

Con fines prácticos:

Si estás aprendiendo o experimentando con un entorno de prueba, también puedes permitir conexiones a tu servicio de MySQL desde cualquier dirección IP, usando el siguiente comando:

sudo ufw allow 3306
Paso 4: Verificar la conexión remota
Para verificar que la conexión remota ya funciona, prueba a conectarte desde otra máquina.

Puedes hacer ello con el siguiente comando, reemplazando database_server_ip por la IP de tu servidor de bases de datos.

mysql -u user -h database_server_ip -p
O bien puedes conectarte desde un programa con interfaz de usuario. Por ejemplo, usando Workbench, Sequel Pro o DataGrip.