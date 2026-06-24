## EJERCICIOS MODELO E-R
---
1.  EJERCICIO 1
En un hospital se registra informacion de sus pasientes

## De cada paciente se desea almacenar:

- Algo que lo identifique.
- Nombre.
- Fecha de nacimiento.

## De un expediente medico se almacena:

- Numero de expediente.
- Fecha de apertura.
- Tipo de sangre.

## Reglas del negocio.

1. Cada paciente debe tener exactamente un expediente medico.
2. Cada expediente pertenece a un unico paciente.
3. No puede existir ningun expediente medico sin paciente.
4. No puede existir un paciente sin expediente.

## Resultado Modelo E-R
![Hospital]()

## 2. Ejercicio 2

una universidad administra profesores y usrsos.

> De cada profesor se almacena:

    - Clave profesor
    - Nombre
    - Especialidad.
    
> De cada curso se alamcena:

    - Identificacion del curso
    - Nombre del curso.
    - Creditos.

> Reglas del negocio.

    1. Un profesor puede impartir varios cursos.
    2. Un curso solamente pude ser impartido por un profesor.
    3. Puede existir un profesor que actualmente no imparta cursos.
    4. Todo curso debe ser asignado a un profesor.
    
> Se debe realizar lo siguente.

    -Entidades.
    -Identificar la relaciòn.

**IMPARTE**

    -Determinar la cardinalidad.
    -Determinar la participacion.

## 3. Ejercicio 3

Una escuela administra alumnos y materias, de cada alumno se almacena.

    -matricula.
    -nombre.
    -semestre.

De cada materia se almacena.

    - Clave.
    - Nombre de la materia.
    - Creditos.

> Reglas del negocio.

1. Un alumno puede inscrivirse en varias material
2. Una materia peude tener muchos alumnos inscritos
3. Puede existir una materia sin alimnos inscritos
4. Todo alumno debe estar inscrioto al menos a una materia.
5. De cada inscripcion se debe almacenar: fehca de inscripticon y calificacion final

**La relacion entre las unidades se debe llamar INCRIBE** 

## EJERCICIO 4.

Una empresa encargadad de realizar venta de productos:

> De cada cliente se almacena:
- Numero de cliente que lo identifique.
- Nombre de cliente el cual es una persona moral.
- RFC.

> La empresa realiza pedidios en los cuales almacena lo siguiente:

- Numero de pedido.
- Fecha.

> La empresa tambien almacena productos de los cuales registra lo siguiente:

- Numero de producto.
- Nombre y precio.

> Al realizar los pedidios deben registrar la cantidad de productos pedidios y su precio.

> Reglas del negocio.

1. Un cliente puede realizar muchos pedidos.
2. Cada pedido pertenece a un solo cliente.
3. Un pedidio puede contener varios productos.
4. Un producto puede aparecer en muchos pedidos.
5. Un pedido debe contener almenos un producto.
6. Un producto puede no aver sido vendido.
7. El detalle del pedido no exite sin pedido
8. El detalle de pedidio no existe sin producto.
9. El detalle almacena cantidad y precio de venta.
 
