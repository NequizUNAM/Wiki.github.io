En este séptimo artículo sobre la **guía para aprender Git de manera sencilla y desde cero**, vamos a ver los Commits semánticos. Los commits semánticos son una especificación para dar significado a los mensajes de los commits haciéndolos legibles para máquinas y humanos. De esta manera establecemos un estándar para nuestros commits.

Para el correcto mantenimiento de un proyecto, se propone una estandarización en los mensajes de commit de tal manera que podamos identificar el tipo de cambio que se añade, además de una breve descripción. Nuestros commits son el guión de la historia de nuestro proyecto.

El objetivo es evitar que se suban al repo commits del tipo «avances», «minor changes» o «bug fixes», y que el historial de Git quede ordenado, estructurado, limpio y profesional. Conseguir uniformidad e imagen presentable del proyecto.

Es un pequeño cambio en el estilo de los mensajes de commit que te convierte en un **mejor programador**. El formato es un identificador de tipo, y a continuación la descripción en presente (y en inglés). Ejemplo:

```bash
feat: add hat wobble
^--^  ^------------^
|     |
|     +-> # Short description for changes.
|
+-------> # Type: chore, docs, feat, fix, refactor, style, or test.
```

Copy

Los diferentes tipos definidos en esta convención son:

- **feat**: Cuando un commit agrega una nueva característica a nuestro software o evoluciona una existente.
- **fix**: Cuando el commit representa una corrección a un error en el código de la aplicación.
- **docs**: Cuando añadamos documentación al proyecto o hagamos cambios sobre la existente.
- **style**: Cuando hay cambios de formato (guía de estilo), se ha olvidado un paréntesis o llave, etc… No se altera el código de producción.
- **refactor**: Cuando se modifica el código de producción, por ejemplo renombrar una variable, simplificar un método, añadir un early return, etc…
- **test**: Cuando se añaden o modifican tests. No se altera el código de producción.
- **chore**: Para tareas rutinarias, por ejemplo actualizar composer, tareas de gulp, modificar el .gitignore, etc… No se altera el código de producción.

## Ámbitos

En ocasiones, para dar más detalle al mensaje se utiliza lo que se conoce como ámbito, para dar más contexto al mensaje, por ejemplo:

```bash
feat(lang): added polish language

feat(parser): add ability to parse arrays
```

Copy

El ámbito se especifica en una palabra entre paréntesis a continuación del tipo de commit.

## ¿Porqué usar este tipo de mensajes?

- Generación automática de CHANGELOGs, podremos escribir el *guión* de nuestra historia.
- Con sólo ver el historial de Git, podemos determinar automáticamente lo que se ha hecho en cada cambio de versión (commits).
- Comunicar la naturaleza de los cambios a los demás integrantes del equipo, el público o cualquier otro interesado.
- Ejecutar procesos de ejecución y publicación.
- Hacer más fácil a otras personas contribuir al proyecto, permitiendo explorar una historia de los commits más estructurada.