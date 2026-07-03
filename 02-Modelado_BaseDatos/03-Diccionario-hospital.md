## DICCIONARIO DE DATOS DE LA BASE DE DATOS DE HOSPITAL.
---
1. Informacion general 

| Elemento | Valor |
| :---------| :---------|
| Proyecto    | HOSPITAL    |
| Version    | 1.0    |
| Fecha    | julio 2026    |
| Elaboro    | Ing. Yael Barrera Escamilla    |
| SGBD   | SQLServer    |
| Elaboro    | Ing. Yael Barrera Escamilla    |

```

2. Descripcion del sistema de base de datos.

el sistema administra:
- Paciente.
- Expediente.

Permite controlar mejor la administraicon del ospital y como se guardan estos los datos importantes.

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

## Tabla: PACIENTE.

**DESCRIPCION**
Almacena la informcaion general de los pacientes.

| CAMPO | TIPO | LONGITUD | RESTRICCIONES | DESCRIPCION |
| :---  | :--- |   :---   | :--- | :--- |
| No_paciente | INT | - | PK,AI,NN | Identificador unico del paciente |
| Nombre | VARCHAR | 50 | NN | Nombre del paciente |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido |
| Peso | DECIMAL | 5,2 | NN | Peso del paciente en kg |
| Edad | INT | - | NN,CK(>=0) | Edad del pacuente |
| Atributo | VARCHAR | 100 | NULL | Dato adicional del paciente |

---

## Tabla: EXPEDIENTE.

**DESCRIPCION**
Almacena la informacion del expediente medico de cada paciente.

| CAMPO | TIPO | LONGITUD | RESTRICCIONES | DESCRIPCION |
| :---  | :--- |   :---   | :--- | :--- |
| No_expediente | INT | - | PK,AI,NN | Identificador U expediente. |
| Fecha_apertura | DATO | - | NN | Fecha de apartura del expediente |
| Tipo_sangre | VARCHAR | 5 | NN | Tipo de sangre del paciente |
| No_paciente | INT | - | FK,UQ,NN | Paciente al que pertenece el expediente |

---

## Relacion de la base de datos

| RELACION | CARDINALIDAD | DESCRIPCION |
| :---  | :--- |   :---   |
| Paciente-Expediente | 1:1 | Un paciuente tiene un solo expediente y un expediente pertenece a un solo paciente |

---

## Matriz de claves foraneas.

| TABLA | CAMPO FK | REFERENCIA |
| :---  | :--- |   :---   |
| Expediente | No_paciente | Paciente(No_paciente) |

---

## Integridad referencial.

| CODIGO | REGLA |
| :---  | :--- |
| IR-01 | No de puede crear un expediente para un paciente inexistente |
| IR-02 | No de puede eliminar un paciente que tenga expediente asociado sin eliminar o reasignar primero el expediente |
| IR-03 | Cada expediente debe estar asociado a un unico paciente |

---

## Reglas del negocio.

| CODIGO | REGLA |
| :---  | :--- |
| IR-01 | Un pacuente solo puede tener un expediente |
| IR-02 | Un expediente pertenece a un solo pacuente |
| IR-03 | La edad del pacuente debe ser mayor que 0 |
| IR-04 | El peso del pacuente de ser mayor que 0 |
| IR-05 | La fecha de paertura del expediente no puede ser futura |

---

## Resultado Modelo E-R
![Hospital](/img/E-R/trabajo1.jpg)

## Resultado Modelo Relacional
![Resultado de ejercicio.](/img/E-R/ejercicio1.jpg)