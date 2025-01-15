**PHP lectura de archivo en array**

Primero se crea el archivo a leer

```php
<?
; Archivo de configuracion plataforma
[00001]
type = 'error'
code = '00001'
status = 'fail'
description = 'No es posible procesar su solicitud en este momento.'

[00003]
type = 'error'
code = '00003'
status = 'fail'
description = 'El usuario o la contraseña son incorrectos'

[00004]
type = 'error'
code = '00004'
status = 'fail'
description = 'No es posible conectar a la base de datos'
?>
```

Este archivo lee uno externo para convertirlo en un array

```php
/*
*/
<?php

    public function getName($key = ''){
        // Nombre del archivo a leer
        $nombreArchivo = '../assets/config/names.php';

        // Verificar si el archivo existe
        if (file_exists($nombreArchivo)) {
            // Leer el contenido del archivo
            $contenido = file_get_contents($nombreArchivo);

            // Obtener la información del archivo en forma de array
            $datos = parse_ini_string($contenido, true);

            // Imprimir el array con la información
            if($key == '')
                return($datos);
            else
                return($datos[$key]);
        } else {
            return "El archivo no existe.";
        }
    }

?>
```


