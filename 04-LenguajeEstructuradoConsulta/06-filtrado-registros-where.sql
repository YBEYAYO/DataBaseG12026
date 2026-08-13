/* ================================================================================================

DQL (Data Query Langauje) en SQL-Server

Archivo: 06-Filtrado_registro_where.sql

Descripción: Se recuperan unicamente las filas que cumplen determinadascondiciones mediuante la 
clausula where

===================================================================================================*/

/* ================================================================================================
		SINTAXIS
SELECT
	columna_1
	columna_2
	columna_n
FROM nombre_tabla
WHERE condicion;

Nota: Condicion puede ser relacional y a combinacion de esta con lógica

===================================================================================================*/

-- Seleccionar el producto cuto precio es $200
SELECT
	p.codigo AS [Codigo],
	p.nombre AS [Producto],
	p.precio AS [Precio]
FROM productos As p;
WHERE precio = 200

-- filtra por precio
SELECT
	p.codigo AS [Codigo],
	p.nombre AS [Producto],
	p.precio AS [Precio]
FROM productos As p
WHERE precio = 200;

-- Seleccionar el cliente cuyo identificador es 25
SELECT
	c.id_cliente,
	CONCAT (c.nombre, ' ',
			c.apellido_paterno, ' ',
			c.apellido_materno) AS nombre_completo,
	c.correo
FROM cliente AS c
WHERE c.id_cliente = 25;
	
-- Comparacion de cadenas de texto
-- Los valores de texto deben escribirse entre comillas simples

-- Seleccionar las categorias donde el nombre sea computo
SELECT
	c.nombre AS [Categoria]
FROM categorias AS c
WHERE c.nombre = 'Cómputo';

-- Seleccionar los datos del cliente con nombre cliente1
SELECT
		c.id_cliente,
	CONCAT (c.nombre, ' ',
			c.apellido_paterno, ' ',
			c.apellido_materno) AS nombre_completo
FROM clientes AS c
WHERE nombre = 'Cliente1';
-- Seleccionar los datos del empleado que no pertenezcan al departamento 1
SELECT 
	e.id_empleado,
	e.nombre,
	e.id_departamento,
	e.salario
FROM empleados AS e
WHERE id_departamentos = 1;

-- Seleccionar los datos de los productos con existencia critica inferior a 10 unidades
SELECT 
	p.id_producto
	p.
FROM prodcutos AS p
-- Seleccionar los datos de los empleados donde su salario sea de $30,000 en adelante
SELECT 
	e.id_empleado,
	e.nombre,
	e.id_departamento,
	e.salario
FROM empleados AS e
WHERE salario >= 30000;
-- Seleccionar losd atos de los productos donde sus precions sean de $10 o menos
SELECT 
	p.id_producto,
	p.nombre,
	p.id_departamento,
	p.salario
FROM profucto AS p
WHERE p.precio <= 10;
-- Comparacion de fechas las fechas deben escribirse entre comillas simples se recomienda el formato AAAA-MM-DD

SELECT
	v.id_venta,
	v.fecha,
	v.id_cliente,
	v.id_empleado,
FROM ventas AS v;
WHERE v.fecha = '2025-12-24'

-- Seleccionar los datos de las ventas realizadas el 24 de diciembre de 2025

SELECT
	v.id_venta,
	v.fecha,
	YEAR(v.fecha) AS [año],
	MONTH(v.fecha ) AS [mes],
	DAY(v.fecha) AS [dia],
	v.id_cliente,
	v.id_empleado
FROM ventas AS v
WHERE MONTH (fecha ) = 4;

-- sleccion de fecha ene spaños

SELECT
	v.id_venta,
	v.fecha,
	YEAR(v.fecha) AS [año],
	FORMAT(v.fecha 'MMMM') AS [mes_ingles],
	UPPER(FORMAT(v.fecha 'MMMM', 'es-ES')) AS [mes_español],
	FORMAT(v.fecha, 'MMM') AS [Mes, abreviado],
	FORMAT(v.fecha, 'MMM', 'es-ES') AS [Mes Abreviado],
	FORMAT(v.fecha , 'dddd') AS [Dia en ingles],
	FORMAT(v.fecha 'dddd', 'es-ES') AS [Dia en ingles],
	DAY(v.fecha) AS [dia],
	FORMAT(v.fecha, 'dddd') AS [dia_ingles],
	UPPER()
	v.id_cliente,
	v.id_empleado
FROM ventas AS v
WHERE MONTH (fecha ) = 4;

-- DISTINCT
--Quita elementos repetidos de una o la combinacion de columnas
SELECT
	c.sexo 
FROM clientes AS c;

SELECT DISTINCT
	id_ciudad
FROM clientes;

SELECT COUNT(*)
FROM ciudades;

SELECT DISTINCT 
	cu.nombre 
FROM clientes AS c
INNER JOIN ciudades AS cu
ON c.id_ciudad = cu.id_ciudad ;

-- seleccionar los descuentos unicos de las ventas

SELECT DISTINCT 
	dv.descuento 
