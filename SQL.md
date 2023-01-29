# SQL

~~~sql
CREATE DATABASE estudio; # Crear base de datos
SHOW DATABASES; # Mostrar bases de datos

USE estudio;

CREATE TABLE animales (
	id int PRIMARY KEY,
	tipo varchar(255),
	estado varchar(255)
);

ALTER TABLE animales MODIFY COLUMN id int auto_increment; # Modificar tabla poniendole autoincremental a la columna id

INSERT INTO animales (tipo, estado) VALUES ('chancito', 'feliz'); # Insertar datos en la tabla

SELECT * FROM animales; # Ver los datos de la tabla

SHOW CREATE TABLE animales; # Ver comando crear tabla

CREATE TABLE animales (
	id int NOT NULL AUTO_INCREMENT,
	tipo varchar(255),
	estado varchar(255),
    PRIMARY KEY (id)
);

SELECT * FROM animales WHERE id = 1; -- Busqueda por un id

SELECT * FROM animales WHERE id = 1 AND estado = 'feliz'; -- Busqueda por dos parametros
SELECT * FROM animales WHERE id = 1 OR estado = 'feliz'; -- Busqueda por dos parametros

UPDATE animales SET estado = 'normy' WHERE id=2; -- actualizar un dato 

DELETE from animales  WHERE estado = 'feliz'; -- eliminar una fila
~~~

