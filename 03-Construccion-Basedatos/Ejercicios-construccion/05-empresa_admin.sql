-- Crear base de datos.
CREATE DATABASE empresaadmin;

-- Usar base de datos.
USE empresaadmin;

-- Tabla departament
CREATE TABLE departamento (
	numberdep CHAR(5) NOT NULL,
	namedep VARCHAR(40) NOT NULL,
	manager CHAR(11) NULL,
	starday DATE NULL,
	CONSTRAINT pk_departamento
	PRIMARY KEY (numberdep)
);

-- tabla employed empleado
CREATE TABLE empleado (
	ssn CHAR(11) NOT NULL,
	firstname VARCHAR(30) NOT NULL,
	lastname VARCHAR(30) NOT NULL,
	addres VARCHAR(80) NOT NULL,
	salary DECIMAL(10,2) NOT NULL,
	sex CHAR(1) NOT NULL,
	birthdate DATE NOT NULL,
	numberdep CHAR(5) NOT NULL,
	jefe CHAR(11) NULL,
	CONSTRAINT pk_empleado
	PRIMARY KEY (ssn),
	CONSTRAINT fk_empleado_departamento
	FOREIGN KEY (numberdep)
	REFERENCES departamento(numberdep),
	CONSTRAINT fk_empleado_jefe
	FOREIGN KEY (jefe)
	REFERENCES empleado(ssn)
);

-- Agregar el gerente del departamento
ALTER TABLE departamento
ADD CONSTRAINT fk_departamento_manager
FOREIGN KEY (manager)
REFERENCES empleado(ssn);

-- Tabla locations localisacion
CREATE TABLE locations(
	numlocation CHAR(5) NOT NULL,
	namelocation VARCHAR(40) NOT NULL,
	numberdep CHAR(5) NOT NULL,
	CONSTRAINT pk_locations
	PRIMARY KEY (numlocation),
	CONSTRAINT fk_locations_departamento
	FOREIGN KEY (numberdep)
	REFERENCES departamento(numberdep)
);

-- Tabla proyect proyecto 
CREATE TABLE proyecto(
	numproyect CHAR(5) NOT NULL,
	nameproyect VARCHAR(40) NOT NULL,
	location VARCHAR(40) NOT NULL,
	numberdep CHAR(5)NOT NULL,
	CONSTRAINT Pk_proyecto
	PRIMARY KEY (numproyect),
	CONSTRAINT fk_proyecto_departamento
	FOREIGN KEY (Numberdep)
	REFERENCES departamento(numberdep)
);

-- Tabla works_on
CREATE TABLE works_on (
	ssn CHAR(11) NOT NULL,
	numproyect CHAR(5) NOT NULL,
	hours DECIMAL(5,2) NOT NULL,
	CONSTRAINT pk_works_on
	PRIMARY KEY (ssn, numproyect),
	CONSTRAINT fk_works_empleado
	FOREIGN KEY (ssn)
	REFERENCES empleado (ssn),
	CONSTRAINT fk_works_proyecto
	FOREIGN KEY (numproyect)
	REFERENCES proyecto(numproyect)
);

-- Tabla dependent dependiente
CREATE TABLE dependiente(
	ssn CHAR(11) NOT NULL,
	name VARCHAR(40) NOT NULL,
	sex CHAR(1) NOT NULL,
	birthdate DATE NOT NULL,
	relationship VARCHAR(30) NOT NULL,
	CONSTRAINT pk_dependiente
	PRIMARY KEY (ssn, name),
	CONSTRAINT fk_dependiente_empleado
	FOREIGN KEY (ssn)
	REFERENCES empleado (ssn)
);