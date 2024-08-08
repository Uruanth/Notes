# ORACLE SQL 

## Imagen de docker de Oracle Database

https://hub.docker.com/r/gvenzl/oracle-xe

# Quick Start

Run a new database container (data is removed when the container is removed, but kept throughout container restarts):

```shell
docker run -d -p 1521:1521 -e ORACLE_PASSWORD=<your password> gvenzl/oracle-xe
```

Run a new persistent database container (data is kept throughout container lifecycles):

```shell
docker run -d -p 1521:1521 -e ORACLE_PASSWORD=<your password> -v oracle-volume:/opt/oracle/oradata gvenzl/oracle-xe
```

Run a new persistent **11g R2** database container (volume path differs in 11g R2):

```shell
docker run -d -p 1521:1521 -e ORACLE_PASSWORD=<your password> -v oracle-volume:/u01/app/oracle/oradata gvenzl/oracle-xe:11
```

Reset database `SYS` and `SYSTEM` passwords:

```shell
docker exec <container name|id> resetPassword <your password>
```

## CREAR USUARIO

~~~plsql
--CREACION DEL USUARIO
alter session set "_ORACLE_SCRIPT"=true;
CREATE USER perry_user IDENTIFIED BY contrasenha
DEFAULT TABLESPACE SYSTEM
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON SYSTEM;

--CREACION DEL USUARIO
CREATE USER C##PERRY IDENTIFIED BY contrasenha
DEFAULT TABLESPACE SYSTEM
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON SYSTEM;


--PRIVILEGIOS DE USUARIO
GRANT CREATE SESSION TO C##PERRY;
GRANT CREATE TABLE TO C##PERRY;
GRANT CREATE VIEW TO C##PERRY;
GRANT CREATE PROCEDURE TO C##PERRY;
GRANT CREATE SEQUENCE TO C##PERRY;


--PRIVILEGIO DE ADMINIST4RAR TABLAS
GRANT ALL ON nombreTabla TO C##PERRY;

--REVOCAR TODOS LOS PRIVILEGIOS SOBRE LA TABLA
REVOKE ALL ON nombreTabla FROM C##PERRY;

--BORRAR UN USUARIO
DROP USER C##PERRY CASCADE;
~~~

## CREAR TABLA

~~~plsql
CREATE TABLE nombreTabla(
    atributo1 int NOT NULL PRIMARY KEY,
    atributo2 char(10),
    atributo3 date,
    atributo4 varchar(40) DEFAULT 'Valor',
    atributo number(6,2), --numero de maximo 6 cifras con solo dos decimales
	PRIMARY KEY(atributoN) 
);

--BORRAR TABLA
DROP TABLE nombreTabla;

--ASIGNAR UNA LLAVE FORANEA A UNA TABLA CREADA
ALTER TABLE nombreTabla
ADD CONSTRAINT fk_nombreLlave
FOREIGN KEY (nombreColumna)
REFERENCES nombreTablaReferencia(nombreColumnaReferencia);

--BORRAR LLAVE F
ALTER TABLE nombreTabla
DROP CONSTRAINT fk_nombreLlave;
~~~

## CONSULTAR TABLA

~~~plsql
SELECT * FROM nombreTabla;
SELECT atributoN AS 'W' FROM nombreTabla;


--DESCRIPCION TABLA
DESCRIBE nombreTabla;
~~~

## IINSERTAR DATOS

~~~plsql
INSERT INTO nombreTabla VALUES(000, 'valor', DEFAULT, 'otra cadena', TO_DATE('10/03/1998','dd/mm/yyyy'));  
~~~

## BORRAR DATOS

~~~plsql
DELETE FROM nombreTabla WHERE atributo = 'valor';

--BORRAR TODOS LOS DATOS PERO SE PUEDEN RECUPERAR
DELETE FROM nombreTabla;

--BORRAR TODOS LOS DATOS PERO NO SE PUEDEN RECUPERAR
TRUNCATE TABLE nombreTabla;
~~~

## ACTUALIZAR

~~~plsql
UPDATE nombreTabla SET atrinuto = 'valor' WHERE atrinutN = 'Valor '
~~~

## ROLLBACK

~~~plsql
--REGRESAR UN PASO ATRAS
ROLLBACK;
~~~

## CONCATENAR

