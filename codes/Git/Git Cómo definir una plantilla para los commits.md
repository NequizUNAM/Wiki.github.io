Escribir **mensajes asociados a los \*commits\*** con los cambios que guardas en tu sistema de **control de código fuente** es muy parecido a comentar el código de tus aplicaciones: un arte que requiere **sentido común**, **capacidad de síntesis** y una pizca de **empatía**. Y cuando se necesitan estas tres cosas a la vez para hacer algo, lo mejor es asumir que mucha gente lo va a hacer mal 😣

Por eso, los proyectos de tu equipo pueden acabar con *commits* llenos de mensajes de este estilo:

- Se ha modificado el código
- Pequeños cambios
- Se ha añadido una nueva característica
- Solucionado el p*to bug
- Retocada documentación
- El cielo es azul y el agua moja 😜

Es decir mensajes que, si bien estrictamente hablando describen lo que se ha hecho, no dejan de ser **obviedades sin interés**. Es como decir en los comentarios de tu código: "Declaro una variable de tipo entero". Es cierto, refleja lo que se hace, pero no sirve absolutamente para nada 🤦🏻

> No hacer este tipo de comentarios estériles es uno de mis [10 mandamientos del control de código fuente](https://www.campusmvp.es/recursos/post/los-10-mandamientos-del-control-de-codigo-fuente.aspx), con Git o con cualquier otro sistema.

Por este motivo es muy interesante que, a la hora de hacer un *commit*, todas las personas que trabajan en nuestro equipo puedan tener presentes **las normas para escribir los mensajes de \*commit\***:

- Cómo deben escribirlos
- Qué información básica y extra deberían incluir
- Cómo deberían prefijar cada mensaje
- Qué implicaciones tiene el código
- Etc...

Es decir, **es muy importante disponer de una metodología** clara y concisa que regule **cómo deben ser estos mensajes**, y no dejarlo al azar o confiar en que todo el mundo va a reunir las cualidades que mencionaba el principio de este artículo.

¿Cómo podemos conseguirlo y garantizar que todo el mundo tenga las normas en mente cada vez que realiza un *commit*?

Gracias a las **plantillas de commit de Git**.

## Definiendo una plantilla de *commit* para Git

Generalmente, cuando vamos a hacer un *commit* tras añadir los archivos a la zona de *staging*, utilizamos la instrucción:

```shell
git commit -m "Mi mensaje de commit"
```

Lo que no todo el mundo tiene claro es que, si omitimos los parámetros y ponemos simplemente:

```shell
git commit
```

lo que ocurre es que se abre nuestro editor de código predeterminado (en mi caso Visual Studio Code), con una plantilla de texto de Git con algunas instrucciones básicas, como esta:

![Aspecto de la plantilla predeterminada](./Git_ Cómo definir una plantilla para los commits_files/image(1).axd)

Lo que tenemos es una primera línea en blanco, que será donde escribamos el verdadero mensaje de *commit*, seguida de una serie de comentarios que nos resume los archivos que vamos a incluir en el mismo.

Para aprovechar esta capacidad de Git, podemos **definir nuestra propia plantilla de \*commit\*** de modo que cada vez que vayamos a hacer uno se abra el editor de código y nos muestre la información relevante para hacerlo.

Para lograrlo lo primero es definir esa plantilla. Así que, **crea un nuevo archivo de texto** en donde quieras y ábrelo con tu editor de texto favorito. Puedes ponerle el nombre que desees, por ejemplo `plantilla-commit.txt`.

Invierte un buen rato en pensar bien qué vas a meter dentro, pensando en cómo trabajáis en tu empresa y qué objetivos te interesa conseguir. Al final, deberás **reflejar con comentarios las normas que quieres que sigan** las personas de tu equipo a la hora de hacer *commits* a Git, y dejando líneas en blanco en donde quieras que escriban.

> **Nota**: se considera un comentario aquella línea que comience con un `#` o un `;`.

Por ejemplo, este es uno que he creado yo y que quizá te pueda servir como base:

```markdown
# ----------------------------------------------------------
# Primera línea: Algo breve pero descriptivo
#                de lo que se ha hecho
#                ¡Que sirva para algo! :-S
#                Que facilite las búsquedas si es preciso
# ----------------------------------------------------------
#    Debe empezar por uno de estos prefijos:
#    - WIP: si lleva trabajo sin terminar
#    - END: si es código final, listo para revisar
#
#    Además, según el tipo de código, debe llevar un de estos:
#    - #NNN: número de tarea a la que pertenece el trabajo
#    - BUG: cuando corrige un bug
#    - DOC: si se está tocando documentación
#    - REF: si es solo una refactorización
#    - IMG: si son retoques estéticos/de imagen
#    - PRF: retoques de rendimiento
#    - TST: código relacionado con tests
#    - CID: cambios al proceso de CI/CD
# ----------------------------------------------------------
#    Por ejemplo:
#    - WIP:#123: Nuevo formulario de crear usuario
#    - END:BUG: Problema con cálculo de hash
#    - WIP:DOC: Actualizado manual del alumno
# ----------------------------------------------------------


# ----------------------------------------------------------
# Info extra (opc)
# ----------------------------------------------------------
#    Si la línea anterior no tiene todo lo necesario
#    o si el id de tarea no existe, ofrecer detalles sobre
#    - por qué se han hecho los cambios
#    - detalles importantes sobre cambios
#    - posible rotura de compatibilidad
#    - cambios de funcionalidad
#    - etc...
# ----------------------------------------------------------


# ----------------------------------------------------------
# Recursos relacionados - Donde ver información extra (opc)
# ----------------------------------------------------------
#    Por ejemplo, urls a documentos internos/externos
#    sobre técnicas utilizadas, funcionalidad,
#    casos de uso, docs técnicos, etc..
# ----------------------------------------------------------
```

Es un poco largo, pero eso no te debe preocupar ya que **los comentarios se eliminan automáticamente antes de hacer el \*commit\***, por lo que nunca llegarán al repositorio remoto ni ocuparán espacio allí.

Como ves, en este caso describo cómo se deben **etiquetar el mensaje** con uno o dos prefijos que luego permiten localizar rápidamente los tipos de cosas que se hacen en el código (recuerda que los *commits* siempre deben ser muy atómicos, pequeños y no mezclar tareas diferentes). Se les recuerda que la frase principal, en **la primera línea**, debe ser breve pero descriptiva, o no servirá de nada. Luego pueden meter la información extra que sea precisa, pero esta primera es fundamental para saber rápidamente de qué va cada uno y para poder localizar sin dificultad, ojeando un listado de *commits* o con una búsqueda, aquello que nos interesa.

Bien, ahora solo nos queda hacer que Git utilice esta plantilla para mostrarla en el editor de *commits*. Esto se consigue editando la configuración, abriendo una línea de comandos en uno de los repositorios donde la queramos utilizar, con una línea como esta:

```shell
git config commit.template ./plantilla-commit.txt
```

poniendo al final la ruta absoluta o relativa del archivo de plantilla que hemos creado. En este caso, como la plantilla la hemos copiado en la raíz del repositorio local, llega con `./` seguido del nombre del archivo.

[Tenemos la mejor forma de que aprendas Git sin irte por las ramas... 😉](https://www.campusmvp.es/catalogo/Product-Git-Control-de-código-fuente-para-programadores_245.aspx)

Esto hará que, a partir de este momento, **si hacemos un `git commit`, sin parámetros**, se abra el editor por defecto con la plantilla de texto que hemos definido:

![Aspecto de mi plantilla de commit abierta en VSCode](./Git_ Cómo definir una plantilla para los commits_files/image(2).axd)

Ahora basta con escribir el mensaje siguiendo las directivas que aparecen en los comentarios, guardar y cerrar el archivo: se realizará el *commit* de manera normal.

> Recuerda que los comentarios no es necesario borrarlos: ya lo hace Git automáticamente.

## Incluir la plantilla en cada repositorio - Opción 1

Esto está muy bien, pero **requiere configuración en cada uno de los repositorios** o en cada uno de los equipos para lograrlo, ya que Git (a propósito, por seguridad) no incluye ninguna manera de distribuir configuraciones específicas a través de un repositorio. Es decir, no permite incluir un archivo de configuración en el propio repo y que así todos los usuarios usen la misma automáticamente.

Podríamos haber modificado la **configuración global** de modo que este ajuste **afecte a todos los repositorios** del usuario actual, utilizando el modificador `--global` en el comando de configuración que acabamos de ver. Pero al final tenemos el mismo problema: cada desarrollador tiene que hacerlo en su propio equipo para que funcione, y además necesitamos tener el archivo en una ruta accesible por cada usuario en cada equipo.

En mi opinión, la mejor manera de poner en marcha esto para todo el que trabaje en un proyecto, es **incluir en cada repositorio de código dos archivos**:

- La plantilla que hayamos creado.
- Un archivo `.bat` (en Windows) o `.sh` (en Linux/Mac) que contenga el comando necesario para incluir la configuración en el repositorio. Dentro solo debe poner (en ambos casos): `git config commit.template ./plantilla-commit.txt`.

> Debemos instruir a todo el equipo que, cada vez que clonen un repositorio, deberán ejecutar el `.bat` o `.sh` para dejarlo bien configurado. No es lo ideal, ya que es posible que se olviden o sean negligentes al hacerlo, pero es la menos mala de las soluciones.

Además, **la principal ventaja de hacerlo por repositorio** y no mediante la configuración global, es que podemos hacer que **cada repositorio tenga su propia plantilla** de *commit*, que puede ser diferente según el tipo de proyecto.

## Incluir la plantilla en cada repositorio - Opción 2

Otra opción, si nos interesase **distribuir una configuración más compleja para Git**, con muchos otros valores, sería incluir **un archivo `.gitconfig` en la raíz del repo** (o con el nombre que queramos). Este contendrá los ajustes exactos que nos interese distribuir: la plantilla de *commit* que nos ocupa, el editor predeterminado, [los alias](https://www.campusmvp.es/recursos/post/6-alias-para-git-que-dispararan-tu-productividad.aspx) que nos interesen, etc... Los valores los podemos copiar de nuestro archivo de configuración global o de dónde sea: es solo texto.

Ahora, para aplicarlo, podemos hacer una inclusión de estos valores en la configuración del repositorio:

```shell
git config --local include.path ../.gitconfig
```

Este comando, tal cual, lo metemos en un `.bat` (para Windows) y en un `.sh` (para los que usen Linux o Mac), y tendrán que ejecutarlo tras clonar el repositorio. Lo que hace es incluir nuestra configuración, tomada de este archivo, en la configuración local del repositorio.

Lo bueno de hacerlo así es que podemos meter configuraciones más complejas de manera muy simple con un solo comando, e ir cambiándolas más adelante, con el tiempo, si es que nos interesa.

¡Espero que te resulte útil!