USE VIDEOTEC
GO
CREATE TABLE tbl_empresa
(
emp_id_empresa int identity(1,1) not null,
emp_nombre varchar(15) not null,
emp_telefono varchar(8) not null,
emp_direccion text not null,
emp_correo varchar(50) not null,
emp_logo varchar(50) not null
CONSTRAINT PK_tbl_empresa
PRIMARY KEY CLUSTERED (emp_id_empresa)
)
ON SISTEMA
GO

USE VIDEOTEC
GO
CREATE TABLE tbl_actor
(
act_id_actor int identity(1,1) not null,
act_nombre varchar(35) not null,
act_nombre_nacimiento varchar(40) not null,
act_nacionalidad varchar(15) not null,
act_biografia text not null,
act_año_inicio int not null,
act_fecha_nacimiento date not null,
act_ocupacion varchar(100) not null,
act_imagen varchar(50) null
CONSTRAINT PK_tbl_actor
PRIMARY KEY CLUSTERED (act_id_actor)
)
ON PELICULAS
GO

USE VIDEOTEC
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
ON PELICULAS
GO

USE VIDEOTEC
GO
create table tbl_productora
(
prod_id_productora int identity(1,1) not null,
prod_nombre varchar(20) not null,
prod_año_fundacion int not null,
prod_descripcion text not null,
prod_sitio_web varchar(20) not null,
prod_logo varchar(50) null,
constraint PK_tbl_productora
primary key clustered (prod_id_productora)
)
ON PELICULAS
go

USE VIDEOTEC
GO
create table tbl_director
(
dir_id_director int identity(1,1) not null,
dir_nombre varchar(30) not null,
dir_nombre_nacimiento varchar(50) not null,
dir_nacionalidad varchar(15) not null,
dir_biografia text not null,
dir_fecha_nacimiento date not null,
dir_imagen varchar(50) null
constraint PK_tbl_director
primary key clustered (dir_id_director)
)
ON PELICULAS
go

USE VIDEOTEC
GO
create table tbl_clasificacion
(
clasf_simbolo varchar(5) not null,
clasf_nombre varchar(30) not null,
clasf_significado text not null
constraint PK_tbl_clasificacion
primary key clustered (clasf_simbolo)
)
ON PELICULAS
go

USE VIDEOTEC
GO
create table tbl_pelicula
(
pel_id_pelicula varchar(8) not null,
pel_titulo varchar(10) not null,
pel_sinopsis text not null,
pel_clasificacion varchar(5) not null,
pel_duracion time not null,
pel_año_publicacion int not null,
pel_stock_cintas int not null default 0,
pel_pais varchar(20) not null,
pel_precio money not null,
pel_disponibilidad varchar(13) not null check (pel_disponibilidad in ('No disponible','Disponible')) default 'No disponible',
pel_portada varchar(50) not null,
pel_trailer varchar(50) not null
constraint PK_tbl_pelicula
primary key clustered (pel_id_pelicula)
constraint FK_pelicula_clasificacion
foreign key (pel_clasificacion) references tbl_clasificacion(clasf_simbolo)
)
ON PELICULAS
go

USE VIDEOTEC
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
ON SOCIOS
go

USE VIDEOTEC
GO
create table tbl_idioma
(
idm_id_idioma varchar(3) not null,
idm_nombre varchar(10) not null
constraint PK_tbl_idioma
primary key clustered (idm_id_idioma)
)
ON PELICULAS
go

USE VIDEOTEC
GO
create table tbl_cinta
(
cin_numero_cinta varchar(13) not null,
cin_idioma varchar(3) not null,
cin_pelicula_id varchar(8) not null,
cin_estado varchar(10) not null check (cin_estado in ('Disponible','Prestada','Dañada')) default 'Disponible'
constraint PK_tbl_cinta
primary key clustered (cin_numero_cinta)
constraint FK_cinta_pelicula
foreign key (cin_pelicula_id) references tbl_pelicula(pel_id_pelicula)
)
ON PELICULAS
go

USE VIDEOTEC
GO
create table tbl_subtitulos_cinta
(
sub_subtitulos_cinta int identity(1,1) not null,
sub_numero_cinta varchar(13) not null,
sub_idioma_id varchar(3) not null
constraint PK_tbl_subtitulos_cinta
primary key clustered (sub_subtitulos_cinta)
constraint FK_subtitulos_cinta
foreign key (sub_numero_cinta) references tbl_cinta(cin_numero_cinta),
constraint FK_subtitulos_idioma
foreign key (sub_idioma_id) references tbl_idioma(idm_id_idioma)
)
ON PELICULAS
go

