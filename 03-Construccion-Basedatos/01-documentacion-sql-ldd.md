# CONSTRUCCION DE BASE DE DATOS CON SQL-LDD
---

SQL(Structured Query Languge) se divide en cinco grandes categorias:

1. **DDL (Data Definition Lenguage)**
2. **DML (Data Manipulation Lenguage)**
3. **DQL (Data Query Lenguage)**
4. DCL (DAta Comtrol Lenguage)
5. TCL (Transaction Control Lenguage)

## SQL-LDD
**Lenguage de Definicion de Datos**
Se utiliza para **crear y modificar la estructura** de una base de datos.

con DDL trabajamos sobre los objetos de la base de datos:

- Base de datos.
- Tablas.
- Visitas.
- Indices.
- Restricciones.
- Esquemas.
- Stores Procedures.
- Trigger.
- Funciones.

### COMANDOS PRINCIPALES

| Comando | Funcion |
|:--- | :--- |
| CREATE | Crea objetos |
| ALTER | Modifica objetos |
| DROP | Elimina objetos |
| TRUNCATE | Vacia una tabla |

## SQL-DML

**Lenguage de Manipulacion de Datos**

Sirve para **trabajar con la informacion alamacenada**
Aqui no cambia la estructura, si no los registros

### COMANDOS PRINCIPALES

| Comando | Funcion |
|:--- | :--- |
| INSERT | Imserta Registros |
| UPDATE | Actualizar Registros |
| DELETE | Eliminar Registros |

## SQL-DQL

**Lenguage de Consulta de Datos**

Su funcion principal es **consultar informacion**

### COMANDOS PRINCIPALES

| Comando | Funcion |
|:--- | :--- |
| SELECT | Consulta Información |

Generalmente se conbina con

- WHERE
- ORDER BY
- GROUP
- HAVING
- JOIN (LEFT, RIGHT, INNER, CROSS Y FULL)
- DISTICT
- TOP / LIMIT
- Funciones de agregado (SUM, AVG, MAX, MIN, COUNT)
- Funciones de Ventana (WINDOW, FUNTION)

## Nomenclatura snake_case

**snake_case** es la convencion mas recomendada el dia de ahora si se busca una nomenclatura moderna, portable y alineada con buenas practicas en distintos motores de base de datos.

La razón es lque funciona de forma consistente en **SQL-server, Mysql** y especialmente en **PostgreSQL** con *snake_case* se evitan problemas de mayusculas y se hacen las consultas que sean mas legibles.

### ESTANDAR DE CONSTRUCCION

| OBJETO | CONVENCION | EJEMPLO |
| :--- | :--- | :--- |
| Base de Datos | Snake_case | control_escolar |
| Esquema | Snake_case | ventas, rh, seguridad |
| Tabla | Singurlar en snake_case | Cliente, pedido, detalle_pedido |
| Columna | snake_case | Cliente_id, fecha_registro, nombre, correo_electronico |
| PK | <tabla>_id | Cliente_id, categoria_id |
| FK | Igual que la PK referenciada | cliente_id, producto_id |
| Tabla Puente | <tabla1>_ <tabla2> | alumno_curso, proovedor_producto |

**Nombrar las Restricciones**

- pk_cliente.
- fk_pedido_cliente --> pk_tablaorigen_tablareferencuada  
- uq_cliente_correo_electronico
- ck_producto_precio
- df_cliente_activo

## Alter Table

Permite modificar una tabla existente

- Agregar columnas.
- Eliminar columnas.
- Modificar columnas.
- Agregar restricciones.
- Eliminar restricciones.
