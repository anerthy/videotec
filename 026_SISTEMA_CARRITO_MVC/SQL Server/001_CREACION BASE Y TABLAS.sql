

create database DB_PROYECTO

GO
USE DB_PROYECTO
GO

CREATE TABLE CATEGORIA(
IdCategoria int primary key identity,
Descripcion varchar(100),
Activo bit default 1,
FechaRegistro datetime default getdate()
)

go

CREATE TABLE MARCA(
IdMarca int primary key identity,
Descripcion varchar(100),
Activo bit default 1,
FechaRegistro datetime default getdate()
)

go

CREATE TABLE PRODUCTO(
IdProducto int primary key identity,
Nombre varchar(500),
Descripcion varchar(500),
IdMarca int references Marca(IdMarca),
IdCategoria int references Categoria(IdCategoria),
Precio decimal(10,2) default 0,
Stock int,
RutaImagen varchar(100),
Activo bit default 1,
FechaRegistro datetime default getdate()
)

go

CREATE TABLE USUARIO(
IdUsuario int primary key identity,
Nombres varchar(100),
Apellidos varchar(100),
Correo varchar(100),
Contrasena varchar(100),
EsAdministrador bit,
Activo bit default 1,
FechaRegistro datetime default getdate()
)

go


CREATE TABLE CARRITO(
IdCarrito int primary key identity,
IdUsuario int references USUARIO(IdUsuario),
IdProducto int references PRODUCTO(IdProducto)
)

go



create table COMPRA(
IdCompra int primary key identity,
IdUsuario int references USUARIO(IdUsuario),
TotalProducto int,
Total decimal(10,2),
Contacto varchar(50),
Telefono varchar(50),
Direccion varchar(500),
IdDistrito varchar(10),
FechaCompra datetime default getdate()
)

go

create table DETALLE_COMPRA(
IdDetalleCompra int primary key identity,
IdCompra int references Compra(IdCompra),
IdProducto int references PRODUCTO(IdProducto),
Cantidad int,
Total decimal(10,2)
)

go

CREATE TABLE DEPARTAMENTO (
  IdDepartamento varchar(2) NOT NULL,
  Descripcion varchar(45) NOT NULL
) 

go

CREATE TABLE PROVINCIA (
  IdProvincia varchar(4) NOT NULL,
  Descripcion varchar(45) NOT NULL,
  IdDepartamento varchar(2) NOT NULL
) 

go

CREATE TABLE DISTRITO (
  IdDistrito varchar(6) NOT NULL,
  Descripcion varchar(45) NOT NULL,
  IdProvincia varchar(4) NOT NULL,
  IdDepartamento varchar(2) NOT NULL
)

----------------VIDEOTEC-------------
Create TABLE tbl_empresa
(
emp_id_empresa int identity(1,1) not null,
emp_nombre varchar(15) not null,
emp_telefono varchar(8) not null,
emp_direccion text not null,
emp_correo varchar(50) not null,
emp_logo varchar(500) not null
CONSTRAINT PK_tbl_empresa
PRIMARY KEY CLUSTERED (emp_id_empresa)
)
GO



exec sp_insert_tbl_empresa 'Melany','2323','sdfgdfgdg','correo@gmail.com','LOGO'

Select * from tbl_empresa

--------GENERO

USE DB_PROYECTO
GO
CREATE TABLE tbl_genero_pelicula
(
gen_id_genero int identity(1,1) not null,
gen_nombre varchar(20) not null,
gen_descripcion text not null,
gen_imagen varchar(50) null
constraint PK_tbl_genero_pelicula
primary key clustered (gen_id_genero)
)
GO
-----CLASIFICACION

create table tbl_clasificacion
(
clasf_simbolo varchar(5) not null,
clasf_nombre varchar(30) not null,
clasf_significado text not null
constraint PK_tbl_clasificacion
primary key clustered (clasf_simbolo)
)
go


----------PELICULA

USE DB_PROYECTO
GO
create table tbl_pelicula
(
pel_id_pelicula int identity(1,1) not null,
pel_titulo varchar(100) not null,
pel_sinopsis text not null,
pel_clasificacion varchar(5) not null,
pel_duracion varchar(10) not null,
pel_año_publicacion int not null,
pel_stock_cintas int not null default 0,
pel_pais varchar(20) not null,
pel_precio money not null,
pel_disponibilidad varchar(13) not null check (pel_disponibilidad in ('No disponible','Disponible')) default 'No disponible',
pel_portada varchar(100) null,
pel_trailer varchar(100) null
constraint PK_tbl_pelicula
primary key clustered (pel_id_pelicula)
constraint FK_pelicula_clasificacion
foreign key (pel_clasificacion) references tbl_clasificacion(clasf_simbolo)
)

go

drop table tbl_pelicula
-------------

create table tbl_clasificacion
(
clasf_simbolo varchar(5) not null,
clasf_nombre varchar(30) not null,
clasf_significado text not null
constraint PK_tbl_clasificacion
primary key clustered (clasf_simbolo)
)
go
drop table tbl_pelicula



USE DB_PROYECTO
GO
create table tbl_socio
(
soc_codigo_socio varchar(12) not null,
soc_cedula varchar(9) not null UNIQUE,
soc_nombre varchar(35) not null,
soc_apellido1 varchar(40) not null,
soc_apellido2 varchar(40) not null,
soc_correo varchar(50) not null,
soc_telefono varchar(8) not null,
soc_codigo_postal varchar(5) not null,
soc_direccion_exacta varchar(100) not null,
soc_genero varchar(10) not null check (soc_genero in ('Masculino','Femenino','No binario')),
soc_fecha_nacimiento date not null,
soc_foto_perfil varchar(50) null
constraint PK_tbl_socio
primary key clustered (soc_codigo_socio)
)

go


---BITACORA
