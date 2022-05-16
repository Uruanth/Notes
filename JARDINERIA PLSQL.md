## JARDINERIA PLSQL

https://www.discoduroderoer.es/ejercicios-propuestos-y-resueltos-de-consultas-oracle-jardineria/



~~~plsql
--Muestra la ciudad y el codigo postal de las oficinas de España.
SELECT CIUDAD, CODIGO_OFICINA FROM OFICINA WHERE LOWER(PAIS) = 'españa';

--Obtener el nombre y apellidos del jefe de la empresa.
SELECT NOMBRE, APELLIDO1, APELLIDO2 FROM EMPLEADO WHERE LOWER(PUESTO) = 'director general';
SELECT NOMBRE, APELLIDO1, APELLIDO2 FROM EMPLEADO WHERE CODIGO_JEFE IS NULL;

--Mostrar el nombre y cargo de los empleados que no sean directores de oficina.
SELECT NOMBRE, PUESTO FROM EMPLEADO WHERE UPPER(PUESTO) <> 'DIRECTOR OFICINA';

--Muestra el número de empleados que hay en la empresa.
SELECT COUNT(*) AS CONTEO FROM EMPLEADO;

--Muestra el número de clientes norteamericanos.
SELECT COUNT(*) AS CONTEO FROM CLIENTE WHERE UPPER(PAIS) = 'USA';

--Número de clientes de cada país.
SELECT PAIS, COUNT(*) AS CONTEO
FROM CLIENTE
GROUP BY PAIS;

--Muestra el nombre del cliente y el nombre de su representante de ventas (si lo tiene).
SELECT A.NOMBRE_CLIENTE AS CLIENTE, B.NOMBRE AS REPRESENTANTE
    FROM CLIENTE A
    JOIN EMPLEADO B
        ON A.codigo_empleado_rep_ventas = B.CODIGO_EMPLEADO;

--Nombre de los clientes que hayan hecho un pago en 2007
SELECT DISTINCT A.NOMBRE_CLIENTE
    FROM CLIENTE A, PAGO B
    WHERE  
        EXTRACT(YEAR FROM B.FECHA_PAGO) = 2007
        AND B.CODIGO_CLIENTE = A.CODIGO_CLIENTE;
        
--Los posibles estados de un pedido.
SELECT DISTINCT ESTADO FROM PEDIDO;

--Muestra el número de pedido, el nombre del cliente, la fecha de entrega y la fecha requerida  de los pedidos que no han sido entregados a tiempo.
SELECT P.CODIGO_PEDIDO, C.NOMBRE_CLIENTE, P.FECHA_ENTREGA, P.FECHA_ESPERADA
    FROM PEDIDO P, CLIENTE C
    WHERE P.CODIGO_CLIENTE = C.CODIGO_CLIENTE
        AND P.FECHA_ENTREGA > P.FECHA_ESPERADA;
        
        
SELECT P.CODIGO_PEDIDO, C.NOMBRE_CLIENTE, P.FECHA_ENTREGA, P.FECHA_ESPERADA
    FROM PEDIDO P
    JOIN CLIENTE C
    ON P.CODIGO_CLIENTE = C.CODIGO_CLIENTE
        AND P.FECHA_ENTREGA > P.FECHA_ESPERADA;
        

--11. Muestra el código, nombre y gama de los productos que nunca se han pedido (detalle pedidos).
SELECT P.CODIGO_PRODUCTO, P.NOMBRE, P.GAMA
    FROM PRODUCTO P, DETALLE_PEDIDO D
    WHERE 
        NOT EXISTS (
            SELECT CODIGO_PRODUCTO FROM DETALLE_PEDIDO 
                WHERE CODIGO_PRODUCTO = P.CODIGO_PRODUCTO
        );
        
--12. Muestra el nombre y apellidos de los empleados que trabajan en Barcelona.
SELECT NOMBRE, APELLIDO1 ||' '|| APELLIDO2 AS APELLIDOS
    FROM EMPLEADO
    WHERE CODIGO_OFICINA = (
        SELECT CODIGO_OFICINA
        FROM OFICINA
        WHERE UPPER(CIUDAD) = 'BARCELONA');

SELECT E.NOMBRE, E.APELLIDO1 ||' '|| E.APELLIDO2 AS APELLIDOS
    FROM EMPLEADO E, OFICINA O
    WHERE E.CODIGO_OFICINA = O.CODIGO_OFICINA
        AND UPPER(O.CIUDAD) = 'BARCELONA';
~~~

