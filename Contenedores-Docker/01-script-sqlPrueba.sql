CREATE TABLE pruebaatributos; //darle run

CREATE TABLE alumno(
    num_alumno int not null primary key,
    nombre varchar(50) not null,
    apellido_1 varchar(30) not null,
    apellido_2 varchar(30) NULL,
    fecha_naci date NOT NULL,
);


INSERT INTO alumno
values (1, 'Angel', 'Patricio', 'Perez', 'Hernandez', '1998-09-08');

INSERT INTO alumno
values (2, 'Ian Uriel', 'Rizo', NULL, '2007-07-25');

SELECT 
     NOMBRE, apellido_1, apellido_2, YEAR(fecha_naci)
     MONTH(fecha_naci), DAY(fecha_naci),
     ()
FROM alumno;
