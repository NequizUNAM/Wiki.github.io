# Iniciar Proyecto NodeJS con NPM y dependencias básicas.

- Verifico version de node

```
$> node -v
v7.9.0
```

- Verifico version de npm

```
$> npm -v
4.2.0
```

- Si npm no esta instalado, el siguiente comando lo instala de forma global

```
$> npm install -g npm
```

- Si npm no esta actualizado, el siguiente comando lo actualiza de forma global

```
$> npm update -g npm
```

- Creo el directorio de mi proyecto

```
$> mkdir my_app_node
```

- Me ubico en el directorio

```
$> cd my_app_node
```

- NPM utiliza el archivo package.json para almacenar todos los datos relevantes a nuestra aplicación.
- Nos realizara varias preguntas para configurar adecuadamente la app.
- Este archivo también se guardarán las dependencias de paquetes del proyecto junto con su configuración básica (nombre del proyecto, versión, etc).

```
$> npm init
```

- La consola mostrara algo similar a los siguiente:

```text
This utility will walk you through creating a package.json file.
It only covers the most common items, and tries to guess sensible defaults.

See `npm help json` for definitive documentation on these fields
and exactly what they do.

Use `npm install <pkg> --save` afterwards to install a package and
save it as a dependency in the package.json file.

Press ^C at any time to quit.
name: (my_app_node)
version: (1.0.0)
description: mi demo node app
entry point: (index.js)
test command: nodemon index.js
git repository:
keywords: ES
author: edgardo001
license: (ISC)
About to write to C:\Users\datasoft-edgardo\Desktop\my_app_node\package.json:

{
  "name": "my_app_node",
  "version": "1.0.0",
  "description": "mi demo node app",
  "main": "index.js",
  "scripts": {
    "test": "nodemon index.js"
  },
  "keywords": [
    "ES"
  ],
  "author": "edgardo001",
  "license": "ISC"
}


Is this ok? (yes) yes
```

- Instala las libreria en el directorio del app, y guarda su referencia en "package.json"

```
$> npm install express --save
$> npm install body-parser --save
$> npm install nodemon --save
```

- Crear el archivo index.js el cual inicia el app, este se debe crear en la raiz del app

```text
var express = require('express');
var bodyParser = require('body-parser');

var app = express();
var port = process.env.PORT || 3525;

// Convierte una petición recibida (POST-GET...) a objeto JSON
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

app.get('/', function(req, res){
	res.status(200).send({
		message: 'GET Home route working fine!'
	});
});

app.listen(port, function(){
	console.log(`Server running in http://localhost:${port}`);
	console.log('Defined routes:');
	console.log('	[GET] http://localhost:3525/');
});
```

- Inicia el app desde "index.js" como indica el "package.json" en la seccion "scripts"

```
$> npm test
```

REFERENCIAS:

http://expressjs.com/es/starter/installing.html

http://gorkamu.com/2017/06/aprender-nodejs-setup-inicial/

http://gorkamu.com/2017/07/como-organizar-un-proyecto-node-js/





Si encuentras un error al ejecutar `npm install`, hay algunas acciones que puedes tomar para intentar resolverlo. Aquí hay algunos pasos que puedes seguir para solucionar problemas comunes:

1. **Verifica tu conexión a Internet:** Asegúrate de que tienes una conexión a Internet estable. A veces, los problemas de conectividad pueden interferir con la descarga de las dependencias.

2. **Revisa el archivo package.json:** Asegúrate de que tu archivo `package.json` esté bien formateado y no tenga errores de sintaxis. Verifica que todas las comillas, llaves y comas estén colocadas correctamente.

3. **Elimina el archivo package-lock.json:** A veces, el archivo `package-lock.json` puede causar conflictos durante la instalación. Intenta eliminar este archivo y luego ejecutar `npm install` nuevamente.

   ```
   bashCopy code
   rm package-lock.json
   ```

4. **Limpia la caché de npm:** La caché de npm puede contener información obsoleta que puede causar problemas durante la instalación. Intenta limpiar la caché de npm con el siguiente comando:

   ```
   bashCopy code
   npm cache clean --force
   ```

5. **Actualiza npm:** Asegúrate de tener la última versión de npm instalada. Puedes actualizar npm utilizando el siguiente comando:

   ```
   bashCopy code
   npm install -g npm@latest
   ```

6. **Reinstala las dependencias:** Si ninguno de los pasos anteriores funciona, puedes intentar eliminar la carpeta `node_modules` y el archivo `package-lock.json`, y luego volver a ejecutar `npm install`:

   ```
   bashCopy coderm -rf node_modules
   rm package-lock.json
   npm install
   ```

7. **Busca ayuda adicional:** Si aún así no puedes resolver el problema, el mensaje de error específico que recibes al ejecutar `npm install` puede proporcionar pistas sobre la causa del problema. Intenta buscar ese error en línea o en la documentación oficial de npm para obtener más ayuda.

Siguiendo estos pasos, deberías poder resolver la mayoría de los problemas que puedan surgir al ejecutar `npm install`.

