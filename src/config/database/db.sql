
CREATE DATABASE IF NOT EXISTS crud_backend;
use crud_backend;

CREATE TABLE IF NOT EXISTS personas (
id_persona INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
apellido VARCHAR(100),
tipo_identificacion VARCHAR(50),
nuip INT,
email VARCHAR(100),
clave VARCHAR(500),
salario DECIMAL(10,2),
activo BOOLEAN DEFAULT TRUE,
fecha_registro DATE DEFAULT (CURRENT_DATE),
imagen LONGBLOB
);

CREATE TABLE IF NOT EXISTS productos (
id_producto INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
precio decimal(12,2),
categoria varchar(100),
descripcion text,
stock int,
fecha_registro DATE DEFAULT (CURRENT_DATE),
imagen LONGBLOB
);


CREATE TABLE ventas (
id_venta INT AUTO_INCREMENT PRIMARY KEY,
id_persona INT ,
id_producto INT ,
cantidad INT  ,
total DECIMAL(10, 2),
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_persona) REFERENCES personas(id_persona),
FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);


show tables;

SELECT * FROM personas;
SELECT * FROM productos;
SELECT * FROM ventas;

drop table personas;
drop table productos;
drop table ventas;

INSERT INTO personas (nombre, apellido, tipo_identificacion, nuip, email, clave, salario, activo, fecha_registro, imagen) 
VALUES 
('Juan', 'Pérez', 'Cédula de Ciudadanía', 123456789, 'juan.perez@example.com', 'clave_encriptada', 3500.50, TRUE, '2025-04-25', NULL),
('María', 'Gómez', 'Cédula de Ciudadanía', 987654321, 'maria.gomez@example.com', 'clave_encriptada2', 4200.00, TRUE, '2025-04-25', NULL),
('Carlos', 'Ramírez', 'Cédula de Extranjería', 112233445, 'carlos.ramirez@example.com', 'clave_encriptada3', 3900.75, FALSE, '2025-04-25', NULL),
('Ana', 'López', 'Pasaporte', 556677889, 'ana.lopez@example.com', 'clave_encriptada4', 3100.00, TRUE, '2025-04-25', NULL),
('Luis', 'Martínez', 'Cédula de Ciudadanía', 334455667, 'luis.martinez@example.com', 'clave_encriptada5', 5000.00, TRUE, '2025-04-25', NULL);


INSERT INTO productos (nombre, precio, categoria, descripcion, stock, imagen)
VALUES ('Camiseta Deportiva', 19.99, 'Ropa', 'Camiseta de algodón transpirable para entrenamiento.', 50, NULL);

INSERT INTO productos (nombre, precio, categoria, descripcion, stock, imagen)
VALUES ('Auriculares Bluetooth', 49.90, 'Electrónica', 'Auriculares inalámbricos con cancelación de ruido.', 30, NULL);

INSERT INTO productos (nombre, precio, categoria, descripcion, stock, imagen)
VALUES ('Botella Térmica 1L', 15.00, 'Accesorios', 'Botella de acero inoxidable que mantiene la temperatura.', 75, NULL);

INSERT INTO productos (nombre, precio, categoria, descripcion, stock, imagen)
VALUES ('Zapatillas Running', 89.95, 'Calzado', 'Zapatillas ligeras con suela antideslizante.', 20, NULL);

INSERT INTO productos (nombre, precio, categoria, descripcion, stock, imagen)
VALUES ('Mochila Urbana', 39.99, 'Bolsos y mochilas', 'Mochila resistente con múltiples compartimentos.', 40, NULL);

