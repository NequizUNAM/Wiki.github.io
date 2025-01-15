# Cómo usar módulos Node.js con npm y package.json

Published on April 15, 2020

- [Node.js](https://www.digitalocean.com/community/tags/node-js)

- [Development](https://www.digitalocean.com/community/tags/development)

  

*El autor seleccionó a [Open Internet/Free Speech Fund](https://www.brightfunds.org/funds/open-internet-free-speech) para recibir una donación como parte del programa [Write for DOnations](https://do.co/w4do-cta).*

### [Introducción](https://www.digitalocean.com/community/tutorials/how-to-use-node-js-modules-with-npm-and-package-json-es#introduccion)

Debido a características como su rápido rendimiento de entrada y salida (E/S) y su sintaxis de JavaScript conocida, [Node.js](https://nodejs.org/en/) se convirtió velozmente en un entorno en tiempo de ejecución popular para desarrollo web de backend. Sin ambargo, a medida que crece el interés, se crean aplicaciones más grandes y se hace más difícil gestionar la complejidad de la base de código y sus dependencias. Node.js organiza esta complejidad usando *módulos*, que son archivos de JavaScript cualesquiera que contengan funciones u objetos que otros programas o módulos puedan usar. Las colecciones de uno o más módulos suelen citarse como *paquetes* y los administradores de paquetes los organizan.

El [administrador de paquetes de Node.js (npm)](https://www.npmjs.com/) es el administrador de paquetes predeterminado y más popular del ecosistema de Node.js, y se utiliza principalmente para instalar y administrar módulos externos de proyectos de Node.js. También se suele utilizar para instalar una amplia variedad de herramientas de CLI y ejecutar secuencias de comandos de proyectos. npm realiza un seguimiento de los módulos instalados en un proyecto con el archivo `package.json`, que reside en el directorio de un proyecto y contiene lo siguiente:

- Todos los módulos necesarios para un proyecto y sus versiones instaladas
- Todos los metadatos de un proyecto, como el autor y la licencia, entre otros
- Secuencias de comandos que se pueden ejecutar para automatizar tareas del proyecto

Al crear proyectos más complejos de Node.js, administrar sus metadatos y dependencias con el archivo `package.json`, proporcionará compilaciones más previsibles, ya que todas las dependencias externas se mantienen iguales. El archivo hará un seguimiento de esta información de forma automática; si bien puede cambiar el archivo directamente para actualizar los metadatos de su proyecto, rara vez deberá interactuar con él directamente para administrar módulos.

A través de este tutorial, gestionará paquetes con npm. El primer paso será crear y comprender el archivo `package.json`. Luego, lo usará para realizar un seguimiento de todos los módulos que instale en su proyecto. Por último, enumerará las dependencias de sus paquetes, los actualizará, los desinstalará y realizará una auditoría para detectar errores de seguridad en ellos.

## [Requisitos previos](https://www.digitalocean.com/community/tutorials/how-to-use-node-js-modules-with-npm-and-package-json-es#requisitos-previos)

Para completar este tutorial, necesitará lo siguiente:

- Node.js instalado en su equipo de desarrollo. En este tutorial, se utiliza la versión 10.17.0. Para instalarlo en macOS o Ubuntu 18.04, siga los pasos de [Cómo instalar Node.js y crear un entorno de desarrollo local en macOS](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-and-create-a-local-development-environment-on-macos) o las indicaciones de la sección **Instalación con un PPA**, de [Cómo instalar Node.js en Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04). Si tiene Node.js instalado también tendrá npm instalado; en este tutorial se utiliza la versión 6.11.3.

## [Paso 1: Crear un archivo `package.json`](https://www.digitalocean.com/community/tutorials/how-to-use-node-js-modules-with-npm-and-package-json-es#paso-1-crear-un-archivo-package-json)

El primer paso de este tutorial es establecer el proyecto de ejemplo: un módulo `locator` ficticio de Node.js que obtiene la dirección IP del usuario y muestra el país de origen. En este tutorial, no codificará el módulo. Sin embargo, los paquetes que administre serían pertinentes si lo desarrollara.

Primero, creará un archivo `package.json` para almacenar los metadatos útiles sobre el proyecto y como ayuda para administrar los módulos de Node.js dependientes del proyecto. Como sugiere el sufijo, este es un archivo JSON (notación de objetos JavaScript). JSON es un formato estándar que se utiliza para compartir, basado en [objetos de JavaScript](https://www.digitalocean.com/community/tutorials/understanding-objects-in-javascript), y consta de datos almacenados como pares clave-valor. Si desea obtener más información sobre JSON, consulte nuestro artículo [Introducción a JSON](https://www.digitalocean.com/community/tutorials/an-introduction-to-json).

Debido a que un archivo `package.json` contiene numerosas propiedades, puede ser engorroso crearlo manualmente, sin copiar ni pegar una plantilla desde otro sitio. Para facilitar las cosas, npm proporciona el comando `init`. Se trata de un comando interactivo que le formula una serie de preguntas y crea un archivo `package.json` basado en sus respuestas.

### [Usar el comando `init`](https://www.digitalocean.com/community/tutorials/how-to-use-node-js-modules-with-npm-and-package-json-es#usar-el-comando-init)

Primero, configure un proyecto para poder poner en práctica la administración de módulos. En su shell, cree una nueva carpeta llamada `locator`:

```bash
mkdir locator
```

Copy

Luego, posiciónese en la nueva carpeta:

```bash
cd locator
```

Copy

Ahora, inicie el comando interactivo ingresando lo siguiente:

```bash
npm init
```

Copy

**Nota**: Si en su código se usará Git para el control de versiones, cree el repositorio de Git primero y luego ejecute `npm init`. El comando entiende de forma automática que se encuentra en una carpeta habilitada para Git. Si se configura un Git remoto, completa de forma automática el `repositorio`, los `errores` y los campos de la `página de inicio` de su archivo `package.json`. Si inicializó el repositorio después de crear el archivo `package.json`, deberá añadir esta información de forma manual. Para obtener más información sobre el control de versiones de Git, consulte nuestra serie [Git: Instalación, uso y ramificaciones](https://www.digitalocean.com/community/tutorial_series/introduction-to-git-installation-usage-and-branches).

Recibirá el siguiente resultado:

```
OutputThis utility will walk you through creating a package.json file.
It only covers the most common items, and tries to guess sensible defaults.

See `npm help json` for definitive documentation on these fields
and exactly what they do.

Use `npm install <pkg>` afterwards to install a package and
save it as a dependency in the package.json file.

Press ^C at any time to quit.
package name: (locator)
```

Primero, se le solicitará el valor de `name` de su nuevo proyecto. Por defecto, el comando prevé que es el nombre de la carpeta en la que usted se encuentra. Los valores predeterminados de cada propiedad se muestran entre paréntesis `()`. Debido a que el valor predeterminado de `name` funciona para este tutorial, presione `ENTER` para aceptarlo.

El siguiente valor que se debe introducir es `version`. Junto con `name`, este campo se requiere si su proyecto se compartirá con otros en el repositorio de paquetes npm.

**Nota:** Se espera que los paquetes de Node.js sigan la guía de [Versionamiento semántico](https://semver.org/) (semver). Por lo tanto, el primer número será el de versión `MAJOR`, que solo cambia cuando se modifica la API. El segundo número será el de versión `MINOR`, que cambia cuando se añaden funciones. El último número será el de versión de `PATCH`, que cambia cuando se solucionan errores.

Pulse `INTRO` para aceptar la versión predeterminada.

El siguiente campo es `description`: una cadena útil para explicar lo que hace su módulo de Node.js. Nuestro proyecto ficticio `locator` obtendría la dirección IP del usuario y mostraría el país de origen. Un campo `description` adecuado sería `Finds the country of origin of the incoming request`; por lo tanto, ingrese algo similar y presione `INTRO`. El campo `description` es muy útil cuando las personas buscan su módulo.

En la siguiente solicitud se pedirá el `entry point`. Si alguien instala y usa `requires` para su módulo, lo que configure en `entry point` será lo primero que se cargará de su programa. El valor debe ser la ubicación relativa de un archivo de JavaScript, y se añadirá a la propiedad `main` de `package.json`. Pulse `INTRO` para conservar el valor predeterminado.

**Nota**: La mayoría de los módulos tienen un archivo `index.js` como punto de entrada principal. Este es el valor predeterminado de la propiedad `main` de un `package.json`, que es el punto de entrada para los módulos npm. Si no encuentra `package.json`, Node.js intentará cargar `index.js` por defecto.

A continuación, se le solicitará un `test command`, una secuencia de comandos ejecutable o un comando para ejecutar las pruebas de su proyecto. En muchos módulos populares de Node.js, las pruebas se escriben y ejecutan con [Mocha](https://mochajs.org/), [Jest](https://jestjs.io/), [Jasmine](https://jasmine.github.io/) u otros marcos de pruebas. Dado que las pruebas se encuentran fuera del alcance de este artículo, por ahora deje esta opción vacía y presione `INTRO` para continuar.

Luego, el comando `init` solicitará el [repositorio GitHub del proyecto](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/about-repositories). En este ejemplo, no lo usará. Por lo tanto, déjelo vacío también.

Después del repositorio, el comando solicita `keywords`. Esta propiedad es una serie de cadenas con términos útiles que las personas pueden usar para encontrar su repositorio. Se recomienda tener un pequeño conjunto de palabras claves realmente relevantes para su proyecto, a fin de direccionar más la búsqueda. Enumere estas palabras claves como cadena, separando cada valor con una coma. Para este proyecto de ejemplo, ingrese `ip,geo,country` cuando se le solicite. El `package.json` terminado tendrá tres elementos en la matriz de `keywords`.

El siguiente campo de la solicitud es `author`. Es útil para los usuarios de su módulo que quieran ponerse en contacto con usted. Por ejemplo, si alguien descubre una vulnerabilidad de seguridad en su módulo, puede usarlo para indicarle el problema, a fin de que pueda solucionarlo. El campo `author` es una cadena que tiene el siguiente formato:  `"Name \<Email\> (Website)"`. Por ejemplo, `“Sammy \<sammy@your_domain\> (https://your_domain)"` es un autor válido. Los datos de correo electrónico y sitio web son optativos: un autor válido puede ser, simplemente, un nombre. Añada sus datos de contacto como autor y confírmelos con `INTRO`.

Por último, se le solicitará indicar la `license`. Con esto, se determinan los permisos legales y las limitaciones que los usuarios tendrán al usar su módulo. Muchos módulos de Node.js son de código abierto. Por lo tanto, npm establece [ISC](https://www.npmjs.com/package/isc-license) como valor predeterminado.

En este punto, revisaría sus opciones de concesión de licencias y decidirá lo mejor para su proyecto. Para obtener más información sobre los diferentes tipos de licencias de código abierto, consulte esta lista de licencias de la [Open Source Initiative](https://opensource.org/licenses). Si no desea proporcionar una licencia para un repositorio privado, puede escribir `UNLICENSED` en la solicitud. Para este ejemplo, utilice la licencia ISC predeterminada y presione `INTRO` para terminar este proceso.

El comando `init` ahora mostrará el archivo `package.json` que creará. Tendrá un aspecto similar a este:

```
OutputAbout to write to /home/sammy/locator/package.json:

{
  "name": "locator",
  "version": "1.0.0",
  "description": "Finds the country of origin of the incoming request",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [
    "ip",
    "geo",
    "country"
  ],
  "author": "Sammy <sammy@your_domain> (https://your_domain)",
  "license": "ISC"
}


Is this OK? (yes)
```

Una vez que la información coincida con lo que ve aquí, presione `INTRO` para completar el proceso y crear el archivo `package.json`. Con este archivo, puede llevar un registro de los módulos que instale para su proyecto.

Ahora que tiene su archivo `package.json`, puede probar la instalación de módulos en el siguiente paso.

## [Paso 2: Instalar módulos](https://www.digitalocean.com/community/tutorials/how-to-use-node-js-modules-with-npm-and-package-json-es#paso-2-instalar-modulos)

En el desarrollo de software, es habitual usar bibliotecas externas para realizar tareas auxiliares en los proyectos. Esto permite que el desarrollador se centre en la lógica empresarial y cree la aplicación de forma más rápida y eficiente.

Por ejemplo, si el módulo `locator` de nuestro ejemplo tuviera que hacer una solicitud de API externa para obtener datos geográficos, podríamos usar una biblioteca HTTP para facilitar esa tarea. Debido a que nuestro objetivo principal es devolver al usuario datos geográficos pertinentes, podríamos instalar un paquete que nos facilite las solicitudes HTTP en lugar de tener que volver a escribir este código nosotros mismos, una tarea que va más allá del alcance de nuestro proyecto.

Veamos este ejemplo. En su aplicación `locator`, usará la biblioteca [axios](https://github.com/axios/axios), que lo ayudará a realizar solicitudes HTTP. Instálela ingresando lo siguiente en su shell:

```bash
npm install axios --save
```

Copy

Este comando se inicia con `npm install`, que instalará el paquete (para abreviar, puede usar `npm i`). Luego, enumere los paquetes que desea instalar, separados por un espacio. En este caso, es `axios`. Por último, finalice el comando con el parámetro opcional `--save`, que especifica que `axios` se guardará como dependencia del proyecto.

Cuando se instale la biblioteca, verá un resultado similar al siguiente:

```
Output...
+ axios@0.19.0
added 5 packages from 8 contributors and audited 5 packages in 0.764s
found 0 vulnerabilities
```

Ahora, abra el archivo `package.json` con el editor de texto que prefiera. En este tutorial, se usará `nano`:

```bash
nano package.json
```

Copy

Verá una nueva propiedad, resaltada en lo siguiente:

locator/package.json

```
{
  "name": "locator",
  "version": "1.0.0",
  "description": "Finds the country of origin of the incoming request",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [
    "ip",
    "geo",
    "country"
  ],
  "author": "Sammy sammy@your_domain (https://your_domain)",
  "license": "ISC",
  "dependencies": {
    "axios": "^0.19.0"
  }
}
```

La opción `--save` indicó a npm que actualizara `package.json` con el módulo y la versión que se acaba de instalar. Esto es muy positivo, ya que otros desarrolladores que trabajen en sus proyectos podrán ver fácilmente las dependencias externas necesarias.

**Nota**: Seguramente haya observado el `^` antes del número de versión de la dependencia `axios`. Recuerde que el control de versiones semántico consta de tres dígitos: **MAJOR**, **MINOR** y **PATCH**. El símbolo `^` indica que cualquier versión MINOR o PATCH superior cumpliría con esta restricción de versión. Si ve `~` al comienzo de un número de versión, solo las versiones PATCH superiores satisfacen la restricción.

Cuando termine de revisar `package.json`, cierre el archivo.

### [Dependencias de desarrollo](https://www.digitalocean.com/community/tutorials/how-to-use-node-js-modules-with-npm-and-package-json-es#dependencias-de-desarrollo)

Los paquetes que se utilizan para desarrollar proyectos, pero no para crearlos o ejecutarlos en producción, se conocen como *dependencias de desarrollo*. No son necesarios para que su módulo o aplicación funcionen en producción, pero pueden ser útiles al escribir el código.

Por ejemplo, es común que los desarrolladores utilicen [*linters de código*](https://en.wikipedia.org/wiki/Lint_(software)) para asegurarse de que su código siga las prácticas recomendadas y mantener un estilo uniforme. Si bien esto es útil para el desarrollo, solo aumenta el tamaño del código que puede distribuirse y no proporciona un beneficio tangible cuando se implementa en producción.

Instale un linter como dependencia de desarrollo para su proyecto. Pruebe esto en su shell:

```bash
npm i eslint@6.0.0 --save-dev
```

Copy

En este comando, utilizó el indicador `--save-dev`. Este indicador guardará `eslint` como una dependencia que solo se requiere para el desarrollo. Tenga en cuenta, también, que añadió `@6.0.0` al nombre de su dependencia. Cuando los módulos se actualizan, se etiquetan con una versión. La `@` indica a npm que busque una etiqueta específica del módulo que está instalando. Si no se especifica una etiqueta, npm instala la última versión etiquetada. Vuelva a abrir `package.json`:

```bash
nano package.json
```

Copy

Con esto, se mostrará lo siguiente:

locator/package.json

```
{
  "name": "locator",
  "version": "1.0.0",
  "description": "Finds the country of origin of the incoming request",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [
    "ip",
    "geo",
    "country"
  ],
  "author": "Sammy sammy@your_domain (https://your_domain)",
  "license": "ISC",
  "dependencies": {
    "axios": "^0.19.0"
  },
  "devDependencies": {
    "eslint": "^6.0.0"
  }
}
```

`eslint` se guardó como `devDependencies`, junto con el número de versión que especificó anteriormente. Cierre `package.json`.

### [Archivos generados de forma automática: `node_modules` y `package-lock.json`](https://www.digitalocean.com/community/tutorials/how-to-use-node-js-modules-with-npm-and-package-json-es#archivos-generados-de-forma-automatica-node_modules-y-package-lock-json)

La primera vez que se instala un paquete en un proyecto de Node.js, npm crea la carpeta `node_modules` para almacenar los módulos necesarios para su proyecto y el archivo `package-lock.json` que examinó antes.

Confirme que estén presentes en su directorio de trabajo. En su shell, escriba `ls` y presione `INTRO`. Verá el siguiente resultado:

```
Outputnode_modules    package.json    package-lock.json
```

La carpeta `node_modules` contiene todas las dependencias instaladas de su proyecto. En la mayoría de los casos, **no** debe confirmar esta carpeta en su repositorio de versiones controladas. A medida que instale más dependencias, el tamaño de esta carpeta aumentará rápidamente. Además, el archivo `package-lock.json` lleva un registro de las versiones exactas instaladas de forma más concisa. Por lo tanto, no es necesario incluir `node_modules`.

Si bien el archivo `package.json` enumera dependencias que indican las versiones adecuadas que se deben instalar en el proyecto, el archivo `package-lock.json` hace un seguimiento de todos los cambios que se realizan en `package.json` o `node_modules` y nos indica la versión exacta del paquete instalado. En general, confirma esto en su repositorio de versiones controladas, en lugar de `node_modules`, dado que es una representación más clara de todas sus dependencias.

### [Realizar la instalación desde package.json](https://www.digitalocean.com/community/tutorials/how-to-use-node-js-modules-with-npm-and-package-json-es#realizar-la-instalacion-desde-package-json)

Con sus archivos `package.json` y `package-lock.json`, puede configurar rápidamente las mismas dependencias del proyecto antes de comenzar a desarrollar uno nuevo. Para demostrarlo, suba un nivel en su árbol de directorios y cree una nueva carpeta denominada `cloned_locator` en el mismo nivel de directorio de `locator`:

```bash
cd ..
mkdir cloned_locator
```

Copy

Posiciónese en su nuevo directorio:

```bash
cd cloned_locator
```

Copy

Ahora, copie los archivos `package.json` y `package-lock.json` de `locator` a `cloned_locator`:

```bash
cp ../locator/package.json ../locator/package-lock.json .
```

Copy

Para instalar los módulos requeridos para este proyecto, escriba lo siguiente:

```bash
npm i
```

Copy

npm buscará un archivo `package-lock.json` para instalar los módulos. Si no hubiera ningún archivo de bloqueo disponible, leería el archivo `package.json` para determinar las instalaciones. En general, la instalación se puede realizar de manera más rápida desde `package-lock.json`, ya que el archivo de bloqueo contiene la versión exacta de los módulos y sus dependencias, lo cual significa que npm no tiene que invertir tiempo en determinar una versión adecuada para la instalación.

Al momento de la implementación en producción, tal vez prefiera omitir las dependencias de desarrollo. Recuerde que las dependencias de desarrollo se almacenan en la sección `devDependencies` de `package.json` y que no afectan el funcionamiento de su aplicación. Al instalar módulos como parte del proceso de CI y CD para implementar su aplicación, omita las dependencias de desarrollo ejecutando lo siguiente:

```bash
npm i --production
```

Copy

El indicador `--production` ignora la sección `devDependencies` durante la instalación. Por ahora, siga adelante con su compilación de desarrollo.

Antes de pasar a la siguiente sección, regrese a la carpeta `locator`:

```bash
cd ../locator
```

Copy

### [Instalaciones globales](https://www.digitalocean.com/community/tutorials/how-to-use-node-js-modules-with-npm-and-package-json-es#instalaciones-globales)

Hasta ahora, instaló módulos npm para el proyecto `locator`. npm también le permite instalar paquetes *de forma global*. Esto significa que el paquete está disponible para su usuario en el sistema más amplio, como cualquier otro comando shell. Esta capacidad es útil para muchos módulos de Node.js que son herramientas de CLI.

Por ejemplo, tal vez desee hacer un blog sobre el proyecto `locator` en el que trabaja actualmente. Para hacerlo, puede usar una biblioteca como [Hexo](https://hexo.io/) para crear y administrar su blog de sitio web estático. Instale la CLI de Hexo de forma global, como se indica a continuación:

```bash
npm i hexo-cli -g
```

Copy

Para instalar un paquete de forma global, anexe el indicador `-g` al comando.

**Nota**: Si observa un error de permiso al intentar instalar este paquete de forma global, es posible que su sistema requiera privilegios de superusuario para ejecutar el comando. Vuelva a probar con `sudo npm i hexo-cli -g`.

Pruebe que el paquete se haya instalado de forma correcta escribiendo lo siguiente:

```bash
hexo --version
```

Copy

Verá un resultado similar a este:

```
Outputhexo-cli: 2.0.0
os: Linux 4.15.0-64-generic linux x64
http_parser: 2.7.1
node: 10.14.0
v8: 7.6.303.29-node.16
uv: 1.31.0
zlib: 1.2.11
ares: 1.15.0
modules: 72
nghttp2: 1.39.2
openssl: 1.1.1c
brotli: 1.0.7
napi: 4
llhttp: 1.1.4
icu: 64.2
unicode: 12.1
cldr: 35.1
tz: 2019a
```

Hasta ahora, aprendió a instalar módulos con npm. Puede instalar paquetes en un proyecto de forma local, ya sea como dependencia de producción o de desarrollo. También puede instalar paquetes basados en archivos `package.json` o `package-lock.json` preexistentes, lo que le permite realizar desarrollos con las mismas dependencias que sus pares. Por último, puede usar el indicador `-g` para instalar paquetes de forma global, a fin de poder acceder a ellos independientemente de que se encuentre en un proyecto de Node.js o no.

Ahora que puede instalar módulos, en la siguiente sección, practicará técnicas para administrar sus dependencias.

## [Paso 3: Administrar módulos](https://www.digitalocean.com/community/tutorials/how-to-use-node-js-modules-with-npm-and-package-json-es#paso-3-administrar-modulos)

Un administrador de paquetes completo puede hacer mucho más que instalar módulos. npm tiene más de 20 comandos disponibles relacionados con la administración de dependencias. En este paso, hará lo siguiente:

- Enumerará módulos que instaló.
- Actualizará módulos a una versión más reciente.
- Desinstalará los módulos que ya no necesite.
- Ejecutará una auditoría de seguridad en sus módulos para encontrar y solucionar errores de seguridad.

Si bien estos ejemplos se ejecutarán en su carpeta `locator`, todos estos comandos se pueden ejecutar de forma global añadiéndoles el indicador `-g` al final, exactamente lo mismo que hizo al realizar la instalación global.

### [Enumerar módulos](https://www.digitalocean.com/community/tutorials/how-to-use-node-js-modules-with-npm-and-package-json-es#enumerar-modulos)

Si quisiera saber qué módulos se instalan en un proyecto, sería más fácil usar el comando `list` o `ls` en lugar de leer directamente `package.json`. Para hacerlo, ingrese lo siguiente:

```bash
npm ls
```

Copy

Verá un resultado similar a este:

```
Output├─┬ axios@0.19.0
│ ├─┬ follow-redirects@1.5.10
│ │ └─┬ debug@3.1.0
│ │   └── ms@2.0.0
│ └── is-buffer@2.0.3
└─┬ eslint@6.0.0
  ├─┬ @babel/code-frame@7.5.5
  │ └─┬ @babel/highlight@7.5.0
  │   ├── chalk@2.4.2 deduped
  │   ├── esutils@2.0.3 deduped
  │   └── js-tokens@4.0.0
  ├─┬ ajv@6.10.2
  │ ├── fast-deep-equal@2.0.1
  │ ├── fast-json-stable-stringify@2.0.0
  │ ├── json-schema-traverse@0.4.1
  │ └─┬ uri-js@4.2.2
...
```

Por defecto, `Is` muestra todo el árbol de dependencias: los módulos de los que depende su proyecto y los módulos de los que dependen sus dependencias. Puede ser algo engorroso si desea obtener una descripción general de alto nivel de lo que se instala.

Para imprimir únicamente los módulos que instaló sin sus dependencias, ingrese lo siguiente en su shell:

```bash
npm ls --depth 0
```

Copy

El resultado será el siguiente:

```
Output├── axios@0.19.0
└── eslint@6.0.0
```

La opción `--depth` le permite especificar el nivel del árbol de dependencias que desea ver. Cuando es `0`, solo se ven dependencias de nivel superior.

### [Actualizar módulos](https://www.digitalocean.com/community/tutorials/how-to-use-node-js-modules-with-npm-and-package-json-es#actualizar-modulos)

Se le recomienda mantener sus módulos npm actualizados. Al hacerlo, tiene más posibilidades de acceder a las últimas correcciones de seguridad para ellos. Utilice el comando `outdated` para verificar si hay actualizaciones para alguno de sus módulos:

```bash
npm outdated
```

Copy

Obtendrá un resultado similar al siguiente:

```
OutputPackage  Current  Wanted  Latest  Location
eslint     6.0.0   6.7.1   6.7.1  locator
```

Con este comando, primero se enumeran el `Package` (paquete) que está instalado y la versión `Current` (actual). En la columna `Wanted` (deseado), se muestra la versión que cumple su requisito de versión en `package.json`. La columna `Latest` (última) muestra la versión más reciente del módulo que se publicó.

La columna `Location` (ubicación) indica dónde se encuentra el paquete en el árbol de dependencias. El comando `outdated` tiene el indicador `--depth` como `Is`. Por defecto, la profundidad es 0.

Parece que puede actualizar `eslint` a una versión más reciente. Utilice los comandos `update` o `up` como se indica a continuación:

```bash
npm up eslint
```

Copy

El resultado del comando contendrá la versión instalada:

```
Outputnpm WARN locator@1.0.0 No repository field.

+ eslint@6.7.1
added 7 packages from 3 contributors, removed 5 packages, updated 19 packages, moved 1 package and audited 184 packages in 5.818s
found 0 vulnerabilities
```

Si quisiera actualizar todos los módulos a la vez, debería ingresar lo siguiente:

```bash
npm up
```

Copy

### [Desinstalar módulos](https://www.digitalocean.com/community/tutorials/how-to-use-node-js-modules-with-npm-and-package-json-es#desinstalar-modulos)

El comando `uninstall` de npm se utiliza para eliminar módulos de sus proyectos. Esto significa que el módulo ya no se instalará en la carpeta `node_modules` ni se verá en sus archivos `package.json` y `package-lock.json`.

Eliminar dependencias de un proyecto es una actividad normal del ciclo de vida de desarrollo de software. Es posible que una dependencia no resuelva el problema tal como se anuncia o que no proporcione una experiencia de desarrollo satisfactoria. En estos casos, es mejor que desinstale la dependencia y cree su propio módulo.

Imagine que `axios` no proporciona la experiencia de desarrollo que hubiera deseado para realizar solicitudes HTTP. Desinstale `axios` con el comando `uninstall` o `un` ingresando lo siguiente:

```bash
npm un axios
```

Copy

El resultado será similar a este:

```
Outputnpm WARN locator@1.0.0 No repository field.

removed 5 packages and audited 176 packages in 1.488s
found 0 vulnerabilities
```

No se indica de forma explícita que se eliminó `axios`. Para verificar que se haya desinstalado, vuelva a enumerar las dependencias una vez más:

```bash
npm ls --depth 0
```

Copy

Ahora, se ve que solo `eslint` está instalado:

```
Output└── eslint@6.7.1
```

Esto indica que desinstaló el paquete `axios` de forma exitosa.

### [Auditar módulos](https://www.digitalocean.com/community/tutorials/how-to-use-node-js-modules-with-npm-and-package-json-es#auditar-modulos)

npm proporciona un comando `audit` para resaltar posibles riesgos de seguridad de sus dependencias. Para ver la auditoría en acción, instale una versión obsoleta del módulo [request](https://github.com/request/request) ejecutando lo siguiente:

```bash
npm i request@2.60.0
```

Copy

Cuando instale esta versión obsoleta de `request`, obtendrá un resultado similar al siguiente:

```
Output+ request@2.60.0
added 54 packages from 49 contributors and audited 243 packages in 7.26s
found 6 moderate severity vulnerabilities
  run `npm audit fix` to fix them, or `npm audit` for details
```

npm le indica que hay vulnerabilidades en sus dependencias. Para obtener más información, audite todo el proyecto con lo siguiente:

```bash
npm audit
```

Copy

Con el comando `audit` se muestran tablas de resultados en las que se resaltan errores de seguridad:

```
Output                       === npm audit security report ===

# Run  npm install request@2.88.0  to resolve 1 vulnerability
┌───────────────┬──────────────────────────────────────────────────────────────┐
│ Moderate      │ Memory Exposure                                              │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Package       │ tunnel-agent                                                 │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Dependency of │ request                                                      │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Path          │ request > tunnel-agent                                       │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ More info     │ https://npmjs.com/advisories/598                             │
└───────────────┴──────────────────────────────────────────────────────────────┘

# Run  npm update request --depth 1  to resolve 1 vulnerability
┌───────────────┬──────────────────────────────────────────────────────────────┐
│ Moderate      │ Remote Memory Exposure                                       │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Package       │ request                                                      │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Dependency of │ request                                                      │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Path          │ request                                                      │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ More info     │ https://npmjs.com/advisories/309                             │
└───────────────┴──────────────────────────────────────────────────────────────┘
...
```

Puede ver la ruta de la vulnerabilidad y, a veces, npm le ofrece formas de corregirla. Puede ejecutar el comando update, como se sugiere, o el subcomando `fix` de `audit`. En su shell, ingrese lo siguiente:

```bash
npm audit fix
```

Copy

Verá un resultado similar a este:

```
Output+ request@2.88.0
added 19 packages from 24 contributors, removed 32 packages and updated 12 packages in 6.223s
fixed 2 of 6 vulnerabilities in 243 scanned packages
  4 vulnerabilities required manual review and could not be updated
```

npm pudo actualizar de forma segura dos de los paquetes, lo que redujo sus vulnerabilidades en la misma cantidad. Sin embargo, aún tiene cuatro vulnerabilidades en sus dependencias. El comando `audit fix` no siempre soluciona todos los problemas. Si bien la versión de un módulo puede tener una vulnerabilidad de seguridad, si lo actualiza a una versión con una API diferente podría desglosar el código en un nivel más alto del árbol de dependencias.

Puede usar el parámetro `--force` para garantizar que se hayan eliminado las vulnerabilidades, como se indica a continuación:

```bash
npm audit fix --force
```

Copy

Como se mencionó anteriormente, esto no se recomienda a menos que esté seguro de que la funcionalidad no se verá afectada.

## [Conclusión](https://www.digitalocean.com/community/tutorials/how-to-use-node-js-modules-with-npm-and-package-json-es#conclusion)

A lo largo de este tutorial, realizó varios ejercicios para demostrar cómo se organizan los módulos de Node.js en paquetes y la forma en que npm los gestiona. En un proyecto de Node.js, utilizó paquetes npm como dependencias creando y manteniendo un archivo `package.json`: un registro de los metadatos de su proyecto que incluye los módulos que instaló. También utilizó la herramienta CLI de npm para instalar, actualizar y eliminar módulos, así como para enumerar el árbol de dependencias de sus proyectos y verificar y actualizar los módulos obsoletos.

En el futuro, aprovechar el código existente usando módulos acelerará el tiempo de desarrollo, dado que no es necesario que repita funcionalidades. También podrá crear sus propios módulos npm y estos, a su vez, serán gestionados por otros a través de comandos npm. En cuanto a los siguientes pasos, experimente con lo que aprendió en este tutorial instalando y probando los diferentes paquetes disponibles. Vea lo que se ofrece en el ecosistema para facilitar la resolución de problemas. Por ejemplo, puede probar [TypeScript](https://www.typescriptlang.org/), un supraconjunto de JavaScript, o convertir su sitio web en aplicaciones móviles con [Cordova](https://cordova.apache.org/). Si desea obtener más información sobre Node.js, consulte nuestros [otros tutoriales de Node.js](https://www.digitalocean.com/community/tags/node-js?type=tutorials).

Thanks for learning with the DigitalOcean Community. Check out our offerings for compute, storage, networking, and managed databases.

[Learn more about us](https://www.digitalocean.com/)