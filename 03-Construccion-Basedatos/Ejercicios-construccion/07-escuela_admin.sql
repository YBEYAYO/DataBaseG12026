-- Crear la bse de datos
CREATE DATABASE escuelaadmin;

-- Usamos la base de datos
USE escuelaadmin;

-- Tabal del alumno
CREATE TABLE alumno (
	matricula CHAR(10) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	apellido1 VARCHAR(30) NOT NULL,
	apellido2 VARCHAR(30) NOT NULL,
	correo varchar(50) NOT NULL,
	fechanaci DATE NOT NULL,
	CONSTRAINT pk_alumno
	PRIMARY KEY (matricula)
);

-- Tabla de departamento
CREATE TABLE departamento (
	numdepto CHAR(5) NOT NULL,
	nomdeparta VARCHAR(40) NOT NULL,
	edificio VARCHAR(40) NOT NULL,
	CONSTRAINT pk_departamento
	PRIMARY KEY (numdepto)
);

-- Tabla del profesor
CREATE TABLE profesor (
	numprofe CHAR(5) NOT NULL,
	numdepartamento CHAR(5) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	apellido1 VARCHAR(30) NOT NULL,
	apellido2 VARCHAR(30) NOT NULL,
	CONSTRAINT pk_profesor
	PRIMARY KEY (numprofe),
	CONSTRAINT fk_profesor_departamento
    FOREIGN KEY (numdepartamento)
	REFERENCES departamento(numdepto)
);

-- Tabla credencial
CREATE TABLE credencial (
	numcredencual CHAR(10) NOT NULL,
	matricula CHAR(10) NOT NULL,
	fechainscripcion DATE NOT NULL,
	CONSTRAINT pk_credencial
	PRIMARY KEY (numcredencual),
	CONSTRAINT fk_credencual_alumno
	FOREIGN KEY (matricula)
	REFERENCES alumno(matricula)
);

-- Tabla telefono
CREATE TABLE telefono (
	telefonoid CHAR(5) NOT NULL,
	matricula CHAR(10) NOT NULL,
	numerototal VARCHAR(15) NOT NULL,
	CONSTRAINT pk_telefono
	PRIMARY KEY (telefonoid, matricula),
	CONSTRAINT fk_telefono_alumno
	FOREIGN KEY (matricula)
	REFERENCES alumno (matricula)
);

-- Tabla materia
CREATE TABLE materia (
	clavemateria CHAR(5) NOT NULL,
	numprofe CHAR(5) NOT NULL,
	nombremateria VARCHAR(40) NOT NULL,
	creditos INT NOT NULL,
	totalmaterias INT NOT NULL,
	CONSTRAINT pk_materia
	PRIMARY KEY (clavemateria),
	CONSTRAINT fk_materia_profesor
	FOREIGN KEY (numprofe)
	REFERENCES profesor (numprofe)
);

-- Tabla de proyecto
CREATE TABLE proyecto (
	numproyect CHAR(5) NOT NULL,
	nombreproyect VARCHAR(40) NOT NULL,
	presupuesto DECIMAL(10,2) NOT NULL,
	CONSTRAINT pk_proyecto
	PRIMARY KEY (numproyect)
);

-- Tabla de participa
CREATE TABLE partcipa (
	numprofe CHAR(5) NOT NULL,
	numproyect CHAR(5) NOT NULL,
	rol VARCHAR(30) NOT NULL,
	fechainicio DATE NOT NULL,
	CONSTRAINT pk_participa
	PRIMARY KEY (numprofe, numproyect),
	CONSTRAINT fk_participa_profesor
	FOREIGN KEY (numprofe)
	REFERENCES profesor (numprofe),
	CONSTRAINT fk_participa_proyecto
	FOREIGN KEY (numproyect)
	REFERENCES proyecto (numproyect)
);

-- Tabla de dependiente.
CREATE TABLE dependiente (
    nombre VARCHAR(40) NOT NULL,
    numprofe CHAR(5) NOT NULL,
    fechanaci DATE NOT NULL,
    parentesco VARCHAR(30) NOT NULL,

    CONSTRAINT pk_dependiente
    PRIMARY KEY (nombre),

    CONSTRAINT fk_dependiente_profesor
    FOREIGN KEY (numprofe)
    REFERENCES profesor(numprofe)
);

-- Tabla de cursa
CREATE TABLE cursa (
    matricula CHAR(10) NOT NULL,
    clavemateria CHAR(5) NOT NULL,
    fechainscripcion DATE NOT NULL,
    calfinal DECIMAL(5,2) NOT NULL,

    CONSTRAINT pk_cursa
    PRIMARY KEY (matricula, clavemateria),

    CONSTRAINT fk_cursa_alumno
    FOREIGN KEY (matricula)
    REFERENCES alumno(matricula),

    CONSTRAINT fk_cursa_materia
    FOREIGN KEY (clavemateria)
    REFERENCES materia(clavemateria)
);