Cómo permitir conexiones remotas en MySQL Server


6 minutos de lectura
De forma predeterminada, el servidor MySQL está a la escucha de conexiones sólo desde localhost, lo que significa que se puede acceder sólo por las aplicaciones que se ejecutan en el mismo host.

Sin embargo, en algunas situaciones, es necesario acceder al servidor MySQL desde una ubicación remota. Por ejemplo, cuando se desea conectar al servidor MySQL remoto de su sistema local, o cuando se utiliza un multi-implementación del servidor donde se ejecuta la aplicación en una máquina distinta a la de la base de datos del servidor. Sería una opción para acceder al servidor MySQL a través de un Túnel SSH y el otro es para configurar el servidor de MySQL para aceptar conexiones remotas.

En esta guía, vamos a ir a través de los pasos necesarios para permitir conexiones remotas a un servidor MySQL. Las mismas instrucciones se aplican para MariaDB.

Tabla de contenidos [Ocultar] [Ocultar]

La Configuración Del Servidor MySQL
El primer paso es configurar el servidor MySQL para escuchar en una dirección IP específica o todas las direcciones IP en la máquina.

Si el servidor MySQL y los clientes pueden comunicarse el uno con el otro a través de una red privada, entonces la mejor opción es configurar el servidor MySQL para escuchar sólo la IP privada. De lo contrario, si desea conectarse al servidor a través de una red pública de configurar el servidor MySQL para escuchar en todas las direcciones IP en la máquina.

Para ello, es necesario editar el archivo de configuración de MySQL y agregar o cambiar el valor de la bind-address opción. Se puede establecer una única dirección IP y rangos de IP. Si la dirección es 0.0.0.0, MySQL, el servidor acepta conexiones en todos los host de interfaces IPv4. Si usted tiene IPv6 configuradas en su sistema, entonces en lugar de 0.0.0.0, uso ::.

La ubicación del archivo de configuración de MySQL difiere dependiendo de la distribución. En Ubuntu y Debian se encuentra en el archivo /etc/mysql/mysql.conf.d/mysqld.cnf, mientras que en distribuciones basadas en Red Hat como CentOS, el archivo se encuentra en /etc/my.cnf.

Abra el archivo con tu editor de texto:

sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
Busca la línea que comienza con bind-address y establezca su valor en la dirección en la que un servidor MySQL debe escuchar.

De forma predeterminada, el valor se establece a 127.0.0.1 (escucha sólo en localhost).

En este ejemplo, vamos a configurar el servidor MySQL para que escuche en todas las interfaces IPv4 cambiando el valor a 0.0.0.0

mysqld.cnf

bind-address           = 0.0.0.0
# skip-networking
Si hay una línea que contiene skip-networking, eliminar o comentario, es mediante la adición de # al principio de la línea.
En MySQL 8.0 y superior, la bind-address directiva no podrán estar presentes. En este caso, añade que en virtud de la [mysqld] de la sección.

Una vez hecho esto, reinicie el servicio de MySQL para que los cambios surtan efecto. Solo root o usuarios con sudo privilegios puede reiniciar los servicios.

Para reiniciar el servicio de MySQL en Debian o Ubuntu, escriba:

sudo systemctl restart mysql
En RedHat basados en distribuciones como CentOS para reiniciar el servicio:

sudo systemctl restart mysqld
Concesión de Acceso a un Usuario desde un equipo Remoto
El siguiente paso es permitir el acceso a la base de datos para el usuario remoto.

Inicie sesión en el servidor de MySQL como usuario root con el comando:

sudo mysql
Si usted está utilizando el viejo, nativo de MySQL para el complemento de autenticación para iniciar sesión como root, ejecute el comando siguiente y escriba la contraseña cuando se le solicite:

mysql -uroot -p
Desde el interior de la shell de MySQL, el uso de la CONCESIÓN de la declaración para el acceso a la subvención para el usuario remoto.

GRANT ALL ON database_name.* TO user_name@'ip_address' IDENTIFIED BY 'user_password';
Donde:

database_name es el nombre de la base de datos que el usuario se conecte a.
nombre_usuario es el nombre de od el usuario de MySQL.
dirección_ip es la dirección IP desde la que el usuario se conecte. Uso % para permitir al usuario conectarse desde cualquier dirección IP.
user_password es la contraseña de usuario.
Por ejemplo, para conceder el acceso a una base de datos de nombre de base de datos a un usuario llamado foo con contraseña my_passwd desde una máquina cliente con IP 10.8.0.5, tendría que ejecutar:

La Configuración De Firewall
El último paso es configurar el firewall para permitir el tráfico en el puerto 3306 (MySQL puerto por defecto) de las máquinas remotas.

Iptables
Si usted está usando iptables como el firewall, el comando de abajo le permiten el acceso desde cualquier dirección IP en Internet, en el puerto de MySQL. Esto es muy inseguro.

sudo iptables -A INPUT -p tcp --destination-port 3306 -j ACCEPT
Permitir el acceso desde una dirección IP específica:

sudo iptables -A INPUT -s 10.8.0.5 -p tcp --destination-port 3306 -j ACCEPT
UFW
UFW es el valor predeterminado herramienta firewall en Ubuntu. Para permitir el acceso desde cualquier dirección IP en Internet (muy inseguro) ejecutar:

sudo ufw allow 3306/tcp
Permitir el acceso desde una dirección IP específica:

sudo ufw allow from 10.8.0.5 to any port 3306
FirewallD
FirewallD es el cortafuegos por defecto de la herramienta de administración en CentOS. Para permitir el acceso desde cualquier dirección IP en Internet (muy inseguro) tipo:

sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
sudo firewall-cmd --reload
Para permitir el acceso desde una dirección IP específica en un puerto específico, puede crear una nueva FirewallD la zona o el uso de una rica regla. Bien crear una nueva zona llamada mysqlzone:

sudo firewall-cmd --new-zone=mysqlzone --permanent

sudo firewall-cmd --reload
sudo firewall-cmd --permanent --zone=mysqlzone --add-source=10.8.0.5/32

sudo firewall-cmd --permanent --zone=mysqlzone --add-port=3306/tcp
sudo firewall-cmd --reload
Verificando los Cambios
Para comprobar que el usuario remoto puede conectarse al servidor de MySQL, ejecute el siguiente comando:

mysql -u user_name -h mysql_server_ip -p
Donde nombredeusuario es el nombre de el usuario tiene acceso a y mysql_server_ip es la dirección IP del host en el servidor MySQL se ejecuta.

Si todo está configurado correctamente, usted será capaz de iniciar sesión en el servidor MySQL remoto.

Si obtiene un error como el de abajo, luego el puerto 3306 no está abierto, o el servidor MySQL no está escuchando en la dirección IP.

ERROR 2003 (HY000): Can't connect to MySQL server on '10.8.0.5' (111)"
El siguiente error se indica que el usuario está intentando iniciar sesión en no tienes permisos para acceso remoto servidor de MySQL.

"ERROR 1130 (HY000): Host ‘10.8.0.5’ is not allowed to connect to this MySQL server" 
Conclusión
MySQL, el más popular de código abierto servidor de base de datos por defecto, está a la escucha de conexiones entrantes sólo en localhost.

Para permitir conexiones remotas a un servidor MySQL, es necesario realizar los siguientes pasos:

Configurar el servidor de MySQL para escuchar en todas o en una interfaz específica.
El acceso a la subvención para el usuario remoto.
Abrir el puerto de MySQL en el servidor de seguridad.
Si usted tiene preguntas, siéntase libre de dejar un comentario más abajo.