## DICCIONARIO DE DATOS DE LA BASE DE DATOS DE Alumno.
---
1. Informacion general 

| Elemento | Valor |
| :---------| :---------|
| Proyecto    | ALUMNO |
| Version    | 1.0    |
| Fecha    | junio 2026    |
| Elaboro    | Ing. Yael Barrera Escamilla    |
| SGBD   | SQLServer    |
| Elaboro    | Ing. Yael Barrera Escamilla    |

```
2. Descripcion del sistema de base de datos.

el sistema administra:
- Materia.
- Alumnos.
- Inscribe.

Permite a la escuela tener un mejor control sobre la informacion sobre que alumno incribe un materia.
```

3. Catalogo de restricciones utilizadas

| CODIGO | SIGNIDICADO |
| :---  | :--- |
| PK        | Primary key    |
| FK        | Foreign key    |
| NN        | NOT NULL       |
| UQ        | UNIQUE         |
| AI        | Auto Increment |
| CK        | CHECK          |
| DF        | DEFAULT        |
| PK        | Primary key    |
| PK        | Primary key    |

---

4. Diccionario de datos.

## Tabla: ALUMNO.

**DESCRIPCION**
Almacena la informacion de los alumnos registrados en la institucion.

| CAMPO | TIPO | LONGITUD | RESTRICCIONES | DESCRIPCION |
| :---  | :--- |   :---   | :--- | :--- |
| No_alumno | INT | - | PK, AI, NN | Identificador unico del alumno |
| Matricula | VARCHAR | 10 | UQ, NN | Matricula institucional del alumno |
| Nombre | VARCHAR | 50 | NN | Nombre del alumno |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido del alumno |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido del alumno |

---

## Tabla: MATERIA.

**DESCRIPCION**
Almacena la informacion de las materias disponibles para inscripcion.

| CAMPO | TIPO | LONGITUD | RESTRICCIONES | DESCRIPCION |
| :---  | :--- |   :---   | :--- | :--- |
| Num_materia | INT | - | PK, AI, NN | Identificador unico de la materia |
| Clase | VARCHAR | 100 | NN | Nombre o clase de la materia |
| Credito | INT | - | NN, CK(>0) | Numero de creditos de la materia |

---

## Tabla: INSCRIBE.

**DESCRIPCION**
Representa la inscripcoin de los alumnos a las materias. Al ser una relacion N:M se comvierte en una tabla intermedia.

| CAMPO | TIPO | LONGITUD | RESTRICCIONES | DESCRIPCION |
| :---  | :--- |   :---   | :--- | :--- |
| No_alumno | INT | - | PK, FK, NN | Alumno inscrito |
| Num_materia | INT | - | PK, FK, NN | Materia inscrita |
| Fecha_inscripcion | DATO | - | NN | Fecha en que se realizo la inscripcion |
| Calificacion_final | DECIMAL | 4,2 | CK(0.00 - 10.00) | Calificacion final obtenida por el alumno |

---

## Relacion de la base de datos.

| RELACION | CARDINALIDAD | DESCRIPCION |
| :---  | :--- |   :---   |
|Alumno -> Incribe | 1:N | Un alumno puede tener varias inscripciones |
| Materia -> Incribe | 1:N | Una materia puede tener muchos alumnos inscritos |
| Alumno <--> Materia | N:M | Un alumno puede inscribirse en varias materias y una materia puede ser cursada por varios alumnos |

---

## Matriz de claves foraneas.

| TABLA | CAMPO FK | REFERENCIA |
| :---  | :--- |   :---   |
|Incribe | No_alumno | Alumno(no_alumno) |
|Incribe | Num_materia | materia(no_materia) |

## Integridad referencial.

| CODIGO | REGLA |
| :---  | :--- |
|IR-01 | No se peude registrar una inscripcion para un alumno inexistente |
|IR-02 | No se peude registrar una inscripcion para una materia inexistente |
|IR-03 | No se peude eliminar un alumno si tiene inscripciones registradas sin eliminarlas previamente |
|IR-04 | No se peude eliminar una materia que tenga alumnos inscriptos sin elimnar primero las inscripciones |

## Reglas del negocio.

| CODIGO | REGLA |
| :---  | :--- |
|RN-01 | Un alumno puede inscribirse en cero o varias materias |
|RN-02 | Toda materia debe tener almenso un alumno inscrito |
|RN-03 | Un alumno no puede inscribirse dos veces en la misma materia |
|RN-04 | La calificacion final debe estar entre 0.00 y 10.00 |
|RN-05 | La fecha de inscripcion debe corresponder a una fecha valida |

---

## Resultado Modelo E-R
![Escuela](/img/E-R/Ejercicio3.jpg)

## Resultado Modelo Relacional
![Resultado de cuadro](/img/E-R/tabla3.jpg)