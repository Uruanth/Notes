# Control de versiones

| COMANDOS                                   | DESCRIPCIÓN                                                                                                                                                                       |
| ------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| git init                                   | Iniciar la carpeta par el uso de git                                                                                                                                              |
| git status                                 | Ver los cambios que no se agregado a la version anterior                                                                                                                          |
| git add .                                  | Agregar archivos para enviar a la nueva version, el punto es para agregar todos los archivos                                                                                      |
| git add nombreArchivo                      | Para agregar un solo archivo, en el nombre se incluye la extención de este                                                                                                        |
| git add *.css                              | Agregar solo lo que cumple con la condición de la extension, este caso css.                                                                                                       |
| git commit                                 | Confirmar los archivos que se han agregado que estan listos para enviar                                                                                                           |
| git commit -m "mensaje"                    | Enviar el msj del commit de una vez desde consola entre las " "                                                                                                                   |
| git diff                                   | Ver la diferencia de lo que se tiene, con el ultimo commit que se hizo                                                                                                            |
| git checkout .                             | Volver al ultimo commit realizado                                                                                                                                                 |
| git log                                    | Ver los diferentes puntos de los commit                                                                                                                                           |
| git log --oneline --decorate --all --graph | Forma de ver las ramas y otras cosas                                                                                                                                              |
| git reset                                  | Remover archivos que se agregaron pero no se le ha dado commit, funciona notaciones adicionales como las add                                                                      |
| git help commit                            | Da informacion del comando despues del help                                                                                                                                       |
| git commit --amend -m "mensaje"            | Para modificar el mensaje del ultimo commit realizado antes del push                                                                                                              |
| git mv nombreArchivo nuevoNombre           | Cambiar el nombre de un archivo, si ya se uso el add con este archivo no es necesario volver a hacer add.                                                                         |
| git rm nombreArchivo                       | remover el archivo                                                                                                                                                                |
| git reset --soft idCommit                  | Volver al estado como estaba el commit escogido. El id es el que sale luego de commit al usar git log. Si se cambia --soft a --hard, se restauran tambien los archivos eliminados |
| git reflog                                 | Ver historial de commit, incluso los reset, pero con menos datos que un git log                                                                                                   |
| git reset --mixed                          | No lo entendi bien, es como volver a un commit anterior pero no afecta archivos, los mantiene                                                                                     |
| git branch nombreRama                      | Agregar una nueva rama                                                                                                                                                            |
| git checkout nombreRama                    | Posicionarse en la rama seleccionada                                                                                                                                              |
| git merge nombreRama                       | Une las ramas, la que estas en posicionado y con la que le indicas.                                                                                                               |
| git branch -d nombreRama                   | Eliminar la rama especificada                                                                                                                                                     |
| git checkout -b nombreRama                 | Crear y posicionarse en una nueva rama.                                                                                                                                           |
| git push                                   | subir los cambios despues del commit al github                                                                                                                                    |
| git pull                                   | Traer los cambios de github                                                                                                                                                       |
| git tag nombreTag                          | Agregar una etiqueta a un commit                                                                                                                                                  |
| git tag -d nombreTag                       | Eliminar una etiqueta                                                                                                                                                             |
| git tag -a v1.0.0 -m "mensaje"             | Agregar etiqueta con un msjs adicional                                                                                                                                            |
| git show v1.0.0                            | Muestra la información hasta el commit que tenga la etiqueta v1.0.0                                                                                                               |
| git tag -a v1.0.0 idCommit                 | Para agregar una etiqueta a un commit especifico                                                                                                                                  |

## Alias git

Con el comando:

```powershell
git config --global alias.l "log"

## Este es para ver los logs de forma mas bonita
```

Se hace que el comando log ahora se pueda invocar solo con la letra "l", de tal manera que las dos siguientes líneas se muestra, ambas son iguales:

```powershell
git log
git l
```

## .gitignore

 Primero crear un archivo llamado ".gitignore". Todo lo que este en este archivo no se toma encuenta para el comando app ni pasos posteriores (commit push)

```tex
nomnbreArchivoAIgnorar
*todoLoQueTermineEnEsto
TodoLoQueEmpieceConEsto*
/nombreCarpeta
.extencion 
```

Los merge con conflicto se deben solucionar de manera manual.

Git fork es duplicar un repositorio en nuestra cuenta personal.

El id del commit se puede ver con git log o git reflog

El pull request es para solicitar unir un fork con el repositorio original, aceptar o negar sugerencias.    

Comandos git https://gist.github.com/dasdo/9ff71c5c0efa037441b6

## Nomenclatura de las versiones

Esta depende de los lineamientos de los diferentes empresas y/o tecnologia. Se puede usar versionamiento por:

* Número
* Estabilidad
