create database Ventas;

create schema vta;

create table vta.VtaCatClientes
(IdCliente int identity(1,1) primary key,
 Nombre varchar(200),
 Direccion varchar(1000),
 Telefono bigint,
 Activo tinyint,
 FechaUltimaMod datetime);

create table vta.VtaTraFacturas
(IdFactura int  identity(1,1) primary key,
 Fecha datetime,
 IdCliente int);

create table vta.VtaTraVentas
(IdVenta int  identity(1,1) primary key,
 IdFactura int,
 IdProducto int,
 Cantidad int);

create table vta.VtaTraProductos
(IdProducto int  identity(1,1) primary key,
 Descripcion varchar(1000),
 IdCategoria int,
 IdProveedor int);

create table vta.VtaTraProveedores
(IdProveedor int  identity(1,1) primary key,
 Nombre varchar(200),
 Direccion varchar(1000),
 Telefono bigint);

create table vta.VtaCatCategorias
(IdCategoria int  identity(1,1) primary key,
 Descripcion varchar(1000));

 Alter table vta.VtaTraFacturas ADD CONSTRAINT FK_Clientes FOREIGN KEY (IdCliente) REFERENCES vta.VtaCatClientes(IdCliente);
 Alter table vta.VtaTraVentas ADD CONSTRAINT FK_Ventas_Factura FOREIGN KEY (IdFactura) REFERENCES vta.VtaTraFacturas(IdFactura);
 Alter table vta.VtaTraVentas ADD CONSTRAINT FK_Ventas_Producto FOREIGN KEY (IdProducto) REFERENCES vta.VtaTraProductos(IdProducto);
 Alter table vta.VtaTraProductos ADD CONSTRAINT FK_Productos_Categoria FOREIGN KEY (IdCategoria) REFERENCES vta.VtaCatCategorias(IdCategoria);
 Alter table vta.VtaTraProductos ADD CONSTRAINT FK_Productos_Proveedor FOREIGN KEY (IdProveedor) REFERENCES vta.VtaTraProveedores(IdProveedor);