USE VIDEOTEC
GO
create table tbl_pelicula_genero
(
pel_gen_id_pelicula_genero int identity(1,1) not null,
pel_gen_genero_id int not null,
pel_gen_pelicula_id varchar(8) not null
constraint PK_tbl_pelicula_genero
primary key clustered (pel_gen_id_pelicula_genero)
constraint FK_pel_gen_genero_id
foreign key (pel_gen_genero_id) references tbl_genero_pelicula(gen_id_genero),
constraint FK_pel_gen_pelicula_id
foreign key (pel_gen_pelicula_id) references tbl_pelicula(pel_id_pelicula)
)
ON PELICULAS
go

USE VIDEOTEC
GO
create table tbl_pelicula_actor
(
pel_act_id_pelicula_actor int identity(1,1) not null,
pel_act_actor_id int not null,
pel_act_tipo_actor varchar(10) not null check (pel_act_tipo_actor in ('Principal','Secundario')),
pel_act_pelicula_id varchar(8) not null
constraint FK_tbl_pelicula_actor
primary key clustered (pel_act_id_pelicula_actor)
constraint FK_pel_act_actor_id
foreign key (pel_act_actor_id) references tbl_actor(act_id_actor),
constraint FK_pel_act_pelicula_id
foreign key (pel_act_pelicula_id) references tbl_pelicula(pel_id_pelicula)
)
ON PELICULAS
go

USE VIDEOTEC
GO
create table tbl_pelicula_productora
(
pel_prod_id_pelicula_productora int identity(1,1) not null,
pel_prod_productora_id int not null,
pel_prod_pelicula_id varchar(8) not null
constraint FK_tbl_pelicula_productora
primary key clustered (pel_prod_id_pelicula_productora)
constraint FK_pel_prod_productora_id
foreign key (pel_prod_productora_id) references tbl_productora(prod_id_productora),
constraint FK_pel_prod_pelicula_id
foreign key (pel_prod_pelicula_id) references tbl_pelicula(pel_id_pelicula)
)
ON PELICULAS
go

USE VIDEOTEC
GO
create table tbl_pelicula_director
(
pel_dir_id_pelicula_director int identity (1,1) not null,
pel_dir_pelicula_id varchar(8) not null,
pel_dir_director_id int not null
constraint PK_tbl_pelicula_director
primary key clustered (pel_dir_id_pelicula_director)
constraint FK_pel_dir_pelicula_id
foreign key (pel_dir_pelicula_id) references tbl_pelicula(pel_id_pelicula),
constraint FK_pel_dir_director_id
foreign key (pel_dir_director_id) references tbl_director(dir_id_director)
)
ON PELICULAS
go

USE VIDEOTEC
GO
create table tbl_socio_actor
(
soc_act_id_socio_actor int identity(1,1) not null,
soc_act_codigo_socio varchar(12) not null,
soc_act_actor_id int not null
constraint PK_tbl_socio_actor
primary key clustered (soc_act_id_socio_actor)
constraint FK_soc_act_codigo_socio
foreign key (soc_act_codigo_socio) references tbl_socio(soc_codigo_socio),
constraint FK_soc_act_actor_id
foreign key (soc_act_actor_id) references tbl_actor(act_id_actor)
)
ON SOCIOS
go

USE VIDEOTEC
GO
create table tbl_socio_director
(
soc_dir_id_socio_director int identity(1,1) not null,
soc_dir_codigo_socio varchar(12) not null,
soc_dir_director_id int not null
constraint PK_tbl_socio_director
primary key clustered (soc_dir_id_socio_director)
constraint FK_soc_dir_codigo_socio
foreign key (soc_dir_codigo_socio) references tbl_socio(soc_codigo_socio),
constraint FK_soc_dir_director_id
foreign key (soc_dir_director_id) references tbl_director(dir_id_director)
)
ON SOCIOS
go

USE VIDEOTEC
GO
create table tbl_socio_genero
(
soc_gen_id_socio_genero int identity(1,1) not null,
soc_gen_codigo_socio varchar(12) not null,
soc_gen_genero_id int not null
constraint PK_tbl_socio_genero
primary key clustered (soc_gen_id_socio_genero)
constraint FK_soc_gen_codigo_socio
foreign key (soc_gen_codigo_socio) references tbl_socio(soc_codigo_socio),
constraint FK_soc_gen_genero_id
foreign key (soc_gen_genero_id) references tbl_genero_pelicula(gen_id_genero)
)
ON SOCIOS
go

