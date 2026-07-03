## DICCIONARIO DE DATOS DE LA BASE DE DATOS DE PROFESORES.
---
1. Informacion general 

| Elemento | Valor |
| :---------| :---------|
| Proyecto    | PROFESORES |
| Version    | 1.0    |
| Fecha    | junio 2026    |
| Elaboro    | Ing. Yael Barrera Escamilla    |
| SGBD   | SQLServer    |
| Elaboro    | Ing. Yael Barrera Escamilla    |

```
2. Descripcion del sistema de base de datos.

el sistema administra:

- Profesores.
- Curso.

Permite tener un control de informacion sobre que profesor imparte cursos.
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

## Tabla: PROFESOR.

**DESCRIPCION**
Almacena la informacion de los profesores que imparten cursos.

| CAMPO | TIPO | LONGITUD | RESTRICCIONES | DESCRIPCION |
| :---  | :--- |   :---   | :--- | :--- |
| id_profesor | - | - | PK, AI, NN | Identificador unico del profesor |
| Nombre | VARCHAR | 50 | NN | Nombre del profesor |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido del profesor |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido del profesor |
| Espceialidad | VARCHAR | 100 | NN | Especialidad del profesor |

---

## Tabla: CURSO.

**DESCRIPCION**
Almacena la informacion de los cursos impartidos por los profesores.

| CAMPO | TIPO | LONGITUD | RESTRICCIONES | DESCRIPCION |
| :---  | :--- |   :---   | :--- | :--- |
| id_curso | INT | - | PK, AI, NN | Identificador unico del curso |
| Nombre_curso | VARCHAR | 100 | NN | Nombre del curso |
| Credito | INT | - | NN, CK(>0) | Numero de creditos del curso |
| Id_profesor | INT | - | FK, NN | Profesor que imparte el curso |

---

## Relaciones de la base de datos.

| RELACION | CARDINALIDAD | DESCRIPCION |
| :---  | :--- |   :---   |
| Profesor -> curso | 1:N | Un profesor puede impartir un o varios cursos y cada curso es impartido por un solo profesor |

---

## Matriz de claves Foraneas.

| TABLA | CAMPO FK | REFERENCIA |
| :---  | :--- | :--- |
| Curso | id_profesor | Profesor(id_profesor) |

---

## Integridad referencial.

| CODIGO | REGLA |
| :---  | :--- |
| IR-01 | No se peude registrar un curso con un profesor inexistente |
| IR-02 | No se peude eliminar un profesor que tenga cursos asignados sin antes reasignarlos o eliminarlos |
| IR-03 | Todo curso debe estar asociado a un profesor valido |

---

## Reglas del negocio.

| CODIGO | REGLA |
| :---  | :--- |
| RN-01 | Un profesor puede impartir uno o varios cursos |
| RN-02 | Cada curso debe ser impartido por un unico profesor|
| RN-03 | El numero de creditos del curso debe ser mayor que cero|
| RN-04 | La especialidad del profesor debe registrarse obligatoriamente|

## Resultado Modelo E-R
![Universidad](/img/E-R/diagrama2.jpg)

## Resultado Modelo Relacional
![Resultado de cuadro](/img/E-R/tablas_trabajo2.jpg)