~~~plsql
--Trae los dos atributos en una sola columna
SELECT atributo1 ||' - '|| atributo2 FROM nombreTabla;
~~~

## FUNCIONES STRING

~~~plsql
 -- consultar numero de caracter en codigo ASCII
select chr(100) from dual;--dice el caracter que tiene ese numero
select ascii('d') from dual;--dice que numero tiene ese caracter

--funcion concat: sirve para unir cadenas de carácteres
select concat('buenas','tardes') from dual;

--funcion initcap: coloca primera letra en mayúscula
select initcap('buenas tardes') from dual;

--funcion lower: coloca todas las letras en minúscula
select lower('BUENAS TARDES') from dual;

--funcion upper: coloca todas las letras en mayúscula
select upper('buenas tardes') from dual;

--funcion lpad: completa los carácteres del lado derecho con la cantidad que le indiquen
select lpad('oracle',8,'abc') from dual;

--funcion rpad: completa los carácteres del lado izquierdo con la cantidad que le indiquen
select rpad('oracle',12,'abc') from dual;

--funcion ltrim: corta del lado derecho los carácteres que le indiquen
select ltrim('curso de oracle','cur')from dual;

--funcion rtrim: corta del lado izquierdo los carácteres que le indiquen
select rtrim('curso de oracle','cle')from dual;

--funcion trim: corta de ambos lados los carácteres que le indiquen
select trim('  oracle  ') from dual;

--funcion replace: reemplaza la letra indicada con la que se requiera
select replace('www.oracle.com','o','a') from dual;

--funcion substr: busca la o las letras dentro de la palabra indicada en el rango que se le indique
select substr('www.oracle.com',1,14) from dual;--de izquierda a derecha

select substr('www.oracle.com',-13) from dual;--de derecha a izquerda

--funcion length: dice cuantas letras tiene una palabra
select length('www.oracle.com') as cantidad from dual;

--funcion instr: dice en que punto esta una palabra o letra dentro de la indicada
select instr('curso de oracle sql','ma') from dual;

--funcion translate: reemplaza las letras indicadas con las requeridas
select translate('CURSO DE ORACLE','AOE','XYZ') from dual;
~~~

## FUNCIONES MATEMATICAS

~~~plsql
--función abs: trae el valor absoluto de un número
select abs(50) from dual;

--función ceil: redondea hacia arriba una cifra decimal
select ceil(15.50) from dual;

--función floor: redondea hacia abajo una cifra decimal
select floor(13.30) from dual;

--función mod: muestra el residuo de dividir dos enteros
select mod(10,2) from dual;

--función power: muestra un valor elevado a la potencia
select power(10,3) from dual;

--función round: redondea un valor decimal tantas posiciones como se le indique
select round(123.456,1) from dual;

--función sign: identifica la naturaleza de una cifra (1)positivo, (-1)negativo
select sign(100) from dual;

--función trunc:corta la cantidad decimal tanto como se le indique
select trunc(1234.1234,1) from dual;

--función sqrt: trae raiz cuadrada de un entero
select round(sqrt(27)) from dual;
~~~

## FUNCIONES DATE

~~~plsql
--funcion add_months: busca la fecha en la cantidad de meses indicada
select add_months(to_date('10/10/2020','dd/mm/yyyy'),5) from dual;--agrega meses

select add_months(to_date('10/1z0/2020','dd/mm/yyyy'),-5) from dual;--resta meses
-------------------------------------------------------------
--funcion last_day: trae el ultimo dia del mes de la fecha ingresada
select last_day(to_date('09/02/2020','dd/mm/yyyy')) from dual;
----------------------------
--funcion months_between: indica cuantos meses hay entre las fechas colocadas
select months_between(to_date('19/05/2020','dd/mm/yyyy'),to_date('19/06/2020','dd/mm/yyyy')) as meses from dual;
-------------------------
--funcion next_day: indica la fecha del próximo dia indicado en el argumento
select next_day(to_date('17/08/2020','dd/mm/yyyy'),'TUESDAY') from dual;
------------------------------
--funcion current_date: indica la fecha calendario
select current_date from dual;
------------------------------
--funcion sysdate: indica la fecha de la base datos
select sysdate from dual;
-------------------------------
--funcion current_timestamp: indica la fecha y hora regional
select current_timestamp from dual;
-----------------------------------
--funcion systimestamp: indica la fecha y hora en la base de datos
select systimestamp from dual;
------------------------------------
--funcion to_char: trae la fecha colocada en modo de string
select to_char('10/10/2020') from dual;
~~~

