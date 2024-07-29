--Crecion de la base de datos.
CREATE DATABASE FastFoodDB;
--Activacion de la base de datos.
USE FastFoodDB;

--Creacion de Tablas.
CREATE TABLE Categorias(
	CategoriaID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR (50) NOT NULL);

CREATE TABLE Productos(
	ProductoID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR (255) NOT NULL,
	CategoriaID INT,
	Precio DECIMAL (10,2)NOT NULL);

CREATE TABLE Sucursales (
	SucursalID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR (255) NOT NULL,
	Direccion VARCHAR (255));

CREATE TABLE Empleados (
	EmpleadoID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255) NOT NULL,
	Posicion VARCHAR(255),
	Departamento VARCHAR (255),
	SucursalID INT,
	Rol VARCHAR(255));

CREATE TABLE Clientes (
	ClienteID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255) NOT NULL,
	Direccion VARCHAR(255));

CREATE TABLE OrigenesOrden(
	OrigenID INT PRIMARY KEY IDENTITY,
	Descripcion VARCHAR (255) NOT NULL);

CREATE TABLE TiposdePago(
	TipodePagoID INT PRIMARY KEY IDENTITY,
	Descripcion VARCHAR(255) NOT NULL);

CREATE TABLE Mensajeros(
	MensajeroID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255) NOT NULL,
	EsExterno BIT NOT NULL);

CREATE TABLE DetalleOrdenes(
	OrdenID INT,
	ProductoID INT,
	Cantidad INT,
	Precio DECIMAL (10,2),
	PRIMARY KEY (OrdenID, ProductoID));

CREATE TABLE Ordenes(
	OrdenID INT PRIMARY KEY IDENTITY,
	ClienteID INT,
	EmpleadoID INT,
	SucursalID INT,
	MensajeroID INT,
	TipodePagoID INT,
	OrigenID INT,
	HorarioVenta VARCHAR(255),
	TotalCompra DECIMAL (10,2),
	KilometroRecorrer DECIMAL (10,2),
	FechaDespacho DATETIME,
	FechaEntrega DATETIME,
	FechaOrdenTomada DATETIME,
	FechaOrdenLista DATETIME);

--Creacion de las relaciones entre tablas.

--Conecta la Productos con Categorias.
ALTER TABLE Productos
ADD CONSTRAINT Fk_Productos_Categorias
FOREIGN KEY(CategoriaID) REFERENCES Categorias(CategoriaID);

--Conecta ordenes con Clientes.
ALTER TABLE Ordenes
ADD CONSTRAINT Fk_Ordenes_Clientes
FOREIGN KEY(ClienteID) REFERENCES Clientes(ClienteID);

--Conecta ordenes con Empleados.
ALTER TABLE Ordenes
ADD CONSTRAINT Fk_Ordenes_Empleados
FOREIGN KEY(EmpleadoID) REFERENCES Empleados(EmpleadoID);

--Conecta ordenes con Sucursales.
ALTER TABLE Ordenes
ADD CONSTRAINT Fk_Ordenes_Sucursales
FOREIGN KEY (SucursalID) REFERENCES Sucursales (SucursalID);

--Conecta ordenes con Mensajeros
ALTER TABLE Ordenes
ADD CONSTRAINT Fk_Ordenes_Mensajeros
FOREIGN KEY(MensajeroID) REFERENCES Mensajeros(MensajeroID);

--Conecta ordenes con TiposdePago.
ALTER TABLE Ordenes
ADD CONSTRAINT Fk_Ordenes_TiposdePago
FOREIGN KEY(TipodePagoID) REFERENCES TiposdePago(TipodePagoID);

--Conecta ordenes con OrigenesOrden.
ALTER TABLE Ordenes
ADD CONSTRAINT Fk_Ordenes_OrigenesOrden
FOREIGN KEY(OrigenID) REFERENCES OrigenesOrden(OrigenID);

--Conecta Empleados con Sucursales
ALTER TABLE Empleados
ADD CONSTRAINT Fk_Empleados_Sucursales
FOREIGN KEY (SucursalID) REFERENCES Sucursales(SucursalID);

--Conecta DetalleOrdenes con Ordenes
ALTER TABLE DetalleOrdenes
ADD CONSTRAINT Fk_DetalleOrdenes_Ordenes
FOREIGN KEY(OrdenID) REFERENCES Ordenes(OrdenID);

--Conecta DetalleOrdenes con Productos.
ALTER TABLE DetalleOrdenes
ADD CONSTRAINT Fk_DetalleOrdenes_Productos
FOREIGN KEY(ProductoID) REFERENCES Productos(ProductoID);