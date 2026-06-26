## DICCIONARIO DE DATOS DE LA BASE DE DATOS DE CONTROL ESCOLAR.
---
1. Informacion general 
```
| Elemento | Valor |
|-----------|-----------|
| Proyecto    | Control escolar    |
| Version    | 1.0    |
| Fecha    | junio 2026    |
| Elaboro    | Ing. Yael Barrera Escamilla    |
| SGBD   | SQLServer    |
| Elaboro    | Ing. Yael Barrera Escamilla    |

```
2. Descripcion del sistema de base de datos.

el sistema administra:
- Carrera
- Alumnos
- Profesores
- Materias
- Grupos
- Incripciones

Permite controlar la oferta academica y la inscripcion de estudiantes.

3. Catalogo de restricciones utilizadas

```
| Codigo    | Significado    |
|-----------|----------------|
| PK        | Primary key    |
| FK        | Foreign key    |
| NN        | NOT NULL       |
| UQ        | UNIQUE         |
| AI        | Auto Increment |
| CK        | CHECK          |
| DF        | DEFAULT        |
| PK        | Primary key    |
| PK        | Primary key    |

```
4. Diccionario de datos.

## Taba: Carrera

**DESCRIPCION**
Almacena las carreras ofertadas por la universidad


campo   tipo    longitu restricciones   descricion
id_carrera  INT     -   PK,AI,NN    Identificador unico de la carrera
nombre  varchar 100     UQ,NN   Nombre de ka carrera
duracion_cuatrimestre   INT -   NN,CK(>0)   Nombre