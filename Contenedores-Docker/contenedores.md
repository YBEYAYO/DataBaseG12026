 # contenedores de sistemas gestores de Base de Datos.

![imagenDocker](/img/docker.png)

## Imagenes.

> comandos para cada imagen

- Descargar imagenen de postgres

```
docker pull postgres:14.22-trixie
```

- Descargar imagen de tutorial de Docker

```
docker pull docker/getting-started:latest
```

## Creacion de contenedores.

```
docekr run -d -p 80:80 ["Nombre o codigo de la imagen "]
```

Donde:
- -d detach (backgraund)
- -p puerto (el primero no se cambia, el segudno si se puede cambiar)

## Contenedores de tutorial de docker.

```
docker run -d -p 80:80 docker/getting-started
```

```
docker run -d -p 80:81 3e4394f6b72f
```

### Contenedores de mariaDB sin volumen.

```
docker run -d --name Server-MariaDBG1 / -p 3343:3306 -e MARIADB_ROOT_PASSWORD=123456 / 8431e
```

### Contenedor de mariaDB con volumen.

```
docker volume create v-mariadbG1
docker run -d --name Server-MariaDBG1 / -p 3343:3306 -e MARIADB_ROOT_PASSWORD=1234 -v v-mariadbg1:/var/lib/postgresql/data/8431e
```

### Contenedores de postgres con volumen.

```
docker volumen create v-postgresg1 /
docker run -d --name Server-PostgresG1 /
-p 5455:5432 -e POSTGRES_PASSWORD=1234 -v v-postgresg1:/var/lib/postgresql/data/900107
```

### Contenedor de SQLServer con volumen

```
docker volumen create v-sqlserverg1 /
docker run -e "ACCEPT_EULA=Y" -e "MSQL_SA_PASSWORD=<password>"/
-p 1433:1433 --name --hostname sql1 /var/opt/mssql/data/
```

### Comandos de docker.
| Comando | Descripcion |

|**docker --version**|_Muestra la version de docker_|

|**docker pull[Nombre de la imagen]**|_DEscarga de una imagen de dockerhub[DockerHub](https://hub.docker.com)_|

|**docker imagenes**|_Muestra las imagenes que tienes_|

|**docker run**|_Permite crear un contenedor_|

|**docker ps**|_Visualiza los contenedores que estan en ejecucion_|

|**docker container ls**|_Visualiza los contenedores que estan en ejecucion_|

|**docker ps -a**|_Visualiza todos los contenedores_|

|**docker container -ls -a**|_Visualiza todos los contenedores_|

|**docker rm [Nombre del contenedor o id del contenedor]**|_Borra el contenedor_|

|**docker run**|_Crea un contenedor_|

|**docker stop [Nombre o id]**|_Detener un contenedor_|

|**docker start**|_Hechar o levantar el contenedor en funciòn_|

|**docker rm**|_Elimina un contenedor que no esta en ejecuciòn_|

|**docker rm -f**|_Elimina un contenedor que esta en ejecucion_|

|**docker volums ls**|_Va a mostrar los volumenes que existen en docker_|

|**docker volums**|_Descripcion_|
