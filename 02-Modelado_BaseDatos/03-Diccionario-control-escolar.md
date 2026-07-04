## DICCIONARIO DE DATOS DE LA BASE DE DATOS DE EMPRESA.
---
1. Informacion general 

| Elemento | Valor |
| :---------| :---------|
| Proyecto    | Control escolar |
| Version    | 1.0    |
| Fecha    | junio 2026    |
| Elaboro    | Ing. Yael Barrera Escamilla    |
| SGBD   | SQLServer    |
| Elaboro    | Ing. Yael Barrera Escamilla    |

```
2. Descripcion del sistema de base de datos.

el sistema administra:
Carrera
- Alumnos
- Profesores
- Materias
- Grupos
- Incripciones

Permite controlar la oferta academica y la inscripcion de estudiantes.
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

## Tabla: CARRERA.

**DESCRIPCION**
Almacena las carreras ofertadas por la universidad

| CAMPO | TIPO | LONGITUD | RESTRICCIONES | DESCRIPCION |
| :---  | :--- |   :---   | :--- | :--- |
| id_carrera | INT | - | PK,AI,NN | Identificador unico de la carrera |
| Nombre | VARCHAR | 100 | UQ,NN | Nombre de la carrera |
| Duracion_cuatrimestre | INT | - | NN, CK(>0) | Tiempo que va a durar el cuatrimestre |

## Tabla: ALUMNO

**DESCRIPCION**
Almacena Informacion de los eestudiantes.

| CAMPO | TIPO | LONGITUD | RESTRICCIONES | DESCRIPCION |
| :---  | :--- |   :---   | :--- | :--- |
| id_alumno | INT | - | PK, AI, NN | Identificador unico del alumno |
| Matricula | VARCHAR | 10 | UQ,NN | Matricula intitucional |
| nombre | VARCHAR | 30 | NN | Nombre del alumno |
| apellido_paterno | VARCHAR | 50 | NN | Apellido paterno del alumno |
| apellido_materno  | VARCHAR | 50 | NULL | Apelllido materno del alumno |
| correo | VARCHAR | 100 | UQ,NN | Correo institucional |
| fecha_nacimiento | DATO | - | NN | Fecha de nacimiento del alumno |
| id_carrera | INT | - | FK,NN | Carrera a la que pertenece |

---

5. Relaciones en la base de datos

| RELACION | CARDINALIDAD | DESCRIPCION |
| :---------| :---------| :---------|
| Carrera -> Alumno | 1:N | Una carrera tiene muchos alumnos |
| Carrera -> Materia | 1:N | Una carrera tiene muchas materias |
| Profesor -> Grupo | 1:N | Una carrera puede impartir varios grupos |
| Materia -> Grupo | 1:N | Una materia puede abrirse en varios grupos |
| Alumno -> Inscripciòn | 1:N | Un alumno puede tener varias inscripciones |
| Grupo -> Inscripciòn | 1:N | Un grupo puede terner muchos alumnos |

---

6. Matriz de Claves Foraneas

| TABLA | CAMPO FK | REFERENCIA |
| :---------| :---------| :---------|
| Alumno | id_carrera | Carrera(id_carrera) |
| Materia | id_carrera | Carrera(id_carrera) |
| Grupo | id_profesor | Profesor(id_profesor) |
| Grupo | id_materia | Materia(id_materia) |
| Inscripcion | id_alumno | Alumno(id_alumno) |
| Inscripcion | id_grupo | Grupo(id_grupo) |

---

7. Integridad Referencial

| CODIGO | REGLA |
| :--- | :--- |
| IR-01 | No se peude registrar un alumno con una carrera inexistente |
| IR-02 | No se puede crear un grupo para una materia inexistente |
| IR-03 | No se puede crear un grupo para un profesor inexistente |
| IR-04 | No se puede inscribir un alumno en un grupo incexistente |
| IR-05 | No se puede eliminar una carrera que tenga alumnos asociados sin antes reasignarlos o eliminarlos |

---
8. Reglas del Negocio

| CODIGO | REGLA |
| :--- | :--- |
| RN-01 | Un alumno pertenece a una sola carrera |
| RN-02 | Una carrera puede tener muchos alumnos |
| RN-03 | Una carrera puede tener muchas materias |
| RN-04 | Un profesor puede impartir varios grupos |
| RN-05 | Un grupo solo puede terner un profesor asignado |
| RN-06 | la calificacion debe estar entre 0.0 y 10.0 |

---