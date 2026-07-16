/* Construcción de base de datos con SQL-LDD 
CON (CREATE, ALTER, DROP) */

-- Crear una base de datos
CREATE DATABASE empresa_patito;
GO

-- Utilizar la base de datos
USE empresa_patito;
GO

-- Crear tabla
CREATE TABLE alumno(
	alumno_id INT,
	nombre VARCHAR (30),
	apellido_paterno VARCHAR (20),
	apellido_materno VARCHAR(20),
	fecha_nacimiento DATE,
	correo VARCHAR(25)
);
GO

INSERT INTO alumno
VALUES (1, 'Domingo','Sarabia','Mendez','1942-03-14','domingo@domingo.com');

INSERT INTO alumno
VALUES (1, 'Patricio','Pineda','Robles','1912-05-14','patricio@patricio.com');
GO

SELECT *
FROM alumno;

DROP TABLE alumno;


CREATE TABLE alumno(
	alumno_id INT PRIMARY KEY,
	nombre VARCHAR (30),
	apellido_paterno VARCHAR (20),
	apellido_materno VARCHAR(20),
	fecha_nacimiento DATE,
	correo VARCHAR(25)
);
GO


INSERT INTO alumno
VALUES (1, 'Domingo','Sarabia','Mendez','1942-03-14','domingo@domingo.com');

INSERT INTO alumno
VALUES (2, 'Patricio','Pineda','Robles','1912-05-14','patricio@patricio.com');
GO

SELECT *
FROM alumno;

DROP TABLE alumno;
GO

-- Crear tabla
CREATE TABLE alumno(
	alumno_id INT NOT NULL
	CONSTRAINT pk_alumno
	PRIMARY KEY (alumno_id),
	nombre VARCHAR (30),
	apellido_paterno VARCHAR (20),
	apellido_materno VARCHAR(20),
	fecha_nacimiento DATE,
	correo VARCHAR(25)
);
GO


INSERT INTO alumno
VALUES (1, 'Domingo','Sarabia','Mendez','1942-03-14','domingo@domingo.com');

INSERT INTO alumno
VALUES (2, 'Patricio','Pineda','Robles','1912-05-14','patricio@patricio.com');
GO

SELECT *
FROM alumno;

DROP TABLE alumno;
GO

CREATE TABLE alumno(
	alumno_id INT NOT NULL,
	nombre VARCHAR (30),
	apellido_paterno VARCHAR (20),
	apellido_materno VARCHAR(20),
	fecha_nacimiento DATE,
	correo VARCHAR(25),
	CONSTRAINT pk_alumno
	PRIMARY KEY (alumno_id)
);
GO


INSERT INTO alumno
VALUES (1, 'Domingo','Sarabia','Mendez','1942-03-14','domingo@domingo.com');

INSERT INTO alumno
VALUES (2, 'Patricio','Pineda','Robles','1912-05-14','patricio@patricio.com');
GO

SELECT *
FROM alumno;

-- Primary key con IDENTITY

CREATE TABLE categoria(
	categoria_id INT IDENTITY (1,1) PRIMARY KEY,
	nombre VARCHAR(25) NOT NULL,
	activo BIT NOT NULL
);
GO

INSERT INTO categoria
VALUES ('carnes frias', 1);

INSERT INTO categoria
VALUES ('carnes frias', 1);

SELECT *
FROM categoria;

DROP TABLE categoria;

-- Restricción check

CREATE TABLE categoria(
	categoria_id INT IDENTITY (1,1) 
	CONSTRAINT pk_categoria
	PRIMARY KEY (categoria_id),
	nombre VARCHAR(25) NOT NULL UNIQUE,
	activo BIT NOT NULL
);
GO


INSERT INTO categoria
VALUES ('carnes frias', 1);

INSERT INTO categoria
VALUES ('carnes frias', 1);

SELECT *
FROM categoria;

DROP TABLE categoria;
GO


CREATE TABLE categoria(
	categoria_id INT IDENTITY (1,1) 
	CONSTRAINT pk_categoria
	PRIMARY KEY (categoria_id),
	nombre VARCHAR(25) NOT NULL 
	CONSTRAINT uq_categoria_nombre
	UNIQUE,
	activo BIT NOT NULL
);
GO