## ORDER BY

~~~plsql
--ORDENAR DE FORMA ASCENDENTE
SELECT * FROM nombreTabla ORDER BY atributo ASC;

--ORDENAR DE FORMA DESCENDENTE
SELECT * FROM nombreTabla ORDER BY atributo DESC;

--ORDENAR DE FORMA ASCENDETE LA COLUMNA 1
SELECT * FROM nombreTabla ORDER BY 1 ASC;
~~~

## AND, OR y NOT

~~~plsql
--TRAE TODOS LOS DATOS QUE CUMPLAN CON ALGUNO O LOS DOS CONDICIONALES
SELECT * FROM nombreTabla WHERE atributoN='valor' OR atributoN='valor';

--TRAE TODOS LOS DATOS QUE CUMPLAN LAS DOS CONDICIONALES
SELECT * FROM nombreTabla WHERE atributoN='valor' AND atributoN > 0;

--TRAE TODOS LOS DATOS QUE NO TIENEN EL ATRIBUTON CON EL VALOR INDICADO
SELECT * FROM nombreTabla WHERE NOT atributoN='valor';

~~~

## BETWEEN

~~~plsql
--Buscar todos los datos donde un atributo este entre 1 y 15
SELECT * FROM nombreTabla WHERE atributo BETWEEN 1 and 15;


--Buscar todos los datos donde un atributo este entre las fechas '01-dic-2017' y '01-dic-2018'
SELECT * FROM nombreTabla WHERE atributo BETWEEN '01-dic-2017' and '01-dic-2018';
~~~

## IN

  ~~~plsql
  --CONSULTA LAS ENTRADAS QUE TENGAN EN EL ATRIBULO LOS VALORES DADOS
  SELECT * FROM nombreTabla WHERE IN atributo IN('valor1', 'valorN');
  
  --CONSULTA LAS ENTRADAS QUE NO TENGAN EN EL ATRIBULO LOS VALORES DADOS
  SELECT * FROM nombreTabla WHERE IN atributo NOT IN('valor1', 'valorN');
  
  --EXTRAE EL AÑO DEL ATRIBUTO Y LO USA PARA HACER LA CONSULTA CON EL "IN"
  SELECT * FROM nombreTabla WHERE EXTRACT(YEAR FROM atributoTipoDate) IN(2020, 2022);
  ~~~

## LIKE / NOT LIKE

Comparadores exclusivos para cadenas de texto

~~~plsql
--BUSCA TODA COINCIDENCIA DEL VALOR DENTRO DEL ATRIBUTO, NO TIENE QUE COINCIDIR TODA LA CADENA SOLO CONTENER EL VALOR
SELECT * FROM nombreTabla WHERE atributo LIKE '%valor%';

--BUSCA TODA COINCIDENCIA DEL QUE NO TENGA EL VALOR DENTRO DEL ATRIBUTO, NO TIENE QUE COINCIDIR TODA LA CADENA SOLO CONTENER EL VALOR
SELECT * FROM nombreTabla WHERE atributo LIKE '%valor%';

--BUSCA TODA COINCIDENCIA DEL VALOR DENTRO DEL ATRIBUTO, TIENE QUE COINCIDIR EL INICIO CON EL VALOR
SELECT * FROM nombreTabla WHERE atributo LIKE 'valor%';

--BUSCA TODA COINCIDENCIA DEL VALOR DENTRO DEL ATRIBUTO, TIENE QUE COINCIDIR EL FINAL CON EL VALOR
SELECT * FROM nombreTabla WHERE atributo LIKE '%valor';

--BUSCA TODA COINCIDENCIA DEL VALOR DENTRO DEL ATRIBUTO, TIENE QUE COINCIDIR EL VALOR Y CONTENER DESPUES EL VALOR2 EN CUALQUIER LUGAR
SELECT * FROM nombreTabla WHERE atributo LIKE 'valor%valor2%';

--BUSCA SOLO LOS QUE INICIEN CON v Y EL NUMERO EXACTO DE CARACTERES ADICIONALES COMO _ HAY
SELECT * FROM nombreTabla WHERE atributo LIKE 'v____';
~~~

## COUNT

