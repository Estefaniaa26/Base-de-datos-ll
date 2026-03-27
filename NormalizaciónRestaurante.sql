CREATE DATABASE RestauranteDB;
GO

USE RestauranteDB;
GO

CREATE TABLE clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE productos (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE turnos (
    id_turno INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE meseros (
    id_mesero INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    id_turno INT NOT NULL,
    CONSTRAINT FK_meseros_turnos 
        FOREIGN KEY (id_turno) REFERENCES turnos(id_turno)
);
GO

CREATE TABLE pedidos (
    id_pedido INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_mesero INT NOT NULL,
    CONSTRAINT FK_pedidos_clientes 
        FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT FK_pedidos_meseros 
        FOREIGN KEY (id_mesero) REFERENCES meseros(id_mesero)
);
GO

CREATE TABLE detalle_pedido (
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_pedido, id_producto),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
GO

INSERT INTO clientes (nombre) VALUES
('María Gómez'),
('Pedro López');

INSERT INTO productos (nombre) VALUES
('Pizza'),
('Jugo'),
('Hamburguesa'),
('Ensalada');

INSERT INTO turnos (nombre) VALUES
('Noche'),
('Día');

INSERT INTO meseros (nombre, id_turno) VALUES
('Andrés Ríos', 1),
('Laura Torres', 2);

INSERT INTO pedidos (id_cliente, id_mesero) VALUES
(1, 1),
(1, 1),
(2, 2),
(1, 1);

INSERT INTO detalle_pedido (id_pedido, id_producto) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3),
(4, 4);

