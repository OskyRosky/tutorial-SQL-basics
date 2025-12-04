-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
--      Los comandos en SQL:        																		    	--
--      DDL, DML, DCL y TCL       																			  	  -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- Define database schema in DBMS                                          --
-- DDL                                                                     --
-- Los principales comandos son CREATE, DROP, ALTER y TRUNCATE             --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- Creemos una estrurtura de poder entender bien el uso de los comandos DDL --

-- Creación de la base de datos DDL_Example
CREATE DATABASE DDL_Example;
USE DDL_Example;

-- Creación de la tabla Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Email VARCHAR(255)
);

-- Creación de la tabla Productos
CREATE TABLE Productos (
    ProductoID INT AUTO_INCREMENT PRIMARY KEY,
    NombreProducto VARCHAR(255),
    Precio DECIMAL(10,2)
);

-- Creación de la tabla Ordenes
CREATE TABLE Ordenes (
    OrdenID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT,
    FechaOrden DATE,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

-- Creación de la tabla Detalle_Ordenes
CREATE TABLE Detalle_Ordenes (
    DetalleID INT AUTO_INCREMENT PRIMARY KEY,
    OrdenID INT,
    ProductoID INT,
    Cantidad INT,
    FOREIGN KEY (OrdenID) REFERENCES Ordenes(OrdenID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Inserción de una fila en cada tabla
INSERT INTO Usuarios (Nombre, Apellido, Email) VALUES ('John', 'Doe', 'john.doe@example.com');
INSERT INTO Productos (NombreProducto, Precio) VALUES ('Producto A', 20.50);
INSERT INTO Ordenes (UsuarioID, FechaOrden) VALUES (1, '2023-10-22');
INSERT INTO Detalle_Ordenes (OrdenID, ProductoID, Cantidad) VALUES (1, 1, 2);


--  Veamos el uso de cada uno de las funciones del DDL

-- CREATE : creación tanto de una base de datos como de tablas --

-- 1. Creación de una tabla de categorías
CREATE TABLE Categorias (
    CategoriaID INT AUTO_INCREMENT PRIMARY KEY,
    NombreCategoria VARCHAR(255)
);

-- 2. Creación de una tabla de marcas
CREATE TABLE Marcas (
    MarcaID INT AUTO_INCREMENT PRIMARY KEY,
    NombreMarca VARCHAR(255)
);



-- DROP : Elimina tanto de una base de datos como de tablas

-- 1. Eliminación de la tabla Categorias
DROP TABLE Categorias;

-- 2. Eliminación de la tabla Marcas
DROP TABLE Marcas;


-- ALTER : se utiliza para "alterar" o mejor dicho, modificar tanto las propiedades de las tablas como de las bases de datos

-- 1. Agregar una nueva columna a la tabla Usuarios
ALTER TABLE Usuarios ADD COLUMN FechaRegistro DATE;

-- 2. Cambiar el tipo de dato de la columna Precio en la tabla Productos
ALTER TABLE Productos MODIFY COLUMN Precio DECIMAL(10,3);


-- TRUNCATE :  Este comando elimina todos los registros de una tabla, pero mantiene la estructura de la tabla intacta para un uso futuro. 
--              Es decir, la tabla sigue existiendo, pero estará vacía después de ejecutar el comando TRUNCATE.

-- Truncar la tabla Detalle_Ordenes primero ya que también tiene una restricción de clave foránea
TRUNCATE TABLE Detalle_Ordenes;

-- Ahora puedes truncar la tabla Usuarios
TRUNCATE TABLE Usuarios;          
-- ¿Por qué el error?


-- Para truncar las otras tablas de dimensión, se debe si o si, modificar la condición de las llaves foraneas
-- Sino por el principo  de existencia de referencia, ya que podría resultar en datos inconsistentes entre las dos tablas

-- Eliminar la restricción de clave foránea
ALTER TABLE Ordenes DROP FOREIGN KEY ordenes_ibfk_1;

-- Truncar la tabla Usuarios
TRUNCATE TABLE Usuarios;


-- El comando RENAME se utiliza para cambiar el nombre de los objetos del esquema, como tablas y bases de datos.

-- Cambiar el nombre de la tabla Usuarios a Clientes
RENAME TABLE Usuarios TO Clientes;

-- Cambiar el nombre de la tabla Productos a Articulos
RENAME TABLE Productos TO Articulos;

-- El comando COMMENT se utiliza para agregar comentarios descriptivos a los objetos del esquema, como tablas y columnas. 
-- Los comentarios son una buena práctica ya que ayudan a documentar la finalidad y el uso de diferentes partes de tu esquema de base de datos.

-- Agregar comentarios a la tabla y columnas
-- COMMENT ON TABLE Usuarios IS 'Tabla que almacena la información de los usuarios';
-- COMMENT ON COLUMN Usuarios.Nombre IS 'Nombre del usuario';
-- COMMENT ON COLUMN Usuarios.Apellido IS 'Apellido del usuario';
-- COMMENT ON COLUMN Usuarios.Email IS 'Correo electrónico del usuario';

-- Agregar comentarios a la tabla y columnas
-- COMMENT ON TABLE Productos IS 'Tabla que almacena la información de los productos';
-- COMMENT ON COLUMN Productos.NombreProducto IS 'Nombre del producto';
-- COMMENT ON COLUMN Productos.Precio IS 'Precio del producto';


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  --   
-- Manipulate data present in the BD                                              --
-- DML                                                                            --
-- Los principales comandos son INSERT, UPDATE, DELETE, MERGE, CALL, EXPLAIN PLAN --                   
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  --

-- Creemos una estrurtura de poder entender bien el uso de los comandos DML --

-- Crear la base de datos DML_Example
CREATE DATABASE DML_Example;
USE DML_Example;

-- Crear la tabla Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Email VARCHAR(255)
);

-- Crear la tabla Productos
CREATE TABLE Productos (
    ProductoID INT AUTO_INCREMENT PRIMARY KEY,
    NombreProducto VARCHAR(255),
    Precio DECIMAL(10,2)
);

-- Crear la tabla Ordenes
CREATE TABLE Ordenes (
    OrdenID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT,
    FechaOrden DATE,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

-- Crear la tabla Detalle_Ordenes
CREATE TABLE Detalle_Ordenes (
    DetalleID INT AUTO_INCREMENT PRIMARY KEY,
    OrdenID INT,
    ProductoID INT,
    Cantidad INT,
    FOREIGN KEY (OrdenID) REFERENCES Ordenes(OrdenID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Insertar dos filas en cada tabla
INSERT INTO Usuarios (Nombre, Apellido, Email) VALUES 
('John', 'Doe', 'john.doe@example.com'), 
('Jane', 'Doe', 'jane.doe@example.com');

INSERT INTO Productos (NombreProducto, Precio) VALUES 
('Producto A', 20.50), 
('Producto B', 15.75);

INSERT INTO Ordenes (UsuarioID, FechaOrden) VALUES 
(1, '2023-10-22'), 
(2, '2023-10-23');

INSERT INTO Detalle_Ordenes (OrdenID, ProductoID, Cantidad) VALUES 
(1, 1, 2), 
(2, 2, 3);

-- Ejemplos de comandos DML

-- INSERT
-- 1. Insertar una nueva fila en la tabla Usuarios
INSERT INTO Usuarios (Nombre, Apellido, Email) VALUES ('Mike', 'Johnson', 'mike.j@example.com');

-- 2. Insertar una nueva fila en la tabla Productos
INSERT INTO Productos (NombreProducto, Precio) VALUES ('Producto C', 25.00);

-- UPDATE
-- 1. Actualizar el precio de un producto
UPDATE Productos SET Precio = 30.00 WHERE ProductoID = 1;

-- 2. Actualizar el apellido de un usuario
UPDATE Usuarios SET Apellido = 'Smith' WHERE UsuarioID = 2;

-- DELETE
-- 1. Eliminar una orden por su ID
DELETE FROM Ordenes WHERE OrdenID = 1;

-- 2. Eliminar un producto por su ID
DELETE FROM Productos WHERE ProductoID = 2;

-- MERGE
-- (Nota: El comando MERGE no es soportado en MySQL, es una característica de SQL Server y otros DBMS)

-- CALL
-- (Nota: Para usar el comando CALL, necesitarás tener un procedimiento almacenado creado. Asegúrate de que el procedimiento almacenado exista antes de ejecutar el comando CALL.)

-- 1. Suponiendo que tienes un procedimiento almacenado llamado `ObtenerUsuarios`, puedes llamarlo así:
-- CALL ObtenerUsuarios();

-- 2. Suponiendo que tienes un procedimiento almacenado llamado `ObtenerProducto`, puedes llamarlo así:
-- CALL ObtenerProducto();

-- EXPLAIN PLAN
-- (Nota: EXPLAIN es utilizado para obtener el plan de ejecución de una consulta, pero el comando PLAN no es una palabra clave en MySQL.)

-- 1. Obtener el plan de ejecución de una consulta
EXPLAIN SELECT * FROM Usuarios WHERE UsuarioID = 1;

-- 2. Obtener el plan de ejecución de una consulta
EXPLAIN SELECT * FROM Productos WHERE Precio > 20.00;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- Deals with access rights and data control on the data present in the DB --
-- DCL                                                                     --
-- Los principales comandos son GRANT y REVOKE                             --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- Creación de la base de datos DCL_Example
CREATE DATABASE DCL_Example;
USE DCL_Example;

-- Creación de la tabla Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Email VARCHAR(255)
);

-- Creación de la tabla Productos
CREATE TABLE Productos (
    ProductoID INT AUTO_INCREMENT PRIMARY KEY,
    NombreProducto VARCHAR(255),
    Precio DECIMAL(10,2)
);

-- Creación de la tabla Ordenes
CREATE TABLE Ordenes (
    OrdenID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT,
    FechaOrden DATE,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

-- Insertar dos filas en cada tabla
INSERT INTO Usuarios (Nombre, Apellido, Email) VALUES 
('John', 'Doe', 'john.doe@example.com'), 
('Jane', 'Doe', 'jane.doe@example.com');

INSERT INTO Productos (NombreProducto, Precio) VALUES 
('Producto A', 20.50), 
('Producto B', 15.75);

INSERT INTO Ordenes (UsuarioID, FechaOrden) VALUES 
(1, '2023-10-22'), 
(2, '2023-10-23');

-- Ahora, suponiendo que tienes un usuario en tu base de datos MySQL llamado 'user1', puedes usar los siguientes comandos:

-- GRANT: Asignar permisos a un usuario

-- 1. Dar permiso a user1 para seleccionar y actualizar datos en la tabla Usuarios
-- GRANT SELECT, UPDATE ON DCL_Example.Usuarios TO 'user1'@'localhost';

-- 2. Dar permiso a user1 para insertar y eliminar datos en la tabla Productos
-- GRANT INSERT, DELETE ON DCL_Example.Productos TO 'user1'@'localhost';

-- REVOKE: Revocar permisos a un usuario

-- 1. Revocar el permiso de user1 para actualizar datos en la tabla Usuarios
-- REVOKE UPDATE ON DCL_Example.Usuarios FROM 'user1'@'localhost';

-- 2. Revocar el permiso de user1 para eliminar datos en la tabla Productos
-- REVOKE DELETE ON DCL_Example.Productos FROM 'user1'@'localhost';


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- Deals with the transactions happening in the DB                         --
-- TCL                                                                     --
-- Los principales comandos son COMMIT, ROLLBACK, SAVEPOINT y AUTOCOMMIT   --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- Creación de la base de datos TCL_Example
CREATE DATABASE TCL_Example;
USE TCL_Example;

-- Creación de la tabla Clientes
CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Email VARCHAR(255)
);

-- Creación de la tabla Productos
CREATE TABLE Productos (
    ProductoID INT AUTO_INCREMENT PRIMARY KEY,
    NombreProducto VARCHAR(255),
    Precio DECIMAL(10,2)
);

-- Creación de la tabla Ordenes
CREATE TABLE Ordenes (
    OrdenID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    FechaOrden DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Insertar dos filas en cada tabla
INSERT INTO Clientes (Nombre, Apellido, Email) VALUES 
('John', 'Doe', 'john.doe@example.com'), 
('Jane', 'Doe', 'jane.doe@example.com');

INSERT INTO Productos (NombreProducto, Precio) VALUES 
('Producto A', 20.50), 
('Producto B', 15.75);

INSERT INTO Ordenes (ClienteID, FechaOrden) VALUES 
(1, '2023-10-22'), 
(2, '2023-10-23');

-- Comandos TCL

-- COMMIT: guardar los cambios realizados durante la transacción actual

-- 1. Insertar un nuevo cliente y confirmar la transacción
START TRANSACTION;
INSERT INTO Clientes (Nombre, Apellido, Email) VALUES ('Mike', 'Smith', 'mike.smith@example.com');
COMMIT;

-- 2. Insertar un nuevo producto y confirmar la transacción
START TRANSACTION;
INSERT INTO Productos (NombreProducto, Precio) VALUES ('Producto C', 30.00);
COMMIT;

-- ROLLBACK: deshacer los cambios realizados durante la transacción actual

-- 1. Intentar insertar un nuevo cliente, pero deshacer la transacción
START TRANSACTION;
INSERT INTO Clientes (Nombre, Apellido, Email) VALUES ('Emily', 'Johnson', 'emily.johnson@example.com');
ROLLBACK;

-- 2. Intentar insertar un nuevo producto, pero deshacer la transacción
START TRANSACTION;
INSERT INTO Productos (NombreProducto, Precio) VALUES ('Producto D', 25.25);
ROLLBACK;

-- SAVEPOINT: establecer puntos en la transacción donde puedes hacer ROLLBACK

-- 1. Crear un SAVEPOINT, hacer un cambio y luego deshacerlo
START TRANSACTION;
SAVEPOINT sp1;
INSERT INTO Clientes (Nombre, Apellido, Email) VALUES ('Bob', 'Williams', 'bob.williams@example.com');
ROLLBACK TO SAVEPOINT sp1;
COMMIT;

-- 2. Crear un SAVEPOINT, hacer un cambio y luego deshacerlo
START TRANSACTION;
SAVEPOINT sp2;
INSERT INTO Productos (NombreProducto, Precio) VALUES ('Producto E', 10.00);
ROLLBACK TO SAVEPOINT sp2;
COMMIT;

-- AUTOCOMMIT: establecer el modo de confirmación automática

-- 1. Habilitar AUTOCOMMIT
SET AUTOCOMMIT = 1;

-- 2. Deshabilitar AUTOCOMMIT
SET AUTOCOMMIT = 0;

