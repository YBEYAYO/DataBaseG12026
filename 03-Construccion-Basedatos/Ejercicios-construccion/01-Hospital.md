# HOSPITAL.
---

## CODIGO.

```
-- crear base de datos
CREATE DATABASE hospital;

-- Usar la base de datos.
USE hospital;

-- Tabla paciente.
CREATE TABLE paciente(
	no_paciente INT NOT NULL,
	Nombre VARCHAR(30) NOT NULL,
	apellido1 VARCHAR(30) NOT NULL,
	apellido2 VARCHAR(30),
	peso DECIMAL(5,2) NOT NULL,
	edad INT NOT NULL,
	atributo VARCHAR(50),
	CONSTRAINT pk_paciente
	PRIMARY KEY (no_paciente),
	CONSTRAINT ck_paciente_peso
	CHECK (peso>0),
	CONSTRAINT ck_paciente_edad
	CHECK (edad>0)
);

-- Tabla EXPEDIENTE
CREATE TABLE expediente(
	no_expediente INT NOT NULL,
	fecha_apertura DATE NOT NULL,
	tipo_sangre VARCHAR(5) NOT NULL ,
	no_paciente INT NOT NULL,
	CONSTRAINT pk_expediente
	PRIMARY KEY (no_expediente),
	CONSTRAINT uq_expediente_paciente
	UNIQUE (no_paciente),
	CONSTRAINT fk_expediente_paciente
	FOREIGN KEY (no_paciente)
	REFERENCES paciente(no_paciente)
);
```

---

![HOSPITAL](/img/E-R/diagrama_hospital-dbo.png)