CREATE TABLE categoria(
	categoria_id INT IDENTITY (1,1),
	nombre VARCHAR(25) NOT NULL,
	activo BIT NOT NULL,
	CONSTRAINT pk_categoria
	PRIMARY KEY (categoria_id),
	CONSTRAINT uq_categoria_nombre
	UNIQUE(nombre)
);
GO


DROP TABLE categoria;

-- Restricción check

-- PRIMERA FORMA DE CONSTRUCCIÓN
CREATE TABLE producto(
	producto_id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	nombre VARCHAR (20) NOT NULL UNIQUE,
	precio DECIMAL (5,2) NOT NULL CHECK (precio>0.0),
	existencia INT NOT NULL CHECK (existencia>0 AND existencia<=100),
	activo BIT NOT NULL DEFAULT 1
);
GO


INSERT INTO producto
VALUES ('Pitufo',450,98,DEFAULT);

INSERT INTO producto
VALUES ('Quemadita',12,89,DEFAULT);
GO

INSERT INTO producto (nombre,existencia,precio)
VALUES ('Pantera Rosa',76, 123);
GO

TRUNCATE TABLE producto;


SELECT *
FROM producto;
GO


-- SEGUNDA FORMA DE CONSTRUCCIÓN (Restriccion por columna)
CREATE TABLE producto (
	producto_id INT NOT NULL IDENTITY (1,1)
	CONSTRAINT pk_producto
	PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL
	CONSTRAINT uq_producto_nombre
	UNIQUE,
	precio DECIMAL (10,2) NOT NULL
	CONSTRAINT ck_producto_precio
	CHECK (precio>0.0),
	existencia INT NOT NULL
	CONSTRAINT ck_producto_existencia
	CHECK (existencia BETWEEN 1 AND 100),
	tipo CHAR(1) NOT NULL
	CONSTRAINT ck_producto_tipo
	CHECK (tipo = 'R' OR tipo = 'P'),
	activo BIT NOT NULL
	CONSTRAINT df_producto_activo
	DEFAULT 1
);
GO

-- Tercera forma de Construcción (Al final de las instrucciones)

CREATE TABLE producto (
	producto_id INT NOT NULL IDENTITY (1,1),
	nombre VARCHAR(20) NOT NULL,
	precio DECIMAL (10,2) NOT NULL,
	existencia INT NOT NULL,
	tipo CHAR(1) NOT NULL,
	activo BIT NOT NULL
	CONSTRAINT df_producto_activo
	DEFAULT 1,
	CONSTRAINT pk_producto
	PRIMARY KEY (producto_id),
	CONSTRAINT uq_producto_nombre
	UNIQUE (nombre),
	CONSTRAINT ck_producto_precio
	CHECK (precio>0.0),
	CONSTRAINT ck_producto_existencia
	CHECK (existencia BETWEEN 1 AND 100),
	CONSTRAINT ck_producto_tipo
	CHECK (tipo IN ('R','P'))

);
GO

DROP TABLE producto;

-- Creación de la base de datos empresa_yoda

CREATE DATABASE empresa_yoda;
GO

USE empresa_yoda;
GO

CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY(1,1)
	CONSTRAINT pk_categoria
	PRIMARY KEY,
	nombre VARCHAR (20) NOT NULL
	CONSTRAINT uq_categoria_nombre
	UNIQUE,
	activo BIT NOT NULL
	CONSTRAINT df_categoria_activo
	DEFAULT 1
);
GO

CREATE TABLE producto (
	producto_id INT NOT NULL,
	fabricante_id CHAR(3) NOT NULL,
	nombre VARCHAR (25) NOT NULL,
	existencia INT NOT NULL,
	precio NUMERIC(10,2) NOT NULL,
	activo BIT NOT NULL
	CONSTRAINT df_producto_activo
	DEFAULT 1,
	categoria_id INT NOT NULL,
	CONSTRAINT pk_producto
	PRIMARY KEY (producto_id, fabricante_id),
	CONSTRAINT uq_produto_nombre
	UNIQUE (nombre),
	CONSTRAINT ck_producto_existencia
	CHECK (existencia>0),
	CONSTRAINT ck_producto_precio
	CHECK (precio BETWEEN 1 AND 10000),
	CONSTRAINT fk_producto_categoria
	FOREIGN KEY (categoria_id)
	REFERENCES categoria (categoria_id)
);
GO

