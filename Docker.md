# Docker

Los comandos son precedidos de la palabra docker

| Comando                                                                                                                         | Que hace                                                                               | Observaciones                                                                                                                                              |
| ------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| images                                                                                                                          | Muestra las imagenes que se tienen descargadas                                         |                                                                                                                                                            |
| pull  "nameImg":"tag"                                                                                                           | Descarga la imagen del nombre que le pusimos                                           | el tag es opcional, si no se coloca descarga la imagen con la etiqueta "latest"                                                                            |
| create "nameImg"                                                                                                                | crea el contenedor de la imagen especifica                                             |                                                                                                                                                            |
| create --name "alias" "nameImg"                                                                                                 | Crea un contenedor con un nombre especificado                                          |                                                                                                                                                            |
| ps                                                                                                                              | muestra los datos de las imagenes que se estan ejecutando                              | si se le agrega el "-a" muestra todos los contenedores                                                                                                     |
| start "id/name"                                                                                                                 | Ejecuta la contenedor con el id especificado                                           |                                                                                                                                                            |
| stop "id/name"                                                                                                                  | Detiene el contenedor especificado                                                     |                                                                                                                                                            |
| rm "id/name"                                                                                                                    | Borrar un contenedor                                                                   |                                                                                                                                                            |
| create -p"puertoAExponer":"puertoContenedor"                                                                                    | El -p se usa para mapear puertos en diferentes contenedores                            |                                                                                                                                                            |
| log "id/name"                                                                                                                   | Ver los log del contenedor                                                             | Si se agrega el --follow se queda escuchando nuevos logs                                                                                                   |
| images rm "id/name"                                                                                                             | Borrar una imagen                                                                      |                                                                                                                                                            |
| run "imgName"                                                                                                                   | Descarga, crea y ejecuta un contenedor con el nombre de la imagen en modo log --follow |                                                                                                                                                            |
| run --name alias -p27017:27017 -d nameImg                                                                                       | Todas las opciones anteriores se pueden ir usando                                      | El -d es para que no se quede mostrando los logs, sino nos devuelva a la linea de comandos                                                                 |
| -e varEnvironment=value                                                                                                         | Asignar un valor a una variable de entorno,                                            | si se va a agregar mas de una variable se usa otra vez -e varEn=value                                                                                      |
| create -p27017:27017 --name monguito -e MONGO_INITDB_ROOT_USERNAME=usuario -e MONGO_INITDB_ROOT_PASSWORD=contrasenha mongo-test |                                                                                        | Crear un contenedor basado en la imagen mongo de tal manera que se le den configuraciones con variables de entorno                                         |
| networt ls                                                                                                                      | Listar redes dentro de docker                                                          |                                                                                                                                                            |
| network create nameRed                                                                                                          | crear una red en docker                                                                |                                                                                                                                                            |
| network rm nameRed                                                                                                              | quitar una red en docker                                                               |                                                                                                                                                            |
| build -t nameApp:tag .                                                                                                          | crear una imagen en base a un archivo Dockerfile                                       | -t es para asignar nombre a la app, un tag y por ultimo la ruta de donde esta el archivo Dockerfile.<br />El punto significa que esta en la carpeta actual |
| create ... --network nameRed -e ...                                                                                             | Asignar el contenedor a una red                                                        | Se usa antes de las variables ambientales o luego del --name                                                                                               |

---

## Dockerfile

* From, nos dice en base a que imgen se va a basar nuestra imagen 
* RUN es donde va a estar el codigo fuente del contenedor
* COPY, ruta del anfintrion donde tiene el codigo y luego la ruta del contenedor donde va a quedar
* EXPOSE, que puerto va a exponer
* CMD, ejecutar un comando en consola, primero el comando y luego sus argumentos

```dockerfile
FROM node:18

RUN mkdir -p /home/app

COPY . /home/app

EXPOSE 3000

CMD ["node", "/home/app/index.js"]
```

## Images

```bash
## MySQL
docker run -d -p 3306:3306 --name mysql-db -e MYSQL_ROOT_PASSWORD=admin mysql
## rabbitmq
docker run -t -i --name rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:3-management
## mongo
docker run --name mongoDB -v D:\Docker-Volumns:/etc/mongo -p 27017:27017 -d mongo:3
## Postgres, el user por default es postgres
docker run -p 5432:5432 --name some-postgres -e POSTGRES_PASSWORD=pass -d postgres
```
