-- Crear la base de datos.
CREATE DATABASE school;

-- usar la base de datos.
USE school;

-- Tabla alumno.
CREATE TABLE alumno(
	no_alumno CHAR(5) NOT NULL,
	matricula CHAR(10) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	apellido1 VARCHAR(20) NOT NULL,
	apellido2 VARCHAR(20) NOT NULL,
	CONSTRAINT pk_alumno
	PRIMARY KEY (no_alumno)
);

-- Tabla materia.
CREATE TABLE materia(
	num_matricula CHAR(5) NOT NULL,
	clase VARCHAR(40) NOT NULL,
	credito INT NOT NULL,
	CONSTRAINT pk_materia
	PRIMARY KEY (num_matricula)
);

-- Tabla incribe.
CREATE TABLE inscribe (
	no_alumno CHAR(5) NOT NULL,
	num_matricula CHAR(5) NOT NULL,
	fecha_inscripcion DATE NOT NULL,
	calificacion_final DECIMAL(5,2) NULL,
	CONSTRAINT pk_inscribe
	PRIMARY KEY (no_alumno, num_matricula),
	CONSTRAINT fk_inscribre_alumno
	FOREIGN KEY (no_alumno)
	REFERENCES alumno(no_alumno),
	CONSTRAINT fk_inscribe_materia
	FOREIGN KEY (num_matricula)
	REFERENCES materia(num_matricula)
);