INSERT INTO categoria(nombre)
VALUES('front end'),
	('backend'),
	('cloud');

SELECT *
FROM categoria;

SELECT *
FROM producto;

INSERT INTO producto
VALUES (1, 'ff1', 'Tailwind',987.34, 45, DEFAULT, 1);

INSERT INTO producto
VALUES (2, 'ff1', 'Bootstrap',567.8, 24, 0, 1);


INSERT INTO producto
VALUES (1, 'ff2', 'aws',34.5, 12, DEFAULT, 3);

CREATE TABLE proveedor(
	proveedor_id INT NOT NULL
	CONSTRAINT fk_proveedor_id
	PRIMARY KEY,
	empresa VARCHAR(30) NOT NULL,
	direccion VARCHAR (60),
	limite_credito DECIMAL (20,2) NOT NULL
);
GO

CREATE TABLE contacto_proveedor(
	contacto_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR (20) NOT NULL,
	apellido_paterno VARCHAR(15) NOT NULL,
	apellido_materno VARCHAR(15),
	telefono VARCHAR(15) NOT NULL,
	proveedor_id INT
	CONSTRAINT pk_contacto_proveedor
	PRIMARY KEY (contacto_id),
	CONSTRAINT fk_contacto_proveedor_proveedor
	FOREIGN KEY (proveedor_id)
	REFERENCES proveedor (proveedor_id)
	ON DELETE CASCADE
	ON UPDATE CASCADE

);
GO

INSERT INTO proveedor
VALUES (1,'patito de hule',NULL,67888.01),
		(2,'Bimbo',NULL,5678.01),
		(3,'Dulce Domingo',NULL,57888.01),
		(4,'Drunk Kevin',NULL,67888.01);

		INSERT INTO contacto_proveedor
		VALUES ('Soyla','Vaca','del corral','1234567',2),
		('Carmen','se perdio','la cadenita','1234567',2),
		('Juanito','Dulce','Terruño','1234567',2),
		('Laura','No esta','comiendo','1134567',1);

		SELECT * FROM proveedor;
		SELECT * FROM contacto_proveedor;

		DELETE FROM proveedor
		WHERE proveedor_id = 2; 

		UPDATE proveedor
		SET proveedor_id = 10
		WHERE proveedor_id = 2;

		DROP TABLE contacto_proveedor;
		DROP TABLE proveedor;

-- Integridad Referencial ON DELETE y ON UPDATE SET NULL
CREATE TABLE proveedor(
	proveedor_id INT NOT NULL
	CONSTRAINT fk_proveedor_id
	PRIMARY KEY,
	empresa VARCHAR(30) NOT NULL,
	direccion VARCHAR (60),
	limite_credito DECIMAL (20,2) NOT NULL
);
GO

CREATE TABLE contacto_proveedor(
	contacto_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR (20) NOT NULL,
	apellido_paterno VARCHAR(15) NOT NULL,
	apellido_materno VARCHAR(15),
	telefono VARCHAR(15) NOT NULL,
	proveedor_id INT
	CONSTRAINT pk_contacto_proveedor
	PRIMARY KEY (contacto_id),
	CONSTRAINT fk_contacto_proveedor_proveedor
	FOREIGN KEY (proveedor_id)
	REFERENCES proveedor (proveedor_id)
	ON DELETE SET NULL
	ON UPDATE SET NULL
);
GO

INSERT INTO proveedor
VALUES (1,'patito de hule',NULL,67888.01),
		(2,'Bimbo',NULL,5678.01),
		(3,'Dulce Domingo',NULL,57888.01),
		(4,'Drunk Kevin',NULL,67888.01);

