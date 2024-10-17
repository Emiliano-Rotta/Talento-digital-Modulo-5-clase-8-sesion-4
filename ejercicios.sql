-- Realizar Modificaciones con ALTER TABLE

--  Cambiar el nombre de la tabla
-- ALTER TABLE estudiantes RENAME TO alumnos;

-- Añadir columnas
-- ALTER TABLE alumnos ADD COLUMN direccion VARCHAR(100);
-- ALTER TABLE alumnos ADD COLUMN email VARCHAR(100);

-- Borrar columnas
-- ALTER TABLE alumnos DROP COLUMN direccion;

-- Modificar el tipo de datos de una columna
-- ALTER TABLE alumnos ALTER COLUMN edad TYPE SMALLINT;

-- Renombrar columnas
-- ALTER TABLE alumnos RENAME COLUMN email TO correo;

-- Modificar restricciones de las columnas
-- ALTER TABLE alumnos ALTER COLUMN correo SET NOT NULL;
-- ALTER TABLE alumnos ALTER COLUMN correo DROP NOT NULL;

-- ---------------------------------------------
-- -- activacion de restricciones

-- CONSTRAINT
-- Una CONSTRAINT es una restricción que se aplica a una columna o a un conjunto de columnas en una tabla para garantizar que los datos cumplan ciertas condiciones. Ayuda a asegurar la integridad de los datos y evita la inserción de valores no válidos. Algunos tipos comunes de restricciones son:

-- PRIMARY KEY: Garantiza que los valores en una columna (o conjunto de columnas) sean únicos y no nulos.
-- FOREIGN KEY: Asegura que los valores en una columna correspondan a valores en una columna de otra tabla (manteniendo la integridad referencial).
-- UNIQUE: Impide la inserción de valores duplicados en una columna.
-- CHECK: Verifica que los valores cumplan con una condición específica. (booleano, true si se da la restriccion y un false, si no se da y el registro se rechaza)
-- NOT NULL: Restringe los valores nulos en una columna.

------------------------
Añadir una Restricción CHECK
ALTER TABLE alumnos ADD CONSTRAINT chk_edad CHECK (edad BETWEEN 18 AND 60);

borrar la restriccion
ALTER TABLE alumnos DROP CONSTRAINT chk_edad;

Cambiar el Nombre de una Restricción
ALTER TABLE alumnos RENAME CONSTRAINT chk_edad TO check_edad


otra restriccion:
ALTER TABLE alumnos ADD CONSTRAINT chk_correo_valido CHECK (correo LIKE '%_@__%.__%');










--------------------------------------------------------------
-- Ejercicio 1: Modificación de la Tabla alumnos
-- Consigna:

-- Crea una base de datos llamada escuela.
CREATE DATABASE escuela;
\c escuela;
-- Dentro de esta base de datos, crea una tabla llamada alumnos con las siguientes columnas:
-- id (serial, clave primaria)
-- nombre (varchar de 50 caracteres, no nulo)
-- edad (entero)
-- correo (varchar de 100)
CREATE TABLE alumnos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    edad INT,
    correo VARCHAR(100)
);
-- Inserta los siguientes datos en la tabla alumnos:
-- ('Pedro García', 20, 'pedro.garcia@mail.com')
-- ('Laura Fernández', 22, 'laura.fernandez@mail.com')
INSERT INTO alumnos (nombre, edad, correo) VALUES
('Pedro García', 20, 'pedro.garcia@mail.com'),
('Laura Fernández', 22, 'laura.fernandez@mail.com');
-- Realiza las siguientes modificaciones a la tabla:
-- Cambia el nombre de la tabla a estudiantes.
ALTER TABLE alumnos RENAME TO estudiantes;
-- Añade una columna llamada direccion (varchar de 100 caracteres).
ALTER TABLE estudiantes ADD COLUMN direccion VARCHAR(100);
-- Cambia el tipo de datos de la columna edad a smallint.
ALTER TABLE estudiantes ALTER COLUMN edad TYPE SMALLINT;
-- Renombra la columna correo a email.
ALTER TABLE estudiantes RENAME COLUMN correo TO email;
-- Elimina la columna direccion.
ALTER TABLE estudiantes DROP COLUMN direccion;
-- Agrega una restricción CHECK para asegurar que edad esté entre 18 y 30.
ALTER TABLE estudiantes ADD CONSTRAINT chk_edad CHECK (edad BETWEEN 18 AND 30);
-- Desactiva y vuelve a activar la restricción CHECK.
ALTER TABLE estudiantes DROP CONSTRAINT chk_edad;
ALTER TABLE estudiantes ADD CONSTRAINT chk_edad CHECK (edad BETWEEN 18 AND 30);
-- Renombra la restricción a chk_edad_estudiante.
ALTER TABLE estudiantes RENAME CONSTRAINT chk_edad TO chk_edad_estudiante;

