-- -- -- -- -- -- -- -- -- -- -- -- -- 
--      Creación del esquema.       --
-- -- -- -- -- -- -- -- -- -- -- -- -- 


-- Crear la base de datos Comercio
CREATE DATABASE Comercio;
USE Comercio;

-- Crear la tabla Clientes
CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Email VARCHAR(255),
    Telefono VARCHAR(15)
);

-- Crear la tabla Productos
CREATE TABLE Productos (
    ProductoID INT AUTO_INCREMENT PRIMARY KEY,
    NombreProducto VARCHAR(255),
    Descripcion VARCHAR(255),
    Precio DECIMAL(10,2),
    Stock INT
);

-- Crear la tabla Gastos
CREATE TABLE Gastos (
    GastoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    ProductoID INT,
    Cantidad INT,
    Precio_Unitario DECIMAL(10,2), 
	Fecha DATE,
    Total DECIMAL(10,2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
--      Inserción de datos en las tablas Clientes, Productos y Gastos      --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO Clientes (Nombre, Apellido, Email, Telefono)
VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
('Jane', 'Doe', 'jane.doe@example.com', '123-456-7891'),
('Mike', 'Smith', 'mike.smith@example.com', '123-456-7892'),
('Emily', 'Johnson', 'emily.johnson@example.com', '123-456-7893'),
('Bob', 'Williams', 'bob.williams@example.com', '123-456-7894'),
('Linda', 'Taylor', 'linda.taylor@example.com', '123-456-7895'),
('James', 'Brown', 'james.brown@example.com', '123-456-7896'),
('Mary', 'Jones', 'mary.jones@example.com', '123-456-7897'),
('Paul', 'Miller', 'paul.miller@example.com', '123-456-7898'),
('Laura', 'Wilson', 'laura.wilson@example.com', '123-456-7899');

INSERT INTO Productos (NombreProducto, Descripcion, Precio, Stock)
VALUES
('Producto A', 'Descripción del producto A', 20.50, 100),
('Producto B', 'Descripción del producto B', 15.75, 200),
('Producto C', 'Descripción del producto C', 30.00, 150),
('Producto D', 'Descripción del producto D', 25.25, 175),
('Producto E', 'Descripción del producto E', 10.00, 300),
('Producto F', 'Descripción del producto F', 45.00, 90),
('Producto G', 'Descripción del producto G', 50.50, 80),
('Producto H', 'Descripción del producto H', 55.75, 70),
('Producto I', 'Descripción del producto I', 60.00, 60),
('Producto J', 'Descripción del producto J', 65.25, 50);

INSERT INTO Gastos (ClienteID, ProductoID, Cantidad, Precio_Unitario, Fecha, Total)
VALUES 
(1, 1, 3, 20.00, '2023-01-01', 60.00),
(2, 2, 2, 15.00, '2023-01-02', 30.00),
(3, 3, 4, 10.00, '2023-01-03', 40.00),
(4, 4, 5, 8.00, '2023-01-04', 40.00),
(5, 5, 3, 5.00, '2023-01-04', 15.00),
(10, 10, 2, 25.00, '2023-01-20', 50.00);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
--                   Inspección de las tres tablas                         --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

SELECT * FROM Comercio.Clientes;

SELECT * FROM Comercio.Productos;

SELECT * FROM Comercio.Gastos;