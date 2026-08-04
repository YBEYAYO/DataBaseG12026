-- Crear la base de datos.
CREATE DATABASE empresaadminis;

-- Usar la base de datos.
USE empresaadminis;

-- Tabla departamento
CREATE TABLE departamento (
	numberdep CHAR(5) NOT NULL,
    namedep VARCHAR(40) NOT NULL,
    manager CHAR(11) NULL,
    startday DATE NULL,
    CONSTRAINT pk_departamento
    PRIMARY KEY (numberdep)
);

-- Tabla employee empleado
CREATE TABLE empleado (
    ssn CHAR(11) NOT NULL,
    numberdep CHAR(5) NOT NULL,
    namedep VARCHAR(40) NOT NULL,
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    address VARCHAR(80) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    sex CHAR(1) NOT NULL,
    birthdate DATE NOT NULL,
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

-- Tabla LOCATIONS localisacion
CREATE TABLE locations (
    numlocation CHAR(5) NOT NULL,
    numberdep CHAR(5) NOT NULL,
    namelocation VARCHAR(40) NOT NULL,
    CONSTRAINT pk_locations
    PRIMARY KEY(numlocation),
    CONSTRAINT fk_locations_departamento
    FOREIGN KEY(numberdep)
    REFERENCES departamento(numberdep)
);

-- TABLA PROJECT PROYECTO
CREATE TABLE project (
    number CHAR(5) NOT NULL,
    name VARCHAR(40) NOT NULL,
    location VARCHAR(40) NOT NULL,
    namedep VARCHAR(40) NOT NULL,
    numdep CHAR(5) NOT NULL,
    CONSTRAINT pk_project
    PRIMARY KEY (number),
    CONSTRAINT fk_project_departamento
    FOREIGN KEY (numdep)
    REFERENCES departamento(numberdep)
);

-- TABLA WORKS_ON
CREATE TABLE works_on (
    employeeid CHAR(11) NOT NULL,
    numproyect CHAR(5) NOT NULL,
    hours DECIMAL(5,2) NOT NULL,
    CONSTRAINT pk_works_on
    PRIMARY KEY (employeeid, numproyect),
    CONSTRAINT fk_workson_employee
    FOREIGN KEY (employeeid)
    REFERENCES empleado(ssn),
    CONSTRAINT fk_workson_project
    FOREIGN KEY (numproyect)
    REFERENCES project(number)
);

-- TABLA DEPENDENT
CREATE TABLE dependent (
    dependentid CHAR(5) NOT NULL,
    employeeid CHAR(11) NOT NULL,
    sex CHAR(1) NOT NULL,
    birthdate DATE NOT NULL,
    relationship VARCHAR(30) NOT NULL,
    name VARCHAR(40) NOT NULL,
    CONSTRAINT pk_dependent
    PRIMARY KEY (dependentid),
    CONSTRAINT fk_dependent_empleado
    FOREIGN KEY (employeeid)
    REFERENCES empleado (ssn)
);