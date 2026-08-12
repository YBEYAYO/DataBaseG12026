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
	p.codigo AS codigo_rp
FROM productos AS p;