USE VIDEOTEC
GO
create table tbl_llamada
(
lla_id_llamada int identity(1,1) not null,
lla_codigo_socio varchar(12) not null,
lla_pelicula_id varchar(8) not null
constraint PK_lla_id_llamada
primary key clustered (lla_id_llamada)
constraint FK_lla_codigo_socio
foreign key (lla_codigo_socio) references tbl_socio(soc_codigo_socio),
constraint FK_lla_pelicula_id
foreign key (lla_pelicula_id) references tbl_pelicula(pel_id_pelicula)
)
ON SOCIOS
go

USE VIDEOTEC
GO
create table tbl_rol
(
rol_id_rol int identity(1,1) not null,
rol_nombre varchar(20) not null,
rol_descripcion varchar(100) not null
constraint PK_tbl_rol
primary key clustered (rol_id_rol)
)
ON SISTEMA
go

USE VIDEOTEC
GO
create table tbl_usuario
(
user_id_usuario int identity(1,1) not null,
user_nombre varchar(35) not null UNIQUE,
user_correo varchar(50) not null UNIQUE,
user_contraseña varchar(75) not null,
user_rol_id int not null default 3,
user_foto varchar(50) null
constraint PK_tbl_usuario
primary key clustered (user_id_usuario)
constraint FK_user_rol_id
foreign key (user_rol_id) references tbl_rol(rol_id_rol)
)
ON SISTEMA
go

USE VIDEOTEC
GO
create table tbl_prestamo
(
pres_id_prestamo int identity(1,1) not null,
pres_fecha_prestamo datetime not null default getdate(),
pres_fecha_devolucion datetime not null,
pres_codigo_socio varchar(12) not null,
pres_precio_total money not null default 0
constraint PK_tbl_prestamo
primary key clustered (pres_id_prestamo)
constraint FK_pres_codigo_socio
foreign key (pres_codigo_socio) references tbl_socio(soc_codigo_socio)
)
ON PRESTAMOS
go

USE VIDEOTEC
GO
create table tbl_detalle_prestamo 
(
det_pres_id_detalle_prestamo int identity(1,1) not null,
det_pres_prestamo_id int not null,
det_pres_numero_cinta varchar(13) not null,
det_pres_sub_total money not null
constraint PK_tbl_detalle_prestamo
primary key clustered (det_pres_id_detalle_prestamo)
constraint FK_det_pres_prestamo_id
foreign key (det_pres_prestamo_id) references tbl_prestamo(pres_id_prestamo),
constraint FK_det_pres_numero_cinta 
foreign key (det_pres_numero_cinta) references tbl_cinta(cin_numero_cinta)
)
ON PRESTAMOS
go

USE VIDEOTEC
GO
create table tbl_carrito_compra
(
carr_id_carrito int identity(1,1) not null,
carr_pelicula_id varchar(8) not null,
carr_codigo_socio varchar(12) not null,
carr_estado varchar(10) not null check (carr_estado in ('En proceso','Procesado')) default 'En proceso'
constraint PK_tbl_carrito_compra
primary key clustered (carr_id_carrito)
constraint FK_carr_pelicula_id
foreign key (carr_pelicula_id) references tbl_pelicula(pel_id_pelicula),
constraint FK_carr_codigo_socio
foreign key (carr_codigo_socio) references tbl_socio(soc_codigo_socio)
)
ON PRESTAMOS
go

USE VIDEOTEC
GO
create table tbl_lista_espera
(
list_id_lista_espera int identity (1,1) not null,
list_codigo_socio varchar(12) not null,
list_pelicula_id varchar(8) not null,
list_fecha_solicitud datetime not null DEFAULT GETDATE()
constraint PK_list_id_lista_espera
primary key clustered (list_id_lista_espera)
constraint FK_list_codigo_socio
foreign key (list_codigo_socio) references tbl_socio(soc_codigo_socio),
constraint FK_list_pelicula_id
foreign key (list_pelicula_id) references tbl_pelicula(pel_id_pelicula)
)
ON PRESTAMOS
go

