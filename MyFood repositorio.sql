create database MyFood;
use MyFood;

create table TipoProductos (
idTipoProducto int primary key auto_increment,
nombreTipoProducto varchar (50) not null
);

create table Productos (
idProducto int primary key auto_increment,
nombreProducto varchar (50) not null,
valorVenta Varchar (15) not null,
idTipoProducto int,
foreign key (idTipoProducto) references TipoProductos (idTipoProducto)
);

create table Inventario (
id int primary key auto_increment,
cantidad int not null,
valor varchar (30) not null,
idProducto int,
foreign key (idProducto) references Productos (idProducto)
);

create table Factura (
numeroFactura int primary key  auto_increment,
cantidad  int null,
fechaVenta datetime not null,
idproducto int,
foreign key (idproducto) references Productos (idproducto)
);

create table Sucursal (
idSucursal int primary key  auto_increment,
nombre varchar (50) not null,
direccion varchar (50) not null,
ciudad varchar (50) not null
);

create table Vendedor (
cedulaVen int primary key not null,
salario varchar (45) not null,
numeroFactura int,
idSucursal int,
foreign key (numeroFactura) references Factura (numeroFactura),
foreign key (idSucursal) references Sucursal (idSucursal)
);

create table Clientes (
cedula int primary key not null,
puntaje int,
paginaWeb varchar (60) null,
direccion varchar (45) not null,
numeroFactura int,
foreign key (numeroFactura) references Factura (numeroFactura)
);

create table Usuarios (
idUsuarios int primary key auto_increment,
nombre varchar (45) not null,
apellido varchar (45) not null,
fechaNacimiento date,
direccion varchar (45) not null,
telefono varchar (20) not null,
cedulaVen int,
cedula int,
foreign key (cedulaVen) references Vendedor(cedulaVen),
foreign key (cedula) references Clientes(cedula)
);

-- Usuarios
Insert into Usuarios (nombre, apellido, fechaNacimiento, direccion, telefono) values ('Juan', 'Lopez', '1994-05-13', 'cra 7 N 10-56', 3125984728);
Insert into Usuarios (nombre, apellido, fechaNacimiento, direccion, telefono) values ('Diana', 'Moreno', '1999-01-17', 'cra 8 N 20-36', 3125984897);
Insert into Usuarios (nombre, apellido, fechaNacimiento, direccion, telefono) values ('Luisa', 'Daza', '1990-12-20', 'cra 69 N 2-6', 3125984897);

-- Clientes
Insert into Clientes (cedula, puntaje, paginaWeb, direccion) values (1010147744, 1, 'www.cliente1.com', 'Cra 15A 7-55');
Insert into Clientes (cedula, puntaje, paginaWeb, direccion) values (1080255698, 2, 'www.cliente2.com', 'Cra 7B 9-6');
Insert into Clientes (cedula, puntaje, paginaWeb, direccion) values (1070255698, 3, 'www.cliente3.com', 'Calle 4A 87-03');

-- ucursal
Insert into Sucursal (nombre, direccion, ciudad) values ('Colina', 'Av Boyaca calle 123', 'Bogota');
Insert into Sucursal (nombre, direccion, ciudad) values ('Colón', 'calle 123 2-44a', 'Bucaramanga');
Insert into Sucursal (nombre, direccion, ciudad) values ('San Rafael', 'Autopista Norte km 110', 'Bogota');

-- Vendedor
Insert into Vendedor (cedulaVen, salario) values (1020245698, '1.120.400');
Insert into Vendedor (cedulaVen, salario) values (1010633252, '1.120.400');
Insert into Vendedor (cedulaVen, salario) values (1050321456, '1.120.400');

-- Factura
Insert into Factura (cantidad, fechaVenta) values (2, '2023-01-25 10:25');
Insert into Factura (cantidad, fechaVenta) values (1, '2023-03-10 14:10');
Insert into Factura (cantidad, fechaVenta) values (3, '2023-02-10 19:40');

-- Productos
Insert into Productos (nombreProducto, valorVenta) values ('Manzanas', 32.500);
Insert into Productos (nombreProducto, valorVenta) values ('Papas fritas margarita', 7.500);
Insert into Productos (nombreProducto, valorVenta) values ('Arina de trigo', 10.500);

-- Tipo Productos
Insert into TipoProductos (nombreTipoProducto) values ('Frutas');
Insert into TipoProductos (nombreTipoProducto) values ('Paquetes');
Insert into TipoProductos (nombreTipoProducto) values ('Arinas');

-- Inventario
Insert into Inventario (cantidad, valor) values (50, '1.110.000');
Insert into Inventario (cantidad, valor) values (500, '5.240.000');
Insert into Inventario (cantidad, valor) values (200, '3.715.350');


--------------------------------------------------------------------------
create table  TipoProductos2 (
idTipoProducto2 int primary key auto_increment,
nuevoTipoProducto varchar (50) not null,
fecha Datetime,
comentario varchar (50)
);

drop trigger nuevoTipoProducto;

delimiter //
create trigger nuevoTipoProducto
after insert on TipoProductos
for each row 
	begin
		insert into  TipoProductos2 ( nuevoTipoProducto, fecha, comentario)
        values ('Carnes', now(), 'Nuevo tipo de producto agregado');
    end;
//