## DICCIONARIO DE DATOS DE LA BASE DE DATOS DE LA ADMINISTRACION DE EMPRESA.
---
1. Informacion general 

| Elemento | Valor |
| :---------| :---------|
| Proyecto    | Empresa |
| Version    | 1.0    |
| Fecha    | julio 2026    |
| Elaboro    | Ing. Yael Barrera Escamilla    |
| SGBD   | SQLServer    |
| Elaboro    | Ing. Yael Barrera Escamilla    |

```
2. Descripcion del sistema de base de datos.

La empresa administra y quiere gusrdar los siguientes datos:
- Empleado.
- Departamento.
- Depedent.
- Proyecto

y dos relaciones:
- Manage.
- Starday.

Permite llevar un registro detallado de lo que se hace en la empresa.
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

## Tabla: EMPLEADO.

**DESCRIPCION**
Almacena la informacion de los empleado de la empresa.

| CAMPO | TIPO | LONGITUD | RESTRICCIONES | DESCRIPCION |
| :---  | :--- |   :---   | :--- | :--- |
| SSN | CHAR | 11 | PK, NN | Numero de seguro social del empleado |
| nombre | VARCHAR | 50 | NN | Nombre del empleado |
| apellido | VARCHAR | 50 | NN | Apellido del empleado |
| fecha_nacimiento | DATE | - | NN | Fecha de nacimiento del empleado |
| direccion | VARCHAR | 150 | NN | Direccion del empleado |
| Sexo | CHAR | 1 | NN,CK('M','F') | Sexo del empleado |
| Salario | DECIMAL | 10,2 | NN,CK(>0) | Salario del empleado |
| Supervisor_ssn | CHAR | 11 | FK | Supervisor inmediato del empleado |
| id_departamento | INT | - | FK,NN | Departamento donde trabaja |

---

## Tabla: DEPARTAMENTO.

**DESCRIPCION**
Almacena la informacion de los departamentos de la empresa.

| CAMPO | TIPO | LONGITUD | RESTRICCIONES | DESCRIPCION |
| :---  | :--- |   :---   | :--- | :--- |
| Numero | INT | - | PK, AI, NN | Identificador unico del departamento |
| Nombre | VARCHAR | 100 | UQ,NN | Nombre del departamento |
| Gerente_ssn | CHAR | 11 | FK | Empleado que administra el departamento |
| Fecha_inicio | DATE | - | NN | Fecha en que el gerente asumio el cargo |

---

## Tabla: UBICACION DE DEPARTAMENTO.

**DESCRIPCION**
Almacena las ubicaciones de cada departamento.

| CAMPO | TIPO | LONGITUD | RESTRICCIONES | DESCRIPCION |
| :---  | :--- |   :---   | :--- | :--- |
| numero_departamento | INT | - | PK, FK | Departamento al que pertencece la ubicacion |
| ubicacion | VARCHAR | 100 | PK | Ubicacion del departamento |

---

## Tabla: PROYECTO

**DESCRIPCION**
Almacena los proyectos desarrollados por la empresa.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :---: | :--- | :--- |
| numero | INT | - | PK, AI, NN | Identificador del proyecto |
| nombre | VARCHAR | 100 | UQ, NN | Nombre del proyecto |
| ubicacion | VARCHAR | 100 | NN | Lugar donde se desarrolla el proyecto |
| numero_departamento | INT | - | FK, NN | Departamento responsable del proyecto |

---

## Tabla: Dependiente

**Descripción**  
Almacena la información de los dependientes de cada empleado.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :---: | :--- | :--- |
| id_dependiente | INT | - | PK, AI, NN | Identificador único del dependiente |
| nombre | VARCHAR | 50 | NN | Nombre del dependiente |
| sexo | CHAR | 1 | NN | Sexo del dependiente. |
| fecha_nacimiento | DATE | - | NN | Fecha de nacimiento del dependiente |
| parentesco | VARCHAR | 30 | NN | Relación con el empleado |
| ssn | CHAR | 11 | - | FK, NN | Empleado al que pertenece el dependiente |

---

## Tabla: Trabaja_En

**Descripción**  
Representa la asignación de empleados a proyectos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :---: | :--- | :--- |
| ssn | CHAR | 11 | PK, FK | Empleado asignado al proyecto |
| numero_proyecto | INT | - | PK, FK | Proyecto asignado al empleado |

---

## Relaciones de la Base de Datos

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Empleado → Departamento | N:1 | Cada empleado trabaja en un solo departamento |
| Departamento → Empleado | 1:N | Un departamento tiene varios empleados |
| Empleado → Empleado | 1:N | Un supervisor puede supervisar a varios empleados |
| Empleado → Dependiente | 1:N | Un empleado puede tener varios dependientes |
| Departamento → Proyecto | 1:N | Un departamento controla varios proyectos |
| Empleado ↔ Proyecto | N:M | Un empleado puede trabajar en varios proyectos y un proyecto puede tener varios empleados |
| Empleado → Departamento (Manage) | 1:1 | Un empleado administra un departamento |

---

## Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Empleado | supervisor_ssn | Empleado(ssn) |
| Empleado | id_departamento | Departamento(numero) |
| Departamento | gerente_ssn | Empleado(ssn) |
| Proyecto | numero_departamento | Departamento(numero) |
| Dependiente | ssn | Empleado(ssn) |
| Trabaja_En | ssn | Empleado(ssn) |
| Trabaja_En | numero_proyecto | Proyecto(numero) |
| Ubicacion_Departamento | numero_departamento | Departamento(numero) |

---

## Integridad Referencial

| Código | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un empleado en un departamento inexistente |
| IR-02 | No se puede asignar un gerente que no exista como empleado |
| IR-03 | No se puede registrar un dependiente para un empleado inexistente |
| IR-04 | No se puede asignar un empleado a un proyecto inexistente |
| IR-05 | No se puede eliminar un departamento si tiene empleados o proyectos asociados |
| IR-06 | No se puede registrar una ubicación para un departamento inexistente |

---

## Reglas del Negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Cada empleado pertenece a un solo departamento |
| RN-02 | Un departamento puede tener muchos empleados |
| RN-03 | Un empleado puede supervisar a varios empleados |
| RN-04 | Un empleado puede administrar como máximo un departamento |
| RN-05 | Un departamento debe tener un único gerente |
| RN-06 | Un proyecto pertenece a un solo departamento |
| RN-07 | Un empleado puede participar en varios proyectos |
| RN-08 | Un proyecto puede tener varios empleados asignados |
| RN-09 | Un empleado puede registrar cero o varios dependientes |

## Resultado Modelo E-R
![Empresa](/img/E-R/Diagrama6.jpg)

## Resultado Modelo Relacional
![Resultado de cuadro](/img/E-R/tabla6.jpg)