~~~plsql
--Ignora campos nulos
SELECT COUNT(atributo) FROM nombreTabla;
~~~

## MAX / MIN / SUM / AVR

~~~plsql
SELECT MAX(atributo) FROM nombreTabla;
SELECT MIN(atributo) FROM nombreTabla;
SELECT SUM(atributo) FROM nombreTabla;
SELECT AVR(atributo) FROM nombreTabla;
~~~

## HAVING

~~~plsql
/*Buscar todos las entradas en la tabla donde el atributo contiene VALOR y se }
agrupam por un atributo que contandolo es menor que 2*/
SELECT * FROM nombreTabla 
WHERE atributo 
LIKE '%VALOR%' 
GROUP BY atributo 
HAVING COUNT(*)<2;
~~~

## DISTINCT

~~~plsql
--Trae todos los atributos diferentes en todas las entradas del atributo mencionado
SELECT DISTINCT atributo FROM nombreTabla;
~~~

  ## SECUENCIAS

~~~plsql
--SON TABLAS CON UN UNICO CAMPO NUMERICO ENTERO, INICIA EN UN NUMERO ESPECIFICO Y TERMINA EN OTRO, SE REPITE CICLICAMENTE. EL INCREMENTO ES CONSTANTE Y TAMBIEN DEFINIDO AL CREARLA

--CREAR UNA SECUENCIA, EMPIEZA EN 1, INCREMENTA EN 1 CADA VEZ Y EL MAXIMO VA A SER 9999
CREATE SEQUENCE nombreSecuencia
START WITH 1
INCREMENT BY 1
MAXVALUE 9999
MINVALUE 1
CYCLE;

--Valor actual que va la secuencia
nombreSecuencia.currrval
--Aumentar el valor de la secuencia
nombreSecuencia.nextval
~~~

## AGREGAR PRIMARY KEY LUEGO A UNA TABLA EXISTENTE

~~~plsql
ALTER TABLE nombreTabla
ADD CONSTRAINT nombreContraint --Ejemplo codigo_pk
PRIMARY KEY (atrinuto); --EL ATRIBUTO QUE SERA AHORA CLAVE PRIMARIA

--QUITAR LA LLAVE PRIMARIA
ALTER TABLE nombreTabla
DROP CONSTRAINT nombreContrain;
~~~

## UNIQUE

~~~plsql
ALTER TABLE nombreTabla
ADD CONSTRAINT nombreContraint --Ejemplo uq_atributo
UNIQUE (atrinuto); --EL ATRIBUTO QUE SERA AHORA CLAVE PRIMARIA

--QUITAR EL CONSTRAINT
ALTER TABLE nombreTabla
DROP CONSTRAINT nombreContrain;
~~~

## CHECK

~~~plsql
ALTER TABLE nombreTabla
ADD CONSTRAINT nombreContraint --Ejemplo uq_atributo
CHECK (atrinuto>=0 AND atributo<100); --EL ATRIBUTO DEBERA CUMPLIR LA CONDICION 

ALTER TABLE nombreTabla
ADD CONSTRAINT nombreContraint --Ejemplo uq_atributo
CHECK (atrinuto IN('ASD', 'ASDASD','AAAA')); --EL ATRIBUTO DEBERA CUMPLIR LA CONDICION 

ALTER TABLE nombreTabla
ADD CONSTRAINT nombreContraint --Ejemplo uq_atributo
CHECK (atrinuto IS NOT NULL)); --EL ATRIBUTO DEBERA CUMPLIR LA CONDICION 

--QUITAR EL CONSTRAINT
ALTER TABLE nombreTabla
DROP CONSTRAINT nombreContrain; 
~~~

## JOIN

El uso de prefijos c y p es para identificar cada tabla. para 

~~~plsql
SELECT c.atributo1, atributo2, p.atributoN
FROM nombreTabla1 c
JOIN nombreTabla2 p
--Esta es la condición para que se de el join entre las tablas
ON c.atributoX = p.atributoY; 

--LEFT JOIN 
SELECT c.atributo1, atributo2, p.atributoN
FROM nombreTabla1 c
LEFT JOIN nombreTabla2 p
--Esta es la condición para que se de el join entre las tablas
ON c.atributoX = p.atributoY;

--RIGHT JOIN 
SELECT c.atributo1, atributo2, p.atributoN
FROM nombreTabla1 c
RIGHT JOIN nombreTabla2 p
--Esta es la condición para que se de el join entre las tablas
ON c.atributoX = p.atributoY;