-- Ejercicio 2: Restricciones de Validación
-- Consigna:

-- Crea una base de datos llamada inventario.
CREATE DATABASE inventario;
\c inventario;
-- Dentro de esta base de datos, crea una tabla llamada productos con las siguientes columnas:
-- id_producto (serial, clave primaria)
-- nombre (varchar de 100 caracteres, no nulo)
-- cantidad (entero, no nulo)
-- precio (decimal, no nulo)
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL NOT NULL
);
-- Inserta los siguientes datos en la tabla productos:
-- ('Laptop', 10, 800.50)
-- ('Mouse', 25, 20.75)
INSERT INTO productos (nombre, cantidad, precio) VALUES
('Laptop', 10, 800.50),
('Mouse', 25, 20.75);
-- Agrega las siguientes restricciones:

-- CHECK para asegurar que cantidad sea mayor o igual a 0.
ALTER TABLE productos ADD CONSTRAINT chk_cantidad CHECK (cantidad >= 0);
-- Desactiva la restricción CHECK y vuelve a activarla.
ALTER TABLE productos DROP CONSTRAINT chk_cantidad;
ALTER TABLE productos ADD CONSTRAINT chk_cantidad CHECK (cantidad >= 0);
-- Renombra la restricción CHECK a chk_cantidad_producto.
ALTER TABLE productos RENAME CONSTRAINT chk_cantidad TO chk_cantidad_producto;
-- Agrega una nueva restricción que valide que el precio sea positivo.
ALTER TABLE productos ADD CONSTRAINT chk_precio CHECK (precio > 0);

-- Ejercicio 3: Práctica Integral
-- Consigna:

-- Crea una base de datos llamada biblioteca.
CREATE DATABASE biblioteca;
\c biblioteca;
-- Dentro de esta base de datos, crea una tabla llamada libros con las siguientes columnas:
-- id_libro (serial, clave primaria)
-- titulo (varchar de 150 caracteres, no nulo)
-- autor (varchar de 100 caracteres, no nulo)
-- anio_publicacion (entero, no nulo)
-- stock (entero, no nulo)
CREATE TABLE libros (
    id_libro SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    anio_publicacion INT NOT NULL,
    stock INT NOT NULL
);
-- Inserta los siguientes datos en la tabla libros:
-- ('Cien años de soledad', 'Gabriel García Márquez', 1967, 5)
-- ('Don Quijote de la Mancha', 'Miguel de Cervantes', 1605, 2)

INSERT INTO libros (titulo, autor, anio_publicacion, stock) VALUES
('Cien años de soledad', 'Gabriel García Márquez', 1967, 5),
('Don Quijote de la Mancha', 'Miguel de Cervantes', 1605, 2);

-- Realiza las siguientes operaciones:
-- Agrega una restricción CHECK que asegure que anio_publicacion no sea mayor que el año actual.
ALTER TABLE libros ADD CONSTRAINT chk_anio CHECK (anio_publicacion <= EXTRACT(YEAR FROM CURRENT_DATE));
-- Desactiva la restricción y luego vuelve a activarla.
ALTER TABLE libros DROP CONSTRAINT chk_anio;
ALTER TABLE libros ADD CONSTRAINT chk_anio CHECK (anio_publicacion <= EXTRACT(YEAR FROM CURRENT_DATE));
-- Renombra la restricción a chk_anio_libro.
ALTER TABLE libros RENAME CONSTRAINT chk_anio TO chk_anio_libro;
-- Agrega una columna llamada editorial (varchar de 100 caracteres).
ALTER TABLE libros ADD COLUMN editorial VARCHAR(100);
-- Elimina la columna stock.
ALTER TABLE libros DROP COLUMN stock;
-- Modifica la columna anio_publicacion para permitir valores nulos.
ALTER TABLE libros ALTER COLUMN anio_publicacion DROP NOT NULL;