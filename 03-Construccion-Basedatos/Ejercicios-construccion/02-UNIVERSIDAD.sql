-- Crear la base de datos.
CREATE DATABASE escuela;

-- Usar la base de datos.
USE escuela;

-- Tabla profesor.
CREATE TABLE profesor (
	id_profesor CHAR(5) NOT NULL,
	nombre VARCHAR(25) NOT NULL,
	apellido1 VARCHAR(20) NOT NULL,
	especialidad VARCHAR(40) NOT NULL,
	CONSTRAINT pk_profesor
	PRIMARY KEY (id_profesor)
);

-- Tabla curso.
CREATE TABLE curso (
	id_curso CHAR(5) NOT NULL,
	nombre_curso VARCHAR(40) NOT NULL,
	credito INT NOT NULL,
	id_profesor CHAR(5) NOT NULL,
	CONSTRAINT pk_curso
	PRIMARY KEY (id_curso),
	CONSTRAINT fk_curso_profesor
	FOREIGN KEY (id_profesor)
	REFERENCES profesor(id_profesor)
);