FROM detalle_ventas AS dv
ORDER BY dv.descuento DESC;

SELECT DISTINCT 
	p.id_categoria,
	p.id_proveedor 
FROM productos AS p;

--TOP
-- Limita la cantidad de filas devueltas por una consult

SELECT 
	dv.id_venta,
	dv.precio,
	dv.cantidad,
	dv.descuento
FROM detalle_ventas AS dv; 

SELECT TOP (10)
	dv.id_venta,
	dv.precio,
	dv.cantidad,
	dv.descuento
FROM detalle_ventas AS dv; 

SELECT TOP (10) PERCENT
	dv.id_venta,
	dv.precio,
	dv.cantidad,
	dv.descuento
FROM detalle_ventas AS dv; 

SELECT
	v.id_venta,
	v.fecha,
	YEAR(v.fecha) AS [año],
	MONTH(v.fecha) AS [mes],
	FORMAT(v.fecha 'MMMM') AS [mes_ingles],
	UPPER(FORMAT(v.fecha 'MMMM', 'es-ES')) AS [mes_español],
	FORMAT(v.fecha, 'MMM') AS [Mes, abreviado],
	FORMAT(v.fecha, 'MMM', 'es-ES') AS [Mes Abreviado],
	FORMAT(v.fecha , 'dddd') AS [Dia en ingles],
	FORMAT(v.fecha 'dddd', 'es-ES') AS [Dia en ingles],
	v.id_cliente,
	v.id_empleado
FROM ventas AS v
WHERE v.fecha < '2025-02-01'

-- Seleccionar lños datos de los productos mostrando el codigo y el valor del invetario
-- del inventario, donde el valor del inventario debe ser mayor a 50000

SELECT 
	p.codigo AS codigo_rp44
FROM productos AS p;






--Seleccionar los datos de los productos Mostrando el codif¿go y el valor del inventario 
--done el alor del inventario deve de ser mayor a 50 mill

SELECT 
p.codigo AS codigo_producto,
p.existencia AS existencia,
p.precio AS precio,
(p.precio*p.existencia) AS valor_inventario
FROM productos AS p
WHERE (p.precio*p.existencia) > 50000;

--Mostrar los productos con precio que este entre $200 y $300  
SELECT 
p.codigo AS codigo_producto,
p.existencia AS existencia,
p.precio AS precio,
(p.precio*p.existencia) AS valor_inventario
FROM productos AS p
WHERE precio>=200 AND precio<=300;

--Instruccion between 
SELECT 
p.codigo AS codigo_producto,
p.existencia AS existencia,
p.precio AS precio,
(p.precio*p.existencia) AS valor_inventario
FROM productos AS p
WHERE precio BETWEEN 200 AND 300;


-- los purdcutos entre 200 y 300 ademas que tengan 300 unidades
SELECT
 p.codigo,
 p.nombre,
 p.precio,
 p.existencia
FROM productos AS p
WHERE p.precio>=200
AND 
p.precio<=300
AND 
p.existencia<50
ORDER BY precio DESC;

--Mostrar los prodcutos conn existencia inferori a 10 o superorir a 190
SELECT
 p.codigo,
 p.nombre,
 p.precio,
 p.existencia
FROM productos AS p
WHERE p.existencia<=10
OR
p.existencia>=190

ORDER BY precio DESC;

--Operardor Not 
SELECT
 p.codigo,
 p.nombre,
 p.precio,
 p.existencia
FROM productos AS p
WHERE p.existencia < 10
OR p.existencia>190;

--OPERADOR NOT 
--Mostrar los productos que su precio no sea mayor a 400no sean mayores a 400 
SELECT
 p.codigo,
 p.nombre,
 p.precio,
 p.existencia
FROM productos AS p
WHERE p.precio <= 400;

--Mostrar los empleados de los departamentos 1 y 2 que tengan salario mayor 
-- a 25000 pesos

SELECT 
e.id_empleado,
e.nombre,
e.salario,
e.id_departamento
FROM empleados AS e
WHERE e.id_empleado = 1
	OR 
	e.id_departamento = 2
	AND e.salario  > 25000;

SELECT 
e.id_empleado,
e.nombre,
e.salario,
e.id_departamento
FROM empleados AS e
WHERE (e.id_empleado = 1
	OR 
	e.id_departamento = 2)
	AND e.salario  > 25000;

-- Mostrar los empleado que no tiene jefe
SELECT
	p.id_empleado,
	p.id_departamento,
	p.nombre,
	p.id_jefe
FROM empleados AS p
WHERE p.id_jefe IS NULL;

-- para mostrar los que si tienen jefe
SELECT
	p.id_empleado,
	p.id_departamento,
	p.nombre,
	p.id_jefe
FROM empleados AS p
WHERE p.id_jefe IS NOT NULL;

-- OPERADOR BETWWEN
--Permite comprobar si un valor se encuentra dentro de un rango inclusivo

/*========================================================================================
WHERE columna WETWWEN limite_inferior AND limite_superior
========================================================================================*/