USE VIDEOTEC
GO
create table tbl_registro_prestamos
(
reg_pres_id_registro_prestamos int identity(1,1) not null,
reg_pres_numero_cinta varchar(13) not null,
reg_pres_codigo_socio varchar(12) not null,
reg_pres_fecha_prestamo datetime not null,
reg_pres_fecha_devolucion datetime not null
constraint PK_reg_pres_id_registro_prestamos
primary key clustered (reg_pres_id_registro_prestamos)
constraint FK_reg_pres_numero_cinta
foreign key (reg_pres_numero_cinta) references tbl_cinta(cin_numero_cinta),
constraint FK_reg_pres_codigo_socio
foreign key (reg_pres_codigo_socio) references tbl_socio(soc_codigo_socio)
)
ON PRESTAMOS
go

USE VIDEOTEC
GO
create table tbl_devolucion_cinta
(
del_cin_id_devolucion_cinta int identity(1,1) not null,
del_cin_numero_cinta varchar(13) not null,
del_cin_codigo_socio varchar(12) not null,
del_cin_fecha_prestamo datetime not null,
del_cin_fecha_devolucion datetime not null
constraint PK_del_cin_id_devolucion_cinta
primary key clustered (del_cin_id_devolucion_cinta)
constraint FK_del_cin_numero_cinta
foreign key (del_cin_numero_cinta) references tbl_cinta(cin_numero_cinta),
constraint FK_del_cin_codigo_socio
foreign key (del_cin_codigo_socio) references tbl_socio(soc_codigo_socio)
)
ON PRESTAMOS
go

-----------------------
-- TABLAS DE BITACORA
-----------------------

