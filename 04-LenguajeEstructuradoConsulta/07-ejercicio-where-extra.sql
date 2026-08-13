/*===========================================================================================================

Ejercico extra con la base de datos Northwind 

===========================================================================================================*/

USE Northwind;

-- Mostrar las ventas realizadas en Francia, brazil y belgica
-- del 10 de julio de 1996 al 31 de Diciembre de 1998, que tenga Region de Envio,

SELECT 
	o.OrderID AS numero_orden,
	o.CustomerID AS cliente,
	o.ShipCountry AS pais_emvio,
	o.OrderDate AS fecha_orden,
	UPPER(FORMAT(o.OrderDate, 'MMMM', 'es-ES')) AS [mes_orden],
	UPPER(FORMAT(o.OrderDate, 'dddd', 'es-ES')) AS [dia_orden],
	DATEPART(YEAR, o.OrderDate ) AS [año_orden]
FROM Orders AS o
WHERE o.ShipCountry IN ('France', 'Brazil', 'belgium');

-- para los clientes VICTE, HANAR y SUPRD, y ordenados por fecha de pedido de la mas

SELECT 
	o.OrderID AS numero_orden,
	o.CustomerID AS cliente,
	o.ShipCountry AS pais_emvio,
	o.OrderDate AS fecha_orden,
	UPPER(FORMAT(o.OrderDate, 'MMMM', 'es-ES')) AS [mes_orden],
	UPPER(FORMAT(o.OrderDate, 'dddd', 'es-ES')) AS [dia_orden],
	DATEPART(YEAR, o.OrderDate ) AS [año_orden]
FROM Orders AS o
WHERE o.ShipCountry IN ('France', 'Brazil', 'belgium')
	AND
	o.CustomerID IN ('VICTE', 'HANAR', 'SUPRD')
	AND
	o.OrderDate BETWEEN '1996-07-10' AND '1998-12-24';

-- cercana a la mas antigua.

SELECT 
	o.OrderID AS numero_orden,
	o.CustomerID AS cliente,
	o.ShipCountry AS pais_emvio,
	o.OrderDate AS fecha_orden,
	UPPER(FORMAT(o.OrderDate, 'MMMM', 'es-ES')) AS [mes_orden],
	UPPER(FORMAT(o.OrderDate, 'dddd', 'es-ES')) AS [dia_orden],
	DATEPART(YEAR, o.OrderDate ) AS [año_orden]
FROM Orders AS o
WHERE o.ShipCountry IN ('France', 'Brazil', 'belgium')
	AND
	o.CustomerID IN ('VICTE', 'HANAR', 'SUPRD')
	AND
	o.OrderDate BETWEEN '1996-07-10' AND '1998-12-24'
	ORDER BY o.OrderDate ASC;

-- Seleccionar las ventas para los clientes TOMPS

