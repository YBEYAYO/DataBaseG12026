-- Crear la base de datos.
CREATE DATABASE empresavent;

-- Usar la base de datos.
USE empresavent;

-- Tabla cliente.
CREATE TABLE cliente(
	id_cliente CHAR(5) NOT NULL,
	empresa VARCHAR(40) NOT NULL,
	rfc CHAR(13) NOT NULL,
	CONSTRAINT pk_cliente
	PRIMARY KEY (id_cliente)
);

-- Tabla pedido
CREATE TABLE pedido(
	numpedido CHAR(5) NOT NULL,
	fecha DATE NOT NULL,
	id_cliente CHAR(5) NOT NULL,
	CONSTRAINT pk_pedido
	PRIMARY KEY (numpedido),
	CONSTRAINT fk_pedido_cliente
	FOREIGN KEY (id_cliente)
	REFERENCES cliente(id_cliente)
);

-- Tabla producto
CREATE TABLE producto (
	numproducto CHAR(5) NOT NULL,
	nombre VARCHAR(40) NOT NULL,
	precio DECIMAL(10,2) NOT NULL,
	CONSTRAINT pk_producto
	PRIMARY KEY (numproducto)
);

-- Tabla detalle
CREATE TABLE detalle(
	numpedido CHAR(5) NOT NULL,
	numproducto CHAR(5) NOT NULL,
	cantidad INT NOT NULL,
	precioventa DECIMAL(10,2) NOT NULL,
	CONSTRAINT pk_detalle
	PRIMARY KEY (numpedido, numproducto),
	CONSTRAINT fk_detalle_pedido
	FOREIGN KEY (numpedido)
	REFERENCES pedido(numpedido),
	CONSTRAINT fk_detalle_producto
	FOREIGN KEY (numproducto)
	REFERENCES producto(numproducto)
);