-- Mostrar empleados con salario entre $15,000 y $20,000, incluyendo ambos limites
SELECT
	e.id_empleado,
	e.nombre,
	e.salario
FROM empleados AS e
WHERE salario BETWEEN 15000 AND 20000
ORDER BY 3 DESC;

-- con un AND
SELECT
	e.id_empleado,
	e.nombre,
	e.salario
FROM empleados AS e
WHERE e.salario >= 15000
	AND
	e.salario <= 20000;

-- Mostrar los productos que los precios esten en el raqngo de 100 y 200
SELECT
 p.codigo,
 p.nombre,
 p.precio,
 p.existencia
FROM productos AS p
WHERE P.precio BETWEEN 100 AND 200;

-- Mostrar las ventas del 1 de enero de 2025 al 10 de enero de 2025
SELECT 
	v.id_venta AS [numero_ventas],
	v.id_cliente AS [cliente],
	v.id_empleado AS [vendedeor],
	v.fecha [fecha_venta],
	UPPER(FORMAT(v.fecha, 'MMMM', 'es-ES')) AS [mes_venta],
	UPPER(FORMAT(v.fecha, 'dddd', 'es-ES')) AS [dia_venta],
	DATEPART(YEAR, v.fecha) AS [año-venta]
FROM ventas AS v
WHERE v.fecha BETWEEN '2025-01-01' AND '2025-01-10'
ORDER BY [cliente] ASC;

-- Mostrar los productos que su rango de precios no este entre 100 y 400 
SELECT
 p.codigo,
 p.nombre,
 p.precio,
 p.existencia
FROM productos AS p
WHERE p.precio NOT BETWEEN 100 AND 400;

-- OPERQADOR IN


-- Permite comparar una columna con una lista de valores

/*========================================================================================
WHERE columna IN (valor_1, valor_2, valor_3)
========================================================================================*/
-- Mostrar productos pertenecientes a las categorias 1, 7, 12
SELECT
 p.codigo,
 p.nombre,
 p.precio,
 p.existencia
FROM productos AS p
WHERE p.id_categoria IN (1,7,12)
ORDER BY p.id_categoria;

SELECT
 p.codigo,
 p.nombre,
 p.precio,
 p.existencia
FROM productos AS p
WHERE p.id_categoria = 1
	OR p.id_categoria = 7
	OR p.id_categoria = 12

ORDER BY p.id_categoria;

-- Mostrar todos los productos que no pertenecen a la categoria 1, 7 o 12

SELECT
 p.codigo,
 p.nombre,
 p.precio,
 p.existencia
FROM productos AS p
WHERE p.id_categoria NOT IN (1,7,12)
ORDER BY p.id_categoria;

-- TODO: OPERADOR LIKE
/*===========================OPERADOR LIKE=======================================

Permite buscar patrones dengtro de valores de texto
sintaxis
WHERE columan LIKE 'patron';
Los patrones pueden contener comodines;
	Comodin				Significado
	   %		Cero, uo o varios valores
	   -		Exactamente un caracter
	 [abc]		Un carácter incluido en la lista
	 [a-f]		Un carácter incluido en el rango
	 [^abc]		Un carácter no includio en la lista
================================================================================*/

-- COMODIN %
-- El simpbolo % representa cualquier cantidad de caracteres, incluyendo 0 caracteres
-- Comienza de esta forma
-- WHERE nombre LIKE 'cliente%'
-- Valores que comienzan con cliente

-- TERMINA
-- WHERE correo LIKE '%mail.com'
-- Valores que terminan con mail.com

-- CONTIENE
-- WHERE Nombre LIKE '%a%'
-- Valores que contienen el caracter a en cualquier posición
-- Buscar codigos de productos que comiencen con P001

SELECT
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p
WHERE p.codigo LIKE 'P001%';

SELECT *
FROM Customers
WHERE CompanyName LKE I'Bo%';

-- Buscar los correos de los clientes que terminan exactamente con 10@mail.com

SELECT 
	c.id_cliente,
	c.nombre,
	c.correo
FROM clientes AS c
WHERE c.correo LIKE '%10@mail.com';

-- Mostrar los nombres de los productos que contienen el caracter 1

SELECT 
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p
where p.nombre LIKE '%1%';

-- Comodin de una caracteristica
-- El guion bajo_representa exactamente un caracter

-- Mostrar los codigos con P001 y exactamente un caracter adicional
SELECT 
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p
where p.codigo LIKE 'P000_';

-- Patrones con corchetes

SELECT 
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p
where p.codigo LIKE 'P000[1-5]';

SELECT 
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p
where p.codigo LIKE 'P000[^1-5]';

-- BUSAR un gion bajo literal
-- En LIKE _ es un comodion
-- Las ciudades de esta base de datos, contien ugiones bajos, por ejemplo;
-- laciodad_1_1
-- Para buscar un guin bajo literal mediante corchetes se peude utilizar:

SELECT *
FROM ciudades;

SELECT *
FROM ciudades AS c
WHERE nombre LIKE '%[_]%';

