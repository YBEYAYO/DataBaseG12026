## DICCIONARIO DE DATOS DE LA BASE DE DATOS DE VENTAS DE PRODUCTO.
---
1. Informacion general 

| Elemento | Valor |
| :---------| :---------|
| Proyecto    | Venta de producto |
| Version    | 1.0    |
| Fecha    | junio 2026    |
| Elaboro    | Ing. Yael Barrera Escamilla    |
| SGBD   | SQLServer    |
| Elaboro    | Ing. Yael Barrera Escamilla    |

```
2. Descripcion del sistema de base de datos.

el sistema administra:
- Cliente.
- Pedido.
- Producto.

y dos relaciones:
- Venta.
- Detalle.
- Precioventa.
- Cantidad.

Permite llevar un registro para cada venta realizada en la empresa.
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

## Tabla: CLIENTE.

**DESCRIPCION**
Almacena la informacion de los clientes que realizan pedidos.

| CAMPO | TIPO | LONGITUD | RESTRICCIONES | DESCRIPCION |
| :---  | :--- |   :---   | :--- | :--- |
| id_cliente | INT | - | PK, AI, NN | Identificador unico del cliente |
| Empresa | VARCHAR | 100 | NN | Nombre de la empresa cliente |
| RFC | VARCHAR | 13 |  UQ, NN | Registro federal del contribuyente del cliente |

---

## Tabla: PEDIDO.

**DESCRIPCION**
Almacena la informacion de los pedidios realizados por los clientes.

| CAMPO | TIPO | LONGITUD | RESTRICCIONES | DESCRIPCION |
| :---  | :--- |   :---   | :--- | :--- |
| numpedido | INT | - | PK, AI, NN | Identificador unico del pedido |
| Fecha | DATO | - | NN | Fecha en que se realizo el pedido |
| id_cliente | INT | - | FK, NN | Cliente que realizo el pedidio. |

---

## Tabla: PRODUCTO.

**DESCRIPCION**
Almacena la informacion de los productos disponibles para la venta.

| CAMPO | TIPO | LONGITUD | RESTRICCIONES | DESCRIPCION |
| :---  | :--- |   :---   | :--- | :--- |
| num_producto | INT | - | PK, AI, NN | Identificador unico del producto |
| Nombre | VARCHAR | 100 | NN | Nombre del producto |
| Precio | DECIMAL | 10,2 | NN, CK(>0) | Precio del producto |
---

## Tabla: DETALLE.

**DESCRIPCION**
Representa el detalle de cada pedido, indica los productos, la cantidad y el precio de venta.

| CAMPO | TIPO | LONGITUD | RESTRICCIONES | DESCRIPCION |
| :---  | :--- |   :---   | :--- | :--- |
| num_pedido | INT | - | PK, FK, NN | Pedido al que pertenece el detalle |
| num_producto | INT | - | PK, FK, NN | Producto incluido en el pedido |
| Cantidad | INT | - | NN, CK(>0) | Cantidad solicitada del producto |
| Precio_venta | DECIMAL | 10,2 | NN, CK(>0) | Precio de venta del producto en ese pedido |
---

## Relaciones de la base de datos.

| RELACION | CARDINALIDAD | DESCRIPCION |
| :---  | :--- |   :---   |
| Cliente -> Pedido | 1:N | Un cliente puede realizar uno o varios pedidios |
| Pedido -> Detalle | 1:N | Un pedido puede contener varios productos |
| Producto -> Detalle | 1:N | Un producto puede aparecer en varios pedidos |
| Pedido <--> Producto | N:M | Un pedido puede contener varios produtos y un producto puede formar parte de varios pedidios |

---

## Matriz de claves Foraneas.

| TABLA | CAMPO FK | REFERENCIA |
| :---  | :--- | :--- |
| Pedido | id_cliente | Cliente(id_cliente) |
| Detalle | num_pedido | Pedido(num_pedido) |
| Detalle | num_producto | Producto(num_producto) |

---

## Integridad referencial.

| CODIGO | REGLA |
| :---  | :--- |
| IR-01 | No se peude un pedidio para un cliente inexistente |
| IR-02 | No se puede agregar un detalle para un pedido no existe |
| IR-03 | No se puede registrar un producto en un detalle si el producto no existe |
| IR-04 | No se puede eliminar un cliente que tenga pedidos registrados sin eliminarlos o reasignarlos previamente |
| IR-05 | No se puede eliminar un producto que este registrado en un detalle de pedido |

---

## Reglas del negocio.

| CODIGO | REGLA |
| :---  | :--- |
| RN-01 | Un cliente puede realizar uno o varios pedidos |
| RN-02 | Cada pedido pertenece a un solo cliente |
| RN-03 | Un pedido debe contener al menos un producto |
| RN-04 | La cantidad de cada producto debe ser mayor a 0 |
| RN-05 | El precio de venta debe ser mayor que 0 |
| RN-06 | El RFC de cada cliente debe ser unico |

---

## Resultado Modelo E-R
![Empresa](/img/E-R/diagrama4.jpg)

## Resultado Modelo Relacional
![Resultado de cuadro](/img/E-R/)