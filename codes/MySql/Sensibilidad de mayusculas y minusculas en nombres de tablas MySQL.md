Sensibilidad de mayusculas y minusculas en nombres de tablas MySQL
Hace poco me encontré con un problema al pasar una base de datos de Windows a Linux, el problema fue que en Windows los nombres de las bases de datos y las tablas no son sensibles a mayúsculas y minúsculas, una posible solución seria manejar todo en minusculas para que no exista ese problema, pero sabemos que eso, sobre todo si se tiene un estandar de base de datos, no es una solución viable.

La solución es cambiar el valor a una variable de MySQL: lower_case_table_names. He aqui una explicación obtenida del manual de referencia de MySQL.

Valor	Significado
0	Los nombres de tablas y bases de datos se almacenan en disco usando el esquema de mayúsculas y minúsculas especificado en las sentencias CREATE TABLE o CREATE DATABASE. Las comparaciones de nombres son sensibles a mayúsculas. Esto es lo predeterminado en sistemas Unix. Nótese que si se fuerza un valor 0 con --lower-case-table-names=0 en un sistema de ficheros insensible a mayúsculas y se accede a tablas MyISAM empleando distintos esquemas de mayúsculas y minúsculas para el nombre, esto puede conducir a la corrupción de los índices.
1	Los nombres de tablas se almacenan en minúsculas en el disco y las comparaciones de nombre no son sensibles a mayúsculas. MySQL convierte todos los nombres de tablas a minúsculas para almacenamiento y búsquedas. En MySQL 5.0, este comportamiento también se aplica a nombres de bases de datos y alias de tablas. Este valor es el predeterminado en Windows y Mac OS X.
2	Los nombres de tablas y bases de datos se almacenan en disco usando el esquema de mayúsculas y minúsculas especificado en las sentencias CREATE TABLE o CREATE DATABASE, pero MySQL las convierte a minúsculas en búsquedas. Las comparaciones de nombres no son sensibles a mayúsculas.Nota: Esto funciona solamente en sistemas de ficheros que no son sensibles a mayúsculas. Los nombres de las tablas InnoDB se almacenan en minúsculas, como cuandolower_case_table_names vale 1.
1. Para verificar que valor tiene esta variable, podemos hacerlo de 3 formas:
  a) buscar la opción de mostrar variables (show variables) en nuestro cliente de MySQL
  b) en la pestaña variables mediante phpMyAdmin buscarla
  c) entrar mediante la consola de comandos a mysql y escribir el siguiente comando:
  mysql> show variables like "%lower%";

2. En Windows por defecto el valor es 1, para cambiar el valor podemos usar el phpMyAdmin, si es que tenemos un usuario con los suficientes privilegios, y mediante la pestaña variables podemos editarla cambiando su valor a 0, posterior a ello tendremos que reiniciar el servicio de MySQL.

En caso de no tener phpMyAdmin o el usuario, habrá que ubicar el archivo de configuración de MySQL (my.ini o my.cnf), la ubicación dependerá de la versión y como hayan instalado, he aquí algunas ubicaciones donde podría estar:

c:\Windows\my.ini
c:\ruta_de_mysql\MySQL\my.ini
c:\Program Data\MySQL\MySQLversion\my.ini


Editamos este archivo actualizando o agregando la siguiente linea en caso de que no exista:
[mysqld]
...
lower_case_table_names = 0