INSERT INTO contacto_proveedor
VALUES ('Soyla','Vaca','del corral','1234567',2),
		('Carmen','se perdio','la cadenita','1234567',2),
		('Juanito','Dulce','Terruño','1234567',2),
		('Laura','No esta','comiendo','1134567',1);

SELECT *
FROM proveedor AS p
RIGHT JOIN contacto_proveedor AS cp
ON p.proveedor_id=cp.proveedor_id;

DELETE FROM contacto_proveedor
WHERE proveedor_id = 2;

SELECT * FROM proveedor;
SELECT * FROM contacto_proveedor;

-- Integridad Referencial ON DELETE Y ON UPDATE SET DEFULT
CREATE TABLE proveedor(
	proveedor_id INT NOT NULL
	CONSTRAINT fk_proveedor_id
	PRIMARY KEY,
	empresa VARCHAR(30) NOT NULL,
	direccion VARCHAR (60),
	limite_credito DECIMAL (20,2) NOT NULL
);
GO

CREATE TABLE contacto_proveedor(
	contacto_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR (20) NOT NULL,
	apellido_paterno VARCHAR(15) NOT NULL,
	apellido_materno VARCHAR(15),
	telefono VARCHAR(15) NOT NULL,
	proveedor_id INT
	CONSTRAINT df_contactos_proveedor_proveedor_id
	DEFAULT 0,
	PRIMARY KEY (contacto_id),
	CONSTRAINT fk_contacto_proveedor_proveedor
	FOREIGN KEY (proveedor_id)
	REFERENCES proveedor (proveedor_id)
	ON DELETE SET DEFAULT
	ON UPDATE SET DEFAULT
);
GO


INSERT INTO proveedor
VALUES (1,'patito de hule',NULL,67888.01),
		(2,'Bimbo',NULL,5678.01),
		(3,'Dulce Domingo',NULL,57888.01),
		(4,'Drunk Kevin',NULL,67888.01),
		(0,'Todas Mias','Engañifas',666.69);

INSERT INTO contacto_proveedor
VALUES ('Soyla','Vaca','del corral','1234567',2),
		('Carmen','se perdio','la cadenita','1234567',2),
		('Juanito','Dulce','Terruño','1234567',2),
		('Laura','No esta','comiendo','1134567',1);

SELECT * FROM proveedor;
SELECT * FROM contacto_proveedor;

DELETE proveedor
WHERE proveedor_id =2;

UPDATE contacto_proveedor
SET proveedor_id=3
WHERE proveedor_id=0;

UPDATE proveedor
SET proveedor_id =6
WHERE proveedor_id =3;

-- TODO: Realizar Ejercicio completo de construcción de un diagrama RElcional,
-- aplicar las restricciónes y se continua con ALTER Y DROP

-- Alter Table

-- Agregar una columna
USE pruebaatributos;
GO

SELECT *
FROM alumno;

TRUNCATE TABLE alumno;

-- Muestra los datos de una tabla
SELECT
	COLUMN_NAME,
	DATA_TYPE,
	CHARACTER_MAXIMOUM_LENGTH,
	IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'alumno';

-- Agregar una columna
ALTER TABLE alumno
ADD telefono VARCHAR(20) NOT NULL
GO

-- Agregar mas de una columna
ALTER TABLE alumno
ADD 
curp VARCHAR(18),
matricula VARCHAR(13) NOT NULL;

-- Modificar un tipo de dato
ALTER TABLE alumno
ALTER COLUMN telefono VARCAHR (30);
GO

-- Agregar restricciones
-- Primary key

-- Este codigo crea una tabla con cero registros a partir de otra
SELECT TOP 0 *
INTO alumno2
FROM alumno;

SELECT * FROM alumno2;

SELECT TOP 0 *
INTO alumno2
FROM alumno;

SELECT *
	o.name AS nombre_restriccion,
	o.type_desc AS tipo_restriccion
FROM sys.objects AS o
WHERE o.parent_object_id = OBJECTS_ID('alumno2')
AND o.type IN ('PK', 'F', 'UQ', 'C', 'D')
ORDER BY O.type_desc;
