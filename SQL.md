# SQL

### Create

~~~mysql
-- Crear base de datos
CREATE DATABASE estudio; 
 
-- Mostrar bases de datos
SHOW DATABASES;

USE estudio;

CREATE TABLE animales (
	id int PRIMARY KEY,
	tipo varchar(255),
	estado varchar(255)
);

CREATE TABLE animales (
	id int NOT NULL AUTO_INCREMENT,
	tipo varchar(255),
	estado varchar(255),
    PRIMARY KEY (id)
);

-- Llave foranea
create table productos (
    id int not NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) not null,
    created_by int not NULL,
    marca VARCHAR(50) not NULL,
    FOREIGN key(created_by) REFERENCES user(id)  
);

-- CREATE TABLE "usuarios" -------------------------------------
CREATE TABLE IF NOT EXISTS `usuarios`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`nombre` VarChar( 16 ) NOT NULL,
	`contrasenia` VarChar( 35 ) NOT NULL,
	`email` VarChar( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `unique_id` UNIQUE( `id` ),
	CONSTRAINT `unique_nombre` UNIQUE( `nombre` ),
	CONSTRAINT `unique_contrasenia` UNIQUE( `contrasenia` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------
~~~

### Edit

~~~mysql
-- Modificar tabla poniendole autoincremental a la columna id
ALTER TABLE animales MODIFY COLUMN id int auto_increment; 
-- Ver los datos de la tabla
SELECT * FROM animales; 
-- Ver comando crear tabla
SHOW CREATE TABLE animales; 
~~~

### Insert

~~~mysql
-- Insertar datos en la tabla
INSERT INTO animales (tipo, estado) VALUES ('chancito', 'feliz'); 

-- Insertar varios valores
insert into productos (name, created_by, marca)
VALUES
    ('ipad', 1, 'apple'),
    ('ipod', 2, 'apple'),
    ('iMac', 2, 'apple'),
    ('iphone', 3, 'apple')
    ;
~~~

### Select

~~~sql
 -- Busqueda por un id
SELECT * FROM animales WHERE id = 1;
 -- Busqueda por dos parametros
SELECT * FROM animales WHERE id = 1 AND estado = 'feliz';
 -- Busqueda por dos parametros
SELECT * FROM animales WHERE id = 1 OR estado = 'feliz';
-- actualizar un dato 
UPDATE animales SET estado = 'normy' WHERE id=2; 
-- eliminar una fila
DELETE from animales  WHERE estado = 'feliz'; 

-- Condicion where
SELECT * from user where edad >= 22;
-- Condicion where con or
SELECT * from user where edad >= 22 or email != 'Correo3@gmail.com';
-- Condicion where con between
SELECT * from user where edad BETWEEN 15 and 23;
-- Que contenga la cadena 'gmail' en algun lado, no importa que tenga antes o despues
-- El porcentaje indica el comodin de antes o despues de la cadena
SELECT * from user where email like '%gmail%'

-- Obtener solo las columnas ed id, name de la tabla user
SELECT id, name From user;

-- Obtener solo las columnas ed id, name de la tabla user, con los nombres de las columnas con alias
SELECT id as DNI, name as nombre From user;
~~~

### Order

~~~mysql
-- Ordenenar el resultado de manera ascendente, descendente es con DESC
SELECT * from user order by edad asc;

-- Obtener la edad mayor y darle el nombre de mayor, el valor menor es con MIN()
SELECT max(edad) as mayor from user;
~~~

## Join

~~~mysql
-- Left join, trae todo lo de la tabla de la izquierda y lo que coincida de la derecha
SELECT u.id, u.email, p.name from user u LEFT JOIN productos p on u.id = p.created_by;

-- Right join, trae todo lo de la tabla de la derecha y lo que coincida de la izquierda
SELECT u.id, u.email, p.name from user u RIGHT JOIN productos p on u.id = p.created_by;

-- Inner join, trae todo lo de las tablas que tenga datos en ambas
SELECT u.id, u.email, p.name from user u INNER JOIN productos p on u.id = p.created_by;
~~~

## Group by

~~~mysql
-- Contar la cantidad de registros agrupadas por marca
select count(id), marca from productos group by marca

-- Contar resultados por group con join
SELECT COUNT(p.id), u.name from productos p LEFT JOIN user u on u.id = p.created_by GROUP by p.created_by;

-- Contar resultados por group con join
SELECT 
    COUNT(p.id), u.name 
from 
    productos p 
LEFT JOIN 
    user u 
on 
    u.id = p.created_by 
GROUP by 
    p.created_by;
~~~

### Eliminar tabla 

~~~mysql
-- Eliminar tabla
drop table 
    productos;
    
~~~

## Ejemplos

~~~mysql
-- CREATE TABLE "usuarios" -------------------------------------
CREATE TABLE `usuarios`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`nombre` VarChar( 255 ) NOT NULL,
	`contrasenia` VarChar( 255 ) NOT NULL,
	`email` VarChar( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `unique_email` UNIQUE( `email` ),
	CONSTRAINT `unique_id1` UNIQUE( `id` ),
	CONSTRAINT `unique_nombre1` UNIQUE( `nombre` ) );
-- -------------------------------------------------------------
-- CREATE TABLE "brand" ----------------------------------------
CREATE TABLE `brand`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 45 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `unique_id` UNIQUE( `id` ),
	CONSTRAINT `unique_name` UNIQUE( `name` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- CREATE TABLE "productos" ------------------------------------
CREATE TABLE `productos`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 45 ) NOT NULL,
	`brand_id` Int( 45 ) NOT NULL,
	`created_by` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `unique_id` UNIQUE( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE TABLE "order" ----------------------------------------
CREATE TABLE `order`( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`user_id` Int( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `unique_id` UNIQUE( `id` ) )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE TABLE "tbl_productos_MM_order" -----------------------
CREATE TABLE `tbl_productos_MM_order`( 
	`productos_id` Int( 255 ) NOT NULL,
	`order_id` Int( 255 ) NOT NULL )
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_order_MM_productos" ------------------------
ALTER TABLE `tbl_productos_MM_order`
	ADD CONSTRAINT `lnk_order_MM_productos` FOREIGN KEY ( `order_id` )
	REFERENCES `order`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_productos_MM_order" ------------------------
ALTER TABLE `tbl_productos_MM_order`
	ADD CONSTRAINT `lnk_productos_MM_order` FOREIGN KEY ( `productos_id` )
	REFERENCES `productos`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_usuarios_order" ----------------------------
ALTER TABLE `order`
	ADD CONSTRAINT `lnk_usuarios_order` FOREIGN KEY ( `user_id` )
	REFERENCES `usuarios`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_usuarios_productos" ------------------------
ALTER TABLE `productos`
	ADD CONSTRAINT `lnk_usuarios_productos` FOREIGN KEY ( `created_by` )
	REFERENCES `usuarios`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

-- CREATE LINK "lnk_brand_productos" ---------------------------
ALTER TABLE `productos`
	ADD CONSTRAINT `lnk_brand_productos` FOREIGN KEY ( `brand_id` )
	REFERENCES `brand`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------
~~~

