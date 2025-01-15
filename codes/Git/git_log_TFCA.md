

```shell

git commit -m "create page 4"

git add nombre_archivo_o_directorio
git status
git commit -m "Mensaje descriptivo del commit"
git log
git push origin nombre_rama


-- ===================================================
git add .                              # Agrega todos los cambios al área de staging
git commit -m "REFACTOR!: Se optimizan funciones ToolScript y se agregan funcionalidades para el sistema"
git log
git push origin

-- ===================================================
git checkout -- .                # Revierte todos los cambios en todos los archivos
git reset HEAD~1                 # Revierte el último commit y mantiene los cambios en el área de staging
git reset --hard HEAD~1          # Revierte el último commit y deshace todos los cambios
git revert <hash_del_commit>     # Crea un nuevo commit que deshace los cambios del commit especificado
-- ===================================================



```