--FULL JOIN 
SELECT c.atributo1, atributo2, p.atributoN
FROM nombreTabla1 c
FULL JOIN nombreTabla2 p
--Esta es la condición para que se de el join entre las tablas
ON c.atributoX = p.atributoY;

--CROSS JOIM
SELECT c.atributo1, atributo2, p.atributoN
FROM nombreTabla1 c
CROSS JOIN nombreTabla2;
--ESTA PARTE ES OPCIONAL
WHERE c.atributoX = p.atributoY;
~~~

## UNION

~~~plsql
--TRAE TODOS LOS DATOS DE LAS DOS TABLAS SIN DUPLICADOS
SELECT atributo1, atributo2, atributoN FROM nombreTabla1
UNION
SELECT atributo1, atributo2, atributoN FROM nombreTabla2;

--TRAE TODOS LOS DATOS DE LAS DOS TABLAS CON DUPLICADOS
SELECT atributo1, atributo2, atributoN FROM nombreTabla1
UNION ALL
SELECT atributo1, atributo2, atributoN FROM nombreTabla2;
~~~

## INTERSECT

~~~plsql
--TRAE TODOS LOS DATOS COMUNES ENTRE LAS DOS TABLAS
SELECT atributo1, atributo2, atributoN FROM nombreTabla1
INTERSECT
SELECT atributo1, atributo2, atributoN FROM nombreTabla2;
~~~

## MINUS

~~~plsql
--TRAE TODOS LOS DATOS DIFERENTES ENTRE LAS DOS TABLAS
SELECT atributo1, atributo2, atributoN FROM nombreTabla1
MINUS
SELECT atributo1, atributo2, atributoN FROM nombreTabla2;
~~~

## AGREGAR / QUITAR COLUMNAS

~~~plsql
ALTER TABLE nombreTabla
ADD nombreColumnaNueva INT;

--AGREGAR UNA NUEVA COLUMNA EN UNA TABLA QUE YA TIENE DATOS CON EL ATRIBUTO NOT NULL 
ALTER TABLE nombreTabla
DROP COLUMN(nombreColumnaNueva INT DEFAULT 0) NOT NULL;
~~~

## MODIFICAR TIPO DE COLUMNA

~~~plsql
ALTER TABLE nombreTabla
MODIFY nombreColumna NUMBER(4); --ESPECIFICAR A QUE TIPO CAMBIAR
~~~

---

# EXAMPLES

## JOIN

~~~plsql
--borrar tablas existentes
drop table clientes;
drop table provincias;

--crear nuevas tablas
 create table clientes (
  codigo number(5),
  nombre varchar2(30),
  domicilio varchar2(30),
  ciudad varchar2(20),
  codigoprovincia number(3)
 );

 create table provincias(
  codigo number(3),
  nombre varchar2(20)
 );

 --configurar restricciones
 alter table clientes
  add constraints UQ_clientes_codigo
  unique (codigo);

 alter table provincias
  add constraints UQ_provincias_codigo
  unique (codigo);

  --insertar registros
 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Corrientes');
 insert into provincias values(4,'Santa Cruz');
 insert into provincias values(null,'Salta');
 insert into provincias values(null,'Jujuy');

 insert into clientes values (100,'Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values (200,'Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values (300,'Garcia Juan','Rivadavia 333','Villa Maria',null);
 insert into clientes values (400,'Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values (500,'Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values (600,'Torres Fabiola','Alem 777','La Plata',5);
 insert into clientes values (700,'Garcia Luis','Sucre 475','Santa Rosa',null);
~~~

### COPIAR DATOS DE UNA TABLA EN OTRA

~~~plsql
CREATE TABLE COPIA (
CADENAX VARCHAR(56)
);

INSERT INTO COPIA SELECT CIUDAD FROM OFICINA;


CREATE TABLE nombreTabla AS
	SELECT atributoTabla2 AS nombreAtributoTabla1,
		atributo2Tabla2 AS nombreAtributoTabla1
	FROM tabla2;
	
	
CREATE TABLE nombreTabla AS
	SELECT atributoTabla2 AS nombreAtributoTabla1,
		atributo2Tabla2 AS nombreAtributoTabla1
	FROM tabla2
	WHERE atributoX = 'valor';
~~~



---

