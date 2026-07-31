/* ================================================================================================

DQL (Data Query Langauje) en SQL-Server

Archivo: 05-basic-queries.sql

Descripción: En este archivo se realizan consultas basicas con SELECT.

===================================================================================================*/

USE comercial_db;

/* ================================================================================================
-- Uso se SELECT *

-- sintaxis
SELECT *
FROM nombre_tabla;

NOTA: el aterisco * significa todas las columnas de la tabla

No se recomienda utilizarla siempre:

1) Reduce la claridad de la consulta
2) Puede aumentar el consumo de recursos
3) Puede afectar aplicaciones futuras
===================================================================================================*/

SELECT *
FROM productos;

-- Proyeccion de la tabla productos
SELECT 
	codigo,
	nombre,
	precio
FROM productos;
GO

-- Alias de columna (Sobrenombre que se le pone a un campo)

SELECT 
	codigo AS codigo_productos,
	nombre AS nombre_productos,
	precio AS precio_unitario
FROM productos;

-- Alias de conlumna (sobre nombre o alias sin espacio)

SELECT 
	codigo AS codigo productos,
	nombre AS nombre productos,
	precio AS precio unitario
FROM productos;

-- Alias con espacios con corchete[] sirve para marcar los espacion en blanco.

SELECT 
	codigo AS [codigo_productos],
	nombre AS [nombre_productos],
	precio AS [precio_unitario]
FROM productos;

-- Alias sin la instruccion AS (no recomendado)

SELECT 
	codigo codigo_producto,
	nombre nombre_producto,
	precio precio_unitario
FROM productos;

-- el AS solo sirve para identificar o para que los usarios lo entiendan
-- Alias de tabla
-- (es util en los joins y en nombres abiguos)

SELECT 
	p.precio,
	p.nombre,
	p.codigo
FROM productos AS p ;

-- Alias de 

SELECT 
	p.precio,
	p.nombre,
	p.codigo
FROM categorias AS c;

-- TODO: Operadores Aritmeticos
-- campos calculados
/* ===============================================================

+ suma
- resta
* multiplicacion
/ división
% Modulo o residu de la division

=================================================================/*