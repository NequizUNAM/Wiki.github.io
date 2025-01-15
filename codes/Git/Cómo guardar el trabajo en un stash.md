## Cómo guardar el trabajo en un stash

El comando `git stash` coge los cambios sin confirmar (tanto los que están preparados como los que no), los guarda aparte para usarlos más adelante y, acto seguido, los deshace en el código en el que estás trabajando. Por ejemplo:

```js
$ git status
On branch main
Changes to be committed:

    new file:   style.css

Changes not staged for commit:

    modified:   index.html

$ git stash
Saved working directory and index state WIP on main: 5002d47 our new homepage
HEAD is now at 5002d47 our new homepage

$ git status
On branch main
nothing to commit, working tree clean
```

Llegados a este punto, tienes libertad para hacer cambios, crear confirmaciones, cambiar de rama y efectuar cualesquiera otras operaciones de Git; y, luego, regresar y volver a aplicar el stash cuando lo tengas todo listo.

Ten en cuenta que el stash es local para tu repositorio de Git y que los stashes no se transfieren al servidor cuando subes los cambios al repositorio remoto.

## Cómo volver a aplicar los cambios de un stash

Puedes volver a aplicar los cambios de un stash mediante el comando `git stash pop`:

```scss
$ git status
On branch main
nothing to commit, working tree clean
$ git stash pop
On branch main
Changes to be committed:

    new file:   style.css

Changes not staged for commit:

    modified:   index.html

Dropped refs/stash@{0} (32b3aa1d185dfe6d57b3c3cc3b32cbf3e380cc6a)
```

Al hacer *pop* del stash, se eliminan los cambios de este y se vuelven a aplicar en el código en el que estás trabajando.

Otra opción es volver a aplicar los cambios en el código en el que estás trabajando *y* conservarlos en tu stash mediante el comando `git stash apply`:

```yml
$ git stash apply
On branch main
Changes to be committed:

    new file:   style.css

Changes not staged for commit:

    modified:   index.html
```

Esto resulta útil si quieres aplicar los mismos cambios de un stash en varias ramas.

Ahora que ya conoces los conceptos básicos de los stashes, hay una puntualización sobre el comando `git stash` de la que debes ser consciente: de forma predeterminada, Git *no* guardará en un stash los cambios efectuados en archivos sin seguimiento o ignorados.

## Cómo almacenar en un stash archivos ignorados y sin seguimiento

De forma predeterminada, al ejecutar el comando `git stash`, se guardará en un stash lo siguiente:

- los cambios que se hayan añadido a tu índice (cambios preparados)
- los cambios efectuados en archivos de los que Git está haciendo un seguimiento (cambios sin preparar)

Pero **no** lo siguiente:

- los archivos nuevos del código en el que estás trabajando que todavía no se hayan preparado
- los archivos que se hayan [ignorado](https://www.atlassian.com/es/git/tutorials/saving-changes/gitignore)

Así pues, si añadimos un tercer archivo al ejemplo anterior, pero no lo preparamos (es decir, si no ejecutamos el comando `git add`), `git stash` no lo guardará en el stash.

```yml
$ script.js

$ git status
On branch main
Changes to be committed:

    new file:   style.css

Changes not staged for commit:

    modified:   index.html

Untracked files:

    script.js

$ git stash
Saved working directory and index state WIP on main: 5002d47 our new homepage
HEAD is now at 5002d47 our new homepage

$ git status
On branch main
Untracked files:

    script.js
```

Si añadimos la opción `-u` (o `--include-untracked`), se indica a `git stash` que también guarde en el stash los archivos sin seguimiento:

```js
$ git status
On branch main
Changes to be committed:

    new file:   style.css

Changes not staged for commit:

    modified:   index.html

Untracked files:

    script.js

$ git stash -u
Saved working directory and index state WIP on main: 5002d47 our new homepage
HEAD is now at 5002d47 our new homepage

$ git status
On branch main
nothing to commit, working tree clean
```

También puedes incluir los cambios en los archivos [ignorados](https://www.atlassian.com/git/tutorials/gitignore) utilizando la opción `-a` (o `--all`) al ejecutar el comando `git stash`.

![Opciones de git stash](git%20stash%20C%C3%B3mo%20guardar%20los%20cambios%20Atlassian%20Git%20Tutorial_files/01.svg)

## Cómo gestionar varios stashes

No tienes por qué limitarte a un solo stash. De hecho, puedes ejecutar `git stash` varias veces para crear varios stashes y, luego, usar `git stash list` para verlos. De forma predeterminada, los stashes se identifican simplemente mediante el acrónimo "WIP" (o "work in progress", que significa "trabajo en curso") en la parte superior de la rama y la confirmación a partir de las cuales creaste el stash. Pasado un tiempo, puede costar acordarse del contenido de cada stash:

```js
$ git stash list
stash@{0}: WIP on main: 5002d47 our new homepage
stash@{1}: WIP on main: 5002d47 our new homepage
stash@{2}: WIP on main: 5002d47 our new homepage
```

Para contextualizar un poquito más, es recomendable comentar los stashes con una descripción mediante el comando `git stash save "mensaje"`:

```js
$ git stash save "add style to our site"
Saved working directory and index state On main: add style to our site
HEAD is now at 5002d47 our new homepage

$ git stash list
stash@{0}: On main: add style to our site
stash@{1}: WIP on main: 5002d47 our new homepage
stash@{2}: WIP on main: 5002d47 our new homepage
```

De forma predeterminada, `git stash pop` volverá a aplicar el último stash creado: `stash@{0}`.

Puedes elegir el stash que deseas volver a aplicar poniendo su identificador como último argumento, por ejemplo:

```scss
$ git stash pop stash@{2}
```

## Cómo ver las diferencias en un stash

Puedes visualizar un resumen de un stash mediante el comando `git stash show`:

```undefined
$ git stash show
 index.html | 1 +
 style.css | 3 +++
 2 files changed, 4 insertions(+)
```

Otra opción es utilizar la opción `-p` (o `--patch`) para ver todas las diferencias de un stash:

```bash
$ git stash show -p
diff --git a/style.css b/style.css
new file mode 100644
index 0000000..d92368b
--- /dev/null
+++ b/style.css
@@ -0,0 +1,3 @@
+* {
+  text-decoration: blink;
+}
diff --git a/index.html b/index.html
index 9daeafb..ebdcbd2 100644
--- a/index.html
+++ b/index.html
@@ -1 +1,2 @@
+<link rel="stylesheet" href="style.css"/>
```

## Stashes parciales

También puedes optar por guardar en un stash solo un archivo, una colección de archivos o cambios sueltos de los archivos. Si utilizas la opción `-p` (o `--patch`) en el comando `git stash`, este irá iterando cada uno de los "hunks" modificados del código en el que estás trabajando y te preguntará si quieres guardarlo en un stash:

```bash
$ git stash -p
diff --git a/style.css b/style.css
new file mode 100644
index 0000000..d92368b
--- /dev/null
+++ b/style.css
@@ -0,0 +1,3 @@
+* {
+  text-decoration: blink;
+}
Stash this hunk [y,n,q,a,d,/,e,?]? y
diff --git a/index.html b/index.html
index 9daeafb..ebdcbd2 100644
--- a/index.html
+++ b/index.html
@@ -1 +1,2 @@
+<link rel="stylesheet" href="style.css"/>
Stash this hunk [y,n,q,a,d,/,e,?]? n
```

![git stash -p](git%20stash%20C%C3%B3mo%20guardar%20los%20cambios%20Atlassian%20Git%20Tutorial_files/02.svg)

Puedes pulsar **?** para ver una lista completa de los comandos para los hunks. Los siguientes suelen resultar útiles:

| **Comando** | **Descripción**                                              |
| ----------- | ------------------------------------------------------------ |
| */*         | buscar un hunk mediante expresiones regulares                |
| *?*         | Ayuda                                                        |
| *n*         | no guardar este hunk en un stash                             |
| *q*         | salir (se guardarán en un stash todos los hunks ya seleccionados) |
| *s*         | dividir este hunk en otros más pequeños                      |
| *y*         | guardar este hunk en un stash                                |

No hay ningún comando explicito para "anular", pero si pulsas `CTRL+C` (SIGINT) se anulará el proceso de guardado en stash.

## Cómo crear una rama a partir de un stash

Si los cambios en la rama difieren de los cambios en el stash, podrías encontrarte con conflictos al hacer pop del stash o al aplicarlo. Lo que puedes hacer es usar `git stash branch` para crear una rama nueva en la que aplicar los cambios del stash:

```js
$ git stash branch add-stylesheet stash@{1}
Switched to a new branch 'add-stylesheet'
On branch add-stylesheet
Changes to be committed:

    new file:   style.css

Changes not staged for commit:

    modified:   index.html

Dropped refs/stash@{1} (32b3aa1d185dfe6d57b3c3cc3b32cbf3e380cc6a)
```

De este modo, se extrae una rama nueva basada en la confirmación a partir de la cual creaste el stash y, después, se hace pop en ella con los cambios del stash.

## Cómo limpiar el stash

Si decides que ya no necesitas algún stash en particular, puedes eliminarlo mediante el comando `git stash drop`:

```scss
$ git stash drop stash@{1}
Dropped stash@{1} (17e2697fd8251df6163117cb3d58c1f62a5e7cdb)
```

También tienes la opción de eliminar todos los stashes mediante el siguiente comando:

```scss
$ git stash clear
```

## Cómo funciona git stash

Si lo único que querías saber era cómo usar `git stash`, ya puedes dejar de leer. Ahora bien, si te pica la curiosidad por saber cómo funciona Git (y `git stash`) entre bambalinas, sigue leyendo.

En realidad, los stashes se codifican en el repositorio como objetos de confirmación. La referencia especial en `.git/refs/stash` te dirige al último stash creado, y el registro de referencias de la referencia del `stash` hace referencia a los stashes creados anteriormente. Es por este motivo por el que nos referimos a los stashes empleando `stash@{n}`: a lo que nos referimos realmente es a la n.ª entrada del registro de referencias de la referencia del `stash`. Dado que un stash es solo una confirmación, puedes inspeccionarla mediante el comando `git log`:

```js
$ git log --oneline --graph stash@{0}
*-.   953ddde WIP on main: 5002d47 our new homepage
|\ \ 
| | * 24b35a1 untracked files on main: 5002d47 our new homepage
| * 7023dd4 index on main: 5002d47 our new homepage
|/ 
* 5002d47 our new homepage
```

En función de lo que hayas guardado en un stash, una sola operación `git stash` creará dos o tres confirmaciones nuevas. Las confirmaciones del diagrama anterior son las siguientes:

- `stash@{0}`, una nueva confirmación para almacenar los archivos en seguimiento que estaban en la copia en la que estabas trabajando cuando ejecutaste `git stash`

- La primera confirmación principal de `stash@{0}`, es decir, la confirmación preexistente que se hallaba en HEAD cuando ejecutaste `git stash`

- La segunda confirmación principal de `stash@{0}`, una nueva confirmación que representa el índice cuando ejecutaste `git stash`

- La tercera confirmación principal de

   

  ```scss
  stash@{0}
  ```

  , una nueva confirmación que representa los archivos sin seguimiento que estaban en la copia en la que estabas trabajando cuando ejecutaste

   

  ```undefined
  git stash
  ```

  . Esta tercera confirmación principal solo se crea en los supuestos siguientes:

  - Si la copia en el que estabas trabajando contenía realmente archivos sin seguimiento.
  - Si especificaste la opción `--include-untracked` o `--all` al invocar `git stash`.

Cómo codifica el comando `git stash` tu árbol de trabajo y tu índice como confirmaciones:

- Antes de ejecutar el comando stash, el árbol de trabajo podía contener cambios en archivos con seguimiento, sin seguimiento e ignorados. Además, algunos de estos cambios podrían estar preparados en el índice.

  ![Antes de ejecutar el comando stash](git%20stash%20C%C3%B3mo%20guardar%20los%20cambios%20Atlassian%20Git%20Tutorial_files/03.svg)

- Si invocas `git stash`, todos los cambios efectuados en los archivos con seguimiento se codifican como dos confirmaciones nuevas en el DAG: una para los cambios sin preparar y la otra para los cambios preparados en el índice. La referencia especial `refs/stash` se actualiza para apuntar hacia ellos.

  ![git stash](git%20stash%20C%C3%B3mo%20guardar%20los%20cambios%20Atlassian%20Git%20Tutorial_files/04.svg)

- Si utilizas la opción `--include-untracked`, también se codifican todos los cambios efectuados en los archivos sin seguimiento como una confirmación adicional.

  ![git stash --include-untracked](git%20stash%20C%C3%B3mo%20guardar%20los%20cambios%20Atlassian%20Git%20Tutorial_files/05.svg)

- Si utilizas la opción `--all`, se incluyen todos los cambios efectuados en todos los archivos ignorados, así como los realizados en los archivos sin seguimiento de la misma confirmación.

  ![git Stash --all](git%20stash%20C%C3%B3mo%20guardar%20los%20cambios%20Atlassian%20Git%20Tutorial_files/06.svg)

  

Cuando ejecutas el comando `git stash pop`, los cambios de las confirmaciones anteriores se emplean para actualizar el código y el índice con el que estás trabajando, y el registro de referencias del stash se ordena aleatoriamente para eliminar la confirmación de la que se ha hecho pop. Ten en cuenta que las confirmaciones de las que se ha hecho pop no se eliminan inmediatamente, sino que se convierten en candidatas para la futura recopilación de basura.