use VIDEOTEC
go
create table tbl_bitacora_idioma
(
bit_idm_id_bitacora_idioma int identity not null,
bit_idm_usuario varchar(30) not null default current_user,
bit_idm_idioma_id varchar(3) not null,
bit_idm_accion varchar(6) not null check (bit_idm_accion in ('INSERT','UPDATE','DELETE')),
bit_idm_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_idioma
primary key clustered (bit_idm_id_bitacora_idioma)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_empresa
(
bit_emp_id_bitacora_empresa int identity not null,
bit_emp_usuario varchar(30) not null default current_user,
bit_emp_empresa int not null,
bit_emp_accion varchar(6) not null check (bit_emp_accion in ('INSERT','UPDATE','DELETE')),
bit_emp_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_empresa
primary key clustered (bit_emp_id_bitacora_empresa)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_genero_pelicula
(
bit_gen_id_bitacora_genero_pelicula int identity not null,
bit_gen_usuario varchar(30) not null default current_user,
bit_gen_genero_pelicula int not null,
bit_gen_accion varchar(6) not null check (bit_gen_accion in ('INSERT','UPDATE','DELETE')),
bit_gen_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_genero_pelicula
primary key clustered (bit_gen_id_bitacora_genero_pelicula)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_actor
(
bit_act_id_bitacora_actor int identity not null,
bit_act_usuario varchar(30) not null default current_user,
bit_act_actor int not null,
bit_act_accion varchar(6) not null check (bit_act_accion in ('INSERT','UPDATE','DELETE')),
bit_act_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_actor
primary key clustered (bit_act_id_bitacora_actor)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_productora
(
bit_prod_id_bitacora_productora int identity not null,
bit_prod_usuario varchar(30) not null default current_user,
bit_prod_productora int not null,
bit_prod_accion varchar(6) not null check (bit_prod_accion in ('INSERT','UPDATE','DELETE')),
bit_prod_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_productora
primary key clustered (bit_prod_id_bitacora_productora)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_director
(
bit_dir_id_bitacora_director int identity not null,
bit_dir_usuario varchar(30) not null default current_user,
bit_dir_director int not null,
bit_dir_accion varchar(6) not null check (bit_dir_accion in ('INSERT','UPDATE','DELETE')),
bit_dir_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_director
primary key clustered (bit_dir_id_bitacora_director)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_pelicula
(
bit_pel_id_bitacora_pelicula int identity not null,
bit_pel_usuario varchar(30) not null default current_user,
bit_pel_pelicula varchar(8) not null,
bit_pel_accion varchar(6) not null check (bit_pel_accion in ('INSERT','UPDATE','DELETE')),
bit_pel_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_pelicula
primary key clustered (bit_pel_id_bitacora_pelicula)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_clasificacion
(
bit_clasf_id_bitacora_clasificacion int identity not null,
bit_clasf_usuario varchar(30) not null default current_user,
bit_clasf_clasificacion varchar(5) not null,
bit_clasf_accion varchar(6) not null check (bit_clasf_accion in ('INSERT','UPDATE','DELETE')),
bit_clasf_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_clasificacion
primary key clustered (bit_clasf_id_bitacora_clasificacion)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_socio
(
bit_soc_id_bitacora_socio int identity not null,
bit_soc_usuario varchar(30) not null default current_user,
bit_soc_socio varchar(12) not null,
bit_soc_accion varchar(6) not null check (bit_soc_accion in ('INSERT','UPDATE','DELETE')),
bit_soc_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_socio
primary key clustered (bit_soc_id_bitacora_socio)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_cinta
(
bit_cin_id_bitacora_cinta int identity not null,
bit_cin_usuario varchar(30) not null default current_user,
bit_cin_cinta varchar(13) not null,
bit_cin_accion varchar(6) not null check (bit_cin_accion in ('INSERT','UPDATE','DELETE')),
bit_cin_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_cinta
primary key clustered (bit_cin_id_bitacora_cinta)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_usuario
(
bit_user_id_bitacora_usuario int identity not null,
bit_user_usuario varchar(30) not null default current_user,
bit_user_usuario_id int not null,
bit_user_accion varchar(6) not null check (bit_user_accion in ('INSERT','UPDATE','DELETE')),
bit_user_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_usuario
primary key clustered (bit_user_id_bitacora_usuario)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_rol
(
bit_rol_id_bitacora_rol int identity not null,
bit_rol_usuario varchar(30) not null default current_user,
bit_rol_rol int not null,
bit_rol_accion varchar(6) not null check (bit_rol_accion in ('INSERT','UPDATE','DELETE')),
bit_rol_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_rol
primary key clustered (bit_rol_id_bitacora_rol)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_prestamo
(
bit_pres_id_bitacora_prestamo int identity not null,
bit_pres_usuario varchar(30) not null default current_user,
bit_pres_prestamo int not null,
bit_pres_accion varchar(6) not null check (bit_pres_accion in ('INSERT','UPDATE','DELETE')),
bit_pres_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_prestamo
primary key clustered (bit_pres_id_bitacora_prestamo)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_detalle_prestamo
(
bit_det_pres_id_bitacora_detalle_prestamo int identity not null,
bit_det_pres_usuario varchar(30) not null default current_user,
bit_det_pres_detalle_prestamo int not null,
bit_det_pres_accion varchar(6) not null check (bit_det_pres_accion in ('INSERT','UPDATE','DELETE')),
bit_det_pres_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_detalle_prestamo
primary key clustered (bit_det_pres_id_bitacora_detalle_prestamo)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_carrito_compra
(
bit_carr_id_bitacora_carrito_compra int identity not null,
bit_carr_usuario varchar(30) not null default current_user,
bit_carr_carrito_compra int not null,
bit_carr_accion varchar(6) not null check (bit_carr_accion in ('INSERT','UPDATE','DELETE')),
bit_carr_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_carrito_compra
primary key clustered (bit_carr_id_bitacora_carrito_compra)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_subtitulos_cinta
(
bit_sub_id_bitacora_subtitulos_cinta int identity not null,
bit_sub_usuario varchar(30) not null default current_user,
bit_sub_subtitulos_cinta int not null,
bit_sub_accion varchar(6) not null check (bit_sub_accion in ('INSERT','UPDATE','DELETE')),
bit_sub_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_subtitulos_cinta
primary key clustered (bit_sub_id_bitacora_subtitulos_cinta)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_pelicula_genero
(
bit_pel_gen_id_bitacora_pelicula_genero int identity not null,
bit_pel_gen_usuario varchar(30) not null default current_user,
bit_pel_gen_pelicula_genero int not null,
bit_pel_gen_accion varchar(6) not null check (bit_pel_gen_accion in ('INSERT','UPDATE','DELETE')),
bit_pel_gen_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_pelicula_genero
primary key clustered (bit_pel_gen_id_bitacora_pelicula_genero)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_pelicula_actor
(
bit_pel_act_id_bitacora_pelicula_actor int identity not null,
bit_pel_act_usuario varchar(30) not null default current_user,
bit_pel_act_pelicula_actor int not null,
bit_pel_act_accion varchar(6) not null check (bit_pel_act_accion in ('INSERT','UPDATE','DELETE')),
bit_pel_act_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_pelicula_actor
primary key clustered (bit_pel_act_id_bitacora_pelicula_actor)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_pelicula_productora
(
bit_pel_prod_id_bitacora_pelicula_productora int identity not null,
bit_pel_prod_usuario varchar(30) not null default current_user,
bit_pel_prod_pelicula_productora int not null,
bit_pel_prod_accion varchar(6) not null check (bit_pel_prod_accion in ('INSERT','UPDATE','DELETE')),
bit_pel_prod_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_pelicula_productora
primary key clustered (bit_pel_prod_id_bitacora_pelicula_productora)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_pelicula_director
(
bit_pel_dir_id_bitacora_pelicula_director int identity not null,
bit_pel_dir_usuario varchar(30) not null default current_user,
bit_pel_dir_pelicula_director int not null,
bit_pel_dir_accion varchar(6) not null check (bit_pel_dir_accion in ('INSERT','UPDATE','DELETE')),
bit_pel_dir_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_pelicula_director
primary key clustered (bit_pel_dir_id_bitacora_pelicula_director)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_lista_espera
(
bit_list_id_bitacora_lista_espera int identity not null,
bit_list_usuario varchar(30) not null default current_user,
bit_list_lista_espera int not null,
bit_list_accion varchar(6) not null check (bit_list_accion in ('INSERT','UPDATE','DELETE')),
bit_list_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_lista_espera
primary key clustered (bit_list_id_bitacora_lista_espera)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_llamada
(
bit_lla_id_bitacora_llamada int identity not null,
bit_lla_usuario varchar(30) not null default current_user,
bit_lla_llamada int not null,
bit_lla_accion varchar(6) not null check (bit_lla_accion in ('INSERT','UPDATE','DELETE')),
bit_lla_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_llamada
primary key clustered (bit_lla_id_bitacora_llamada)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_socio_actor
(
bit_soc_act_id_bitacora_socio_actor int identity not null,
bit_soc_act_usuario varchar(30) not null default current_user,
bit_soc_act_socio_actor int not null,
bit_soc_act_accion varchar(6) not null check (bit_soc_act_accion in ('INSERT','UPDATE','DELETE')),
bit_soc_act_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_socio_actor
primary key clustered (bit_soc_act_id_bitacora_socio_actor)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_socio_genero
(
bit_soc_gen_id_bitacora_socio_genero int identity not null,
bit_soc_gen_usuario varchar(30) not null default current_user,
bit_soc_gen_socio_genero int not null,
bit_soc_gen_accion varchar(6) not null check (bit_soc_gen_accion in ('INSERT','UPDATE','DELETE')),
bit_soc_gen_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_socio_genero
primary key clustered (bit_soc_gen_id_bitacora_socio_genero)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_socio_director
(
bit_soc_dir_id_bitacora_socio_director int identity not null,
bit_soc_dir_usuario varchar(30) not null default current_user,
bit_soc_dir_socio_director int not null,
bit_soc_dir_accion varchar(6) not null check (bit_soc_dir_accion in ('INSERT','UPDATE','DELETE')),
bit_soc_dir_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_socio_director
primary key clustered (bit_soc_dir_id_bitacora_socio_director)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_devolucion_cinta
(
bit_del_cin_id_bitacora_devolucion_cinta int identity not null,
bit_del_cin_usuario varchar(30) not null default current_user,
bit_del_cin_devolucion_cinta int not null,
bit_del_cin_accion varchar(6) not null check (bit_del_cin_accion in ('INSERT','UPDATE','DELETE')),
bit_del_cin_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_devolucion_cinta
primary key clustered (bit_del_cin_id_bitacora_devolucion_cinta)
)
ON BITACORAS
go

use VIDEOTEC
go
create table tbl_bitacora_registro_prestamos
(
bit_reg_cin_id_bitacora_devolucion_cinta int identity not null,
bit_reg_cin_usuario varchar(30) not null default current_user,
bit_reg_cin_registro_prestamos int not null,
bit_reg_cin_accion varchar(6) not null check (bit_reg_cin_accion in ('INSERT','UPDATE','DELETE')),
bit_reg_cin_fecha_accion datetime not null default getdate()
constraint PK_tbl_bitacora_registro_prestamos
primary key clustered (bit_reg_cin_id_bitacora_devolucion_cinta)
)
ON BITACORAS
go
