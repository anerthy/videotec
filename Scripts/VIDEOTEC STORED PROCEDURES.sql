-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para insertar un registro de un socio>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_socio ( 
	@soc_cedula varchar(9),
	@soc_nombre varchar(35),
	@soc_apellido1 varchar(40),
	@soc_apellido2 varchar(40),
	@soc_correo varchar(50),
	@soc_telefono varchar(8),
	@soc_codigo_postal varchar(5),
	@soc_direccion_exacta varchar(100),
	@soc_genero varchar(10),
	@soc_fecha_nacimiento date,
	@soc_foto_perfil varchar(50)
	)
AS
BEGIN
    
	declare  @id varchar(36), @soc_codigo_socio varchar(12)

	set @id = newid()
	set @id = SUBSTRING(@id,25,12)
	set @soc_codigo_socio = @id

	insert into tbl_socio (soc_codigo_socio,soc_cedula,soc_nombre,soc_apellido1,soc_apellido2,soc_correo,soc_telefono,soc_codigo_postal,soc_direccion_exacta,soc_genero,soc_fecha_nacimiento,soc_foto_perfil) 
	values (@soc_codigo_socio,@soc_cedula,@soc_nombre,@soc_apellido1,@soc_apellido2,@soc_correo,@soc_telefono,@soc_codigo_postal,@soc_direccion_exacta,@soc_genero,@soc_fecha_nacimiento,@soc_foto_perfil)
END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para actualizar un registro de socio>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_socio ( 
	@soc_codigo_socio varchar(12),
	@soc_cedula varchar(9),
	@soc_nombre varchar(35),
	@soc_apellido1 varchar(40),
	@soc_apellido2 varchar(40),
	@soc_correo varchar(50),
	@soc_telefono varchar(8),
	@soc_codigo_postal varchar(5),
	@soc_direccion_exacta varchar(100),
	@soc_genero varchar(10),
	@soc_fecha_nacimiento date,
	@soc_foto_perfil varchar(50)
	)
AS
BEGIN
    
	update tbl_socio set 
	soc_cedula = @soc_cedula,
	soc_nombre = @soc_nombre,
	soc_apellido1 = @soc_apellido1,
	soc_apellido2 = @soc_apellido2,
	soc_correo = @soc_correo,
	soc_telefono = @soc_telefono,
	soc_codigo_postal = @soc_codigo_postal,
	soc_direccion_exacta = @soc_direccion_exacta,
	soc_genero = @soc_genero,
	soc_fecha_nacimiento = @soc_fecha_nacimiento,
	soc_foto_perfil = @soc_foto_perfil
	where soc_codigo_socio = @soc_codigo_socio

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para eliminar un registro de socio>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_socio ( 
	@soc_codigo_socio varchar(12)
	)
AS
BEGIN
    
	delete from tbl_socio
	where soc_codigo_socio = @soc_codigo_socio

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para seleccionar todos los registros de la tabla tbl_socio>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_socio
AS
BEGIN

    select soc_codigo_socio,soc_cedula,soc_nombre,soc_apellido1,soc_apellido2,soc_correo,soc_telefono,soc_codigo_postal,soc_direccion_exacta,soc_genero,soc_fecha_nacimiento,soc_foto_perfil from tbl_socio

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para seleccionar todos los campos de un registro de tbl_socio por el codigo socio>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_socio (@soc_codigo_socio varchar(12))
AS
BEGIN

    select soc_codigo_socio,soc_cedula,soc_nombre,soc_apellido1,soc_apellido2,soc_correo,soc_telefono,soc_codigo_postal,soc_direccion_exacta,soc_genero,soc_fecha_nacimiento,soc_foto_perfil from tbl_socio where soc_codigo_socio = @soc_codigo_socio

END
GO

-- -- -- -- -- -- -- -- -- -- 

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/30>
-- Description:	<sp para insertar un registro en la tabla tbl_empresa>
-- =============================================
USE VIDEOTEC
GO
create PROCEDURE sp_insert_tbl_empresa ( 
	@emp_nombre varchar(15),
	@emp_telefono varchar(8),
	@emp_direccion text,
	@emp_correo varchar(50),
	@emp_logo varchar(50) NULL
	)
AS
BEGIN
    
	IF @emp_logo = NULL
	BEGIN
		insert into tbl_empresa(emp_nombre,emp_telefono,emp_direccion,emp_correo) 
		values (@emp_nombre,@emp_telefono,@emp_direccion,@emp_correo)
	END
	ELSE
	BEGIN
		insert into tbl_empresa(emp_nombre,emp_telefono,emp_direccion,emp_correo,emp_logo) 
		values (@emp_nombre,@emp_telefono,@emp_direccion,@emp_correo,@emp_logo)
	END
END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para actualizar un registro de la tabla tbl_empresa>
-- =============================================
USE VIDEOTEC
GO
create PROCEDURE sp_update_tbl_empresa 
	( 
	@emp_id_empresa int,
	@emp_nombre varchar(15),
	@emp_telefono varchar(8),
	@emp_direccion text,
	@emp_correo varchar(50),
	@emp_logo varchar(50) NULL
	)
AS
BEGIN
    IF @emp_logo = NULL
	BEGIN
		update tbl_empresa set 
		emp_nombre = @emp_nombre,
		emp_telefono = @emp_telefono,
		emp_direccion = @emp_direccion,
		emp_correo = @emp_correo
		where emp_id_empresa = @emp_id_empresa
	END
	ELSE
	BEGIN
		update tbl_empresa set 
		emp_nombre = @emp_nombre,
		emp_telefono = @emp_telefono,
		emp_direccion = @emp_direccion,
		emp_correo = @emp_correo,
		emp_logo = @emp_logo
		where emp_id_empresa = @emp_id_empresa
	END
END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para eliminar un registro de tbl_empresa>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_empresa 
	( 
	@emp_id_empresa int
	)
AS
BEGIN
    
	delete from tbl_empresa
	where emp_id_empresa = @emp_id_empresa

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para seleccionar todos los registros de la tabla tbl_empresa>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_empresa
AS
BEGIN

	select 
	emp_id_empresa,
	emp_nombre,
	emp_telefono,
	emp_direccion,
	emp_correo,
	emp_logo 
	from tbl_empresa

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para seleccionar todos los campos de un registro de tbl_socio por el codigo socio>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_empresa 
	(
	@emp_id_empresa int
	)
AS
BEGIN

	select 
	emp_id_empresa,
	emp_nombre,
	emp_telefono,
	emp_direccion,
	emp_correo,
	emp_logo 
	from tbl_empresa 
	where emp_id_empresa = @emp_id_empresa

END
GO

USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_clasificacion ( 
	@clasf_simbolo varchar(5),
	@clasf_nombre varchar(30),
	@clasf_significado varchar(MAX)
	)
AS
BEGIN
	insert into tbl_clasificacion(clasf_simbolo,clasf_nombre,clasf_significado) 
	values (@clasf_simbolo,@clasf_nombre,@clasf_significado)
END
GO

USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_clasificacion  
( 
	@clasf_simbolo varchar(5),
	@clasf_nombre varchar(30),
	@clasf_significado varchar(MAX)
)
AS
BEGIN
    
	update tbl_clasificacion set 
	clasf_nombre = @clasf_nombre,
	clasf_significado = @clasf_significado
	where clasf_simbolo = @clasf_simbolo

END
GO

USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_clasificacion
( 
	@clasf_simbolo varchar(5)
)
AS
BEGIN
    
	delete from tbl_clasificacion
	where clasf_simbolo = @clasf_simbolo

END
GO

USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_clasificacion
AS
BEGIN
	select clasf_simbolo,
	clasf_nombre,
	clasf_significado
	from tbl_clasificacion
END
GO

USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_clasificacion
(
	@clasf_simbolo varchar(5)
)
AS
BEGIN
	select clasf_simbolo,
	clasf_nombre,
	clasf_significado
	from tbl_clasificacion
	where clasf_simbolo = @clasf_simbolo
END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para insertar un registro de un tbl_pelicula>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_pelicula ( 
	@pel_titulo varchar(100),
	@pel_sinopsis text,
	@pel_clasificacion varchar(5),
	@pel_duracion time,
	@pel_año_publicacion int,
	@pel_pais varchar(20),
	@pel_precio money,
	@pel_portada varchar(100),
	@pel_trailer varchar(100)
	)
AS
BEGIN
    
	declare  @id varchar(36),@pel_id_pelicula varchar(8)

	set @id =  newid()
	set @id = SUBSTRING(@id,1,8)
	set @pel_id_pelicula = @id

	insert into tbl_pelicula(pel_id_pelicula,pel_titulo,pel_sinopsis,pel_clasificacion,pel_duracion,pel_año_publicacion,pel_pais,pel_precio,pel_portada,pel_trailer) 
	values (@pel_id_pelicula,@pel_titulo,@pel_sinopsis,@pel_clasificacion,@pel_duracion,@pel_año_publicacion,@pel_pais,@pel_precio,@pel_portada,@pel_trailer)
END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para actualizar un registro de tbl_pelicula>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_pelicula ( 
	@pel_id_pelicula varchar(8),
	@pel_titulo varchar(10),
	@pel_sinopsis text,
	@pel_clasificacion varchar(5),
	@pel_duracion time,
	@pel_año_publicacion int,
	@pel_pais varchar(20),
	@pel_precio money,
	@pel_portada varchar(50),
	@pel_trailer varchar(50)
	)
AS
BEGIN
    
	update tbl_pelicula set 
	pel_titulo =@pel_titulo,
	pel_sinopsis =@pel_sinopsis,
	pel_clasificacion =@pel_clasificacion,
	pel_duracion =@pel_duracion,
	pel_año_publicacion =@pel_año_publicacion,
	pel_pais =@pel_pais,
	pel_precio =@pel_precio,
	pel_portada =@pel_portada,
	pel_trailer =@pel_trailer
	where pel_id_pelicula = @pel_id_pelicula

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para eliminar un registro de tbl_pelicula>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_pelicula ( 
	@pel_id_pelicula varchar(8)
	)
AS
BEGIN
    
	delete from tbl_pelicula
	where pel_id_pelicula = @pel_id_pelicula

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para seleccionar todos los registros de la tabla tbl_pelicula>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_pelicula
AS
BEGIN

    select pel_id_pelicula,pel_titulo,pel_sinopsis,pel_clasificacion,pel_duracion,pel_año_publicacion,pel_stock_cintas,pel_pais,pel_precio,pel_disponibilidad,pel_portada,pel_trailer from tbl_pelicula

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para seleccionar todos los campos de un registro de tbl_pelicula >
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_pelicula (@pel_id_pelicula varchar(8))
AS
BEGIN

	select pel_id_pelicula,pel_titulo,pel_sinopsis,pel_clasificacion,pel_duracion,pel_año_publicacion,pel_stock_cintas,pel_pais,pel_precio,pel_disponibilidad,pel_portada,pel_trailer from tbl_pelicula where pel_id_pelicula = @pel_id_pelicula

END
GO

-- -- -- -- -- -- -- 

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para insertar un registro de un socio>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_cinta ( 
	@cin_idioma varchar(3),
	@cin_pelicula_id varchar(8)
	)
AS
BEGIN
    
	declare  @id varchar(36),@cin_numero_cinta varchar(13)

	set @id =  newid()
	set @id = SUBSTRING(@id,1,4)
	set @cin_numero_cinta = @cin_pelicula_id + '-' + @id

	insert into tbl_cinta(cin_numero_cinta,cin_idioma,cin_pelicula_id) 
	values (@cin_numero_cinta,@cin_idioma,@cin_pelicula_id)
END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para actualizar un registro de socio>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_cinta ( 
	@cin_numero_cinta varchar(13),
	@cin_idioma varchar(3),
	@cin_pelicula_id varchar(8)
	)
AS
BEGIN
    if((select cin_pelicula_id from tbl_cinta where cin_numero_cinta = '@cin_numero_cinta') = '@cin_pelicula_id')
	begin
		update tbl_cinta set
		cin_idioma = @cin_idioma
		where cin_numero_cinta = @cin_numero_cinta
	end
	else
	begin
		delete tbl_cinta where cin_numero_cinta = @cin_numero_cinta;
		exec sp_insert_tbl_cinta @cin_idioma,@cin_pelicula_id;
	end
END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para eliminar un registro de socio>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_cinta
	( 
	@cin_numero_cinta varchar(13)
	)
AS
BEGIN
    
	delete from tbl_cinta
	where cin_numero_cinta = @cin_numero_cinta

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para seleccionar todos los registros de la tabla tbl_socio>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_cinta
AS
BEGIN

    select cin_numero_cinta,cin_idioma,cin_pelicula_id,cin_estado from tbl_cinta

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para seleccionar todos los campos de un registro de tbl_socio por el codigo socio>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_cinta (@cin_numero_cinta varchar(13))
AS
BEGIN

	select cin_numero_cinta,cin_idioma,cin_pelicula_id,cin_estado from tbl_cinta where cin_numero_cinta = @cin_numero_cinta

END
GO

-- -- -- -- -- -- -- -- -- -- 

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/30>
-- Description:	<sp para insertar un registro en la tabla tbl_empresa>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_detalle_prestamo 
	( 
	@det_pres_prestamo_id int,
	@pel_id_pelicula varchar(8)
	)
AS
BEGIN
    
	declare @det_pres_sub_total money,@det_pres_numero_cinta varchar(13)

	if exists (select top (1) cin_numero_cinta from tbl_cinta where (cin_pelicula_id = @pel_id_pelicula) and (cin_estado = 'Disponible'))
	begin
		set @det_pres_numero_cinta = (select top (1) cin_numero_cinta from tbl_cinta where (cin_pelicula_id = @pel_id_pelicula) and (cin_estado = 'Disponible'))

		set @det_pres_sub_total = (select pel_precio from tbl_pelicula where pel_id_pelicula = 
		(select cin_pelicula_id from tbl_cinta where (cin_numero_cinta = @det_pres_numero_cinta)))

		insert into tbl_detalle_prestamo(det_pres_prestamo_id,det_pres_numero_cinta,det_pres_sub_total) 
		values (@det_pres_prestamo_id,@det_pres_numero_cinta,@det_pres_sub_total)
	end

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para actualizar un registro de la tabla tbl_empresa>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_detalle_prestamo 
	( 
	@det_pres_id_detalle_prestamo int,
	@det_pres_prestamo_id int,
	@det_pres_numero_cinta varchar(13)
	)
AS
BEGIN
    
	declare @det_pres_sub_total money
	set @det_pres_sub_total = (select pel_precio from tbl_pelicula where pel_id_pelicula = 
	(select cin_pelicula_id from tbl_cinta where cin_numero_cinta = @det_pres_numero_cinta))

	update tbl_detalle_prestamo set 
	det_pres_prestamo_id = @det_pres_prestamo_id,
	det_pres_numero_cinta = @det_pres_numero_cinta,
	det_pres_sub_total = @det_pres_sub_total
	where det_pres_id_detalle_prestamo = @det_pres_id_detalle_prestamo

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para eliminar un registro de tbl_empresa>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_detalle_prestamo 
	( 
	@det_pres_id_detalle_prestamo int
	)
AS
BEGIN
    
	delete from tbl_detalle_prestamo
	where det_pres_id_detalle_prestamo = @det_pres_id_detalle_prestamo

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para seleccionar todos los registros de la tabla tbl_empresa>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_detalle_prestamo
AS
BEGIN

	select 
	det_pres_id_detalle_prestamo,
	det_pres_prestamo_id,
	det_pres_numero_cinta,
	det_pres_sub_total
	from tbl_detalle_prestamo

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para seleccionar todos los campos de un registro de tbl_socio por el codigo socio>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_detalle_prestamo 
	(
	@det_pres_id_detalle_prestamo int
	)
AS
BEGIN

	select 
	det_pres_id_detalle_prestamo,
	det_pres_prestamo_id,
	det_pres_numero_cinta,
	det_pres_sub_total
	from tbl_detalle_prestamo
	where det_pres_id_detalle_prestamo = @det_pres_id_detalle_prestamo

END
GO

-- -- -- -- -- -- -- -- -- -- 

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/30>
-- Description:	<sp para insertar un registro en la tabla tbl_empresa>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_carrito_compra
	( 
	@carr_pelicula_id varchar(8),
	@carr_codigo_socio varchar(12)
	)
AS
BEGIN
    
		insert into tbl_carrito_compra (carr_pelicula_id,carr_codigo_socio) 
		values (@carr_pelicula_id,@carr_codigo_socio)

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para actualizar un registro de la tabla tbl_empresa>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_carrito_compra
	( 
	@carr_id_carrito int,
	@carr_pelicula_id varchar(8),
	@carr_codigo_socio varchar(12)
	)
AS
BEGIN
    
	update tbl_carrito_compra set 
	carr_pelicula_id = @carr_pelicula_id,
	carr_codigo_socio = @carr_codigo_socio
	where carr_id_carrito = @carr_id_carrito

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para eliminar un registro de tbl_empresa>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_carrito_compra
	( 
	@carr_id_carrito int
	)
AS
BEGIN
    
	delete from tbl_carrito_compra
	where carr_id_carrito = @carr_id_carrito

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para seleccionar todos los registros de la tabla tbl_empresa>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_carrito_compra
AS
BEGIN

	select 
	carr_id_carrito,
	carr_pelicula_id,
	carr_codigo_socio,
	carr_estado
	from tbl_carrito_compra

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para seleccionar todos los campos de un registro de tbl_socio por el codigo socio>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_carrito_compra
	(
	@carr_id_carrito int
	)
AS
BEGIN

	select 
	carr_id_carrito,
	carr_pelicula_id,
	carr_codigo_socio,
	carr_estado
	from tbl_carrito_compra
	where carr_id_carrito = @carr_id_carrito

END
GO

-------------------
--AARON
-------------------
-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/30>
-- Description:	<sp para insertar un registro de una productora>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_productora 
( 
@prod_nombre varchar(20),
@prod_año_fundacion int,
@prod_descripcion text,
@prod_sitio_web varchar(20),
@prod_logo varchar(50)
)
AS
BEGIN

insert into tbl_productora (prod_nombre,prod_año_fundacion,prod_descripcion,prod_sitio_web,prod_logo) 
values (@prod_nombre,@prod_año_fundacion,@prod_descripcion,@prod_sitio_web,@prod_logo) 
END
GO

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/30>
-- Description:	<sp para actualizar un registro de la tabla tbl_productora>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_productora
	( 
	@prod_id_productora int,
    @prod_nombre varchar(20),
    @prod_año_fundacion int,
    @prod_descripcion text,
    @prod_sitio_web varchar(20),
    @prod_logo varchar(50)
	)
AS
BEGIN
    
	update tbl_productora set 
    prod_nombre = @prod_nombre,
    prod_año_fundacion = @prod_año_fundacion,
    prod_descripcion = @prod_descripcion,
    prod_sitio_web = @prod_sitio_web,
    prod_logo=@prod_logo
	where prod_id_productora = @prod_id_productora

END
GO

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/30>
-- Description:	<sp para eliminar un registro de tbl_productora>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_productora 
	( 
	@prod_id_productora int
	)
AS
BEGIN
    
	delete from tbl_productora 
	where prod_id_productora = @prod_id_productora

END
GO

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/30>
-- Description:	<sp para seleccionar todos los registros de la tabla tbl_productora>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_productora
AS
BEGIN

	select 
	prod_id_productora,
    prod_nombre,
    prod_año_fundacion,
    prod_descripcion,
    prod_sitio_web ,
    prod_logo 
	from  tbl_productora

END
GO

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/30>
-- Description:	<sp para seleccionar todos los campos de un registro de tbl_productora por el codigo productora>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_productora 
	(
	@prod_id_productora int
	)
AS
BEGIN

	select 
	prod_id_productora,
    prod_nombre,
    prod_año_fundacion,
    prod_descripcion,
    prod_sitio_web ,
    prod_logo 
	from  tbl_productora
	where prod_id_productora = @prod_id_productora

END
GO

--===============ACTOR================

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/30>
-- Description:	<sp para insertar un registro de un actor>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_actor ( 

@act_nombre varchar(35),
@act_nombre_nacimiento varchar(40),
@act_nacionalidad varchar(15),
@act_biografia text,
@act_año_inicio int,
@act_fecha_nacimiento date,
@act_ocupacion varchar(100),
@act_imagen varchar(50)
)
AS
BEGIN

insert into tbl_actor (act_nombre,act_nombre_nacimiento,act_nacionalidad,act_biografia,act_año_inicio,act_fecha_nacimiento,act_ocupacion,act_imagen) 
values (@act_nombre,@act_nombre_nacimiento,@act_nacionalidad,@act_biografia,@act_año_inicio,@act_fecha_nacimiento,@act_ocupacion,@act_imagen) 
END
GO

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/30>
-- Description:	<sp para actualizar un registro de la tabla tbl_actor>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_actor
	( 

	@act_id_actor int,
	@act_nombre varchar(35),
    @act_nombre_nacimiento varchar(40),
    @act_nacionalidad varchar(15),
    @act_biografia text,
    @act_año_inicio int,
    @act_fecha_nacimiento date,
    @act_ocupacion varchar(100),
    @act_imagen varchar(50)
	)
AS
BEGIN
    
	update tbl_actor set 
	act_nombre= @act_nombre ,
    act_nombre_nacimiento= @act_nombre_nacimiento ,
    act_nacionalidad= @act_nacionalidad ,
    act_biografia= @act_biografia ,
    act_año_inicio= @act_año_inicio,
    act_fecha_nacimiento= @act_fecha_nacimiento ,
    act_ocupacion= @act_ocupacion ,
    act_imagen= @act_imagen 
	where act_id_actor = @act_id_actor

END
GO

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/30>
-- Description:	<sp para eliminar un registro de tbl_actor>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_actor
	( 
	@act_id_actor int
	)
AS
BEGIN
    
	delete from tbl_actor
	where act_id_actor = @act_id_actor

END
GO


-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/30>
-- Description:	<sp para seleccionar todos los registros de la tabla tbl_actor>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_actor
AS
BEGIN

	select 
	act_id_actor,
	act_nombre,
	act_nombre_nacimiento,
    act_nacionalidad,
    act_biografia,
    act_año_inicio,
    act_fecha_nacimiento,
    act_ocupacion,
    act_imagen
	from  tbl_actor

END
GO

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/30>
-- Description:	<sp para seleccionar todos los campos de un registro de tbl_productora por el codigo actor>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_actor
	(
	@act_id_actor int
	)
AS
BEGIN

	select 
	act_id_actor,
	act_nombre,
	act_nombre_nacimiento,
    act_nacionalidad,
    act_biografia,
    act_año_inicio,
    act_fecha_nacimiento,
    act_ocupacion,
    act_imagen
	from  tbl_actor
	where act_id_actor = @act_id_actor

END
GO

--===============PELICULA================


-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/31>
-- Description:	<sp para insertar un registro de un genero de pelicula>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_genero_pelicula 
( 
@gen_nombre varchar(20),
@gen_descripcion text,
@gen_imagen varchar(50)
)
AS
BEGIN
	insert into tbl_genero_pelicula (gen_nombre,gen_descripcion,gen_imagen) 
	values (@gen_nombre,@gen_descripcion,@gen_imagen) 
END
GO



-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/31>
-- Description:	<sp para actualizar un registro de la tabla tbl_genero_pelicula>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_genero_pelicula
	( 
	@gen_id_genero int,
    @gen_nombre varchar(20),
    @gen_descripcion text,
    @gen_imagen varchar(50)
	)
AS
BEGIN
      
   update tbl_genero_pelicula set 
	gen_nombre= @gen_nombre ,
    gen_descripcion= @gen_descripcion ,
    gen_imagen= @gen_imagen
	where gen_id_genero = @gen_id_genero

END
GO

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/31>
-- Description:	<sp para eliminar un registro de tbl_genero_pelicula>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_genero_pelicula
	( 
	@gen_id_genero int
	)
AS
BEGIN
    
	delete from tbl_genero_pelicula
	where gen_id_genero = @gen_id_genero

END
GO

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/31>
-- Description:	<sp para seleccionar todos los registros de la tabla tbl_genero_pelicula>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_genero_pelicula
AS
BEGIN

	select 
	gen_id_genero,
	gen_nombre,
	gen_descripcion,
	gen_imagen
	from  tbl_genero_pelicula

END
GO

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/31>
-- Description:	<sp para seleccionar todos los campos de un registro de tbl_genero_pelicula por el codigo Genero_pelicula>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_genero_pelicula
	(
	@gen_id_genero int
	)
AS
BEGIN
	
	select 
	gen_id_genero,
	gen_nombre,
	gen_descripcion,
	gen_imagen
	from  tbl_genero_pelicula
	where gen_id_genero = @gen_id_genero

END
GO

--===============DIRECTOR================

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/31>
-- Description:	<sp para insertar un registro de un director
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_director 
( 
@dir_nombre varchar(30),
@dir_nombre_nacimiento varchar(50),
@dir_nacionalidad varchar(15),
@dir_biografia text,
@dir_fecha_nacimiento date,
@dir_imagen varchar(50)
)
AS
BEGIN
	insert into tbl_director (dir_nombre,dir_nombre_nacimiento,dir_nacionalidad,dir_biografia,dir_fecha_nacimiento,dir_imagen) 
	values (@dir_nombre,@dir_nombre_nacimiento,@dir_nacionalidad,@dir_biografia,@dir_fecha_nacimiento,@dir_imagen) 
END
GO



-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/31>
-- Description:	<sp para actualizar un registro de la tabla tbl_director>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_director
	( 
	@dir_id_director int,
	@dir_nombre varchar(30),
    @dir_nombre_nacimiento varchar(50),
    @dir_nacionalidad varchar(15),
    @dir_biografia text,
    @dir_fecha_nacimiento date,
    @dir_imagen varchar(50)
	)
AS
BEGIN
  
   update tbl_director set 
	dir_nombre= @dir_nombre ,
    dir_nombre_nacimiento= @dir_nombre_nacimiento ,
    dir_nacionalidad= @dir_nacionalidad,
	dir_biografia=@dir_biografia,
	dir_fecha_nacimiento=@dir_fecha_nacimiento,
	dir_imagen=@dir_imagen
	where dir_id_director = @dir_id_director

END
GO

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/31>
-- Description:	<sp para eliminar un registro de tbl_director>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_director
	( 
	@dir_id_director int
	)
AS
BEGIN
    
	delete from tbl_director
	where dir_id_director = @dir_id_director

END
GO

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/31>
-- Description:	<sp para seleccionar todos los registros de la tabla tbl_director>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_director
AS
BEGIN

	select 
	dir_nombre,
    dir_nombre_nacimiento ,
    dir_nacionalidad,
	dir_biografia,
	dir_fecha_nacimiento,
	dir_imagen
	from  tbl_director

END
GO

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/31>
-- Description:	<sp para seleccionar todos los campos de un registro de tbl_genero_pelicula por el codigo tbl_director>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_director
	(
	@dir_id_director int
	)
AS
BEGIN
	
	select 
	dir_nombre,
    dir_nombre_nacimiento ,
    dir_nacionalidad,
	dir_biografia,
	dir_fecha_nacimiento,
	dir_imagen
	from  tbl_director
	where dir_id_director = @dir_id_director

END
GO

--===============PRESTAMO================

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/31>
-- Description:	<sp para insertar un registro de un prestamo
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_prestamo 
( 
@pres_fecha_prestamo datetime,
@pres_fecha_devolucion datetime,
@pres_codigo_socio varchar(12)
)
AS
BEGIN
	insert into tbl_prestamo (pres_fecha_prestamo,pres_fecha_devolucion,pres_codigo_socio) 
	values (@pres_fecha_prestamo,@pres_fecha_devolucion,@pres_codigo_socio) 
END
GO

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/31>
-- Description:	<sp para actualizar un registro de la tabla tbl_prestamo>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_prestamo
	( 
	@pres_id_prestamo int,
	@pres_fecha_prestamo datetime,
    @pres_fecha_devolucion datetime,
    @pres_codigo_socio varchar(12),
    @pres_precio_total money
	)
AS
BEGIN  
   update tbl_prestamo set 
	pres_fecha_prestamo= @pres_fecha_prestamo ,
    pres_fecha_devolucion= @pres_fecha_devolucion,
	pres_codigo_socio=@pres_codigo_socio,
	pres_precio_total=@pres_precio_total
	where pres_id_prestamo = @pres_id_prestamo

END
GO

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/31>
-- Description:	<sp para eliminar un registro de tbl_prestamo>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_prestamo
	( 
	@pres_id_prestamo int
	)
AS
BEGIN
    
	delete from tbl_prestamo
	where pres_id_prestamo = @pres_id_prestamo

END
GO

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/31>
-- Description:	<sp para seleccionar todos los registros de la tabla tbl_prestamo>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_prestamo
AS
BEGIN
	select 
	pres_id_prestamo,
    pres_fecha_prestamo,
    pres_fecha_devolucion,
    pres_codigo_socio,
    pres_precio_total
	from  tbl_prestamo
END
GO

-- =============================================
-- Author:		<Aarón>
-- Create date: <2022/10/31>
-- Description:	<sp para seleccionar todos los campos de un registro de tbl_prestamo por el codigo tbl_prestamo>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_prestamo
	(
	@pres_id_prestamo int
	)
AS
BEGIN	
	select 
	pres_id_prestamo,
    pres_fecha_prestamo,
    pres_fecha_devolucion,
    pres_codigo_socio,
    pres_precio_total
	from  tbl_prestamo
	where pres_id_prestamo = @pres_id_prestamo
END
GO

-----
-- LELA
-----

--Tabla tbl_pelicula_director
-- Description:	<sp para insertar un registro en la tabla tbl_pelicula_director>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_pelicula_director 
	( 
	@pel_dir_pelicula_id varchar(8),
	@pel_dir_director_id int
	)
AS
BEGIN
	insert into tbl_pelicula_director(pel_dir_pelicula_id,pel_dir_director_id)
	values (@pel_dir_pelicula_id,@pel_dir_director_id)
END
GO

-- Description:	<sp para eliminar un registro de tbl_pelicula_director>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_pelicula_director 
	( 
	@pel_dir_id_pelicula_director int
	)
AS
BEGIN
    
	delete from tbl_pelicula_director
	where pel_dir_id_pelicula_director = @pel_dir_id_pelicula_director

END
GO

-- Description:	<sp para actualizar un registro de tbl_pelicula_director >
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_pelicula_director
( 
    @pel_dir_id_pelicula_director int,
	@pel_dir_pelicula_id varchar(8),
	@pel_dir_director_id int
)
AS
BEGIN
    
	update tbl_pelicula_director  set 	
	pel_dir_pelicula_id= @pel_dir_pelicula_id,
	pel_dir_director_id = @pel_dir_director_id	
	where pel_dir_id_pelicula_director = @pel_dir_id_pelicula_director

END
GO

-- Description:	<sp para seleccionar todos los registros de la tabla tbl_pelicula_director>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_pelicula_director
AS
BEGIN

	select 
	pel_dir_id_pelicula_director,
	pel_dir_pelicula_id,
	pel_dir_director_id
	from tbl_pelicula_director

END
GO

-- Description:	<sp para seleccionar todos los campos de un registro de tbl_pelicula_director por el id>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_pelicula_director 
	(
	@pel_dir_id_pelicula_director int
	)
AS
BEGIN

	select 
	pel_dir_id_pelicula_director,
	pel_dir_pelicula_id,
	pel_dir_director_id
	from tbl_pelicula_director
	where pel_dir_id_pelicula_director = @pel_dir_id_pelicula_director

END
GO

-----------ROL-----------------------

-- Description:	<sp para insertar un registro en la tabla rol>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_rol
( 
    @rol_nombre varchar(20),
    @rol_descripcion varchar(100)
)
AS
BEGIN
	insert into tbl_rol(rol_nombre,rol_descripcion)
	values (@rol_nombre,@rol_descripcion)
END
GO

-- Description:	<sp para eliminar un registro de rol>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_rol
	( 
	@rol_id_rol int
	)
AS
BEGIN
    
	delete from tbl_rol
	where rol_id_rol = @rol_id_rol

END
GO

-- Description:	<sp para actualizar un registro de rol >
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_rol
( 
    @rol_id_rol int,
	 @rol_nombre varchar(20),
    @rol_descripcion varchar(100)
)
AS
BEGIN
    
	update tbl_rol  set 	
	rol_nombre= @rol_nombre,
	rol_descripcion = @rol_descripcion
	where rol_id_rol = @rol_id_rol

END
GO

-- Description:	<sp para seleccionar todos los registros de la tabla rol>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_rol
AS
BEGIN

	select 
	rol_id_rol,
	rol_nombre,
	rol_descripcion
	from tbl_rol

END
GO

-- Description:	<sp para seleccionar todos los campos de un registro de rol por el id>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_rol 
	(
	@rol_id_rol int
	)
AS
BEGIN

	select 
	rol_id_rol,
	rol_nombre,
	rol_descripcion
	from tbl_rol
	where rol_id_rol = @rol_id_rol

END
GO

--------------Usuario---------
-- Description:	<sp para insertar un registro en la tabla usuario>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_usuario( 

@user_nombre varchar(35),
@user_correo varchar(50),
@user_contraseña varchar(75),
@user_rol_id int,
@user_foto varchar(50)
	)
AS
BEGIN
	insert into tbl_usuario(user_nombre,user_correo,user_contraseña,user_rol_id,user_foto)
	values (@user_nombre,@user_correo,@user_contraseña,@user_rol_id,@user_foto)
END
GO


-- Description:	<sp para eliminar un registro de usuario>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_usuario 
	( 
	@user_id_usuario int
	)
AS
BEGIN
    
	delete from tbl_usuario
	where user_id_usuario = @user_id_usuario

END
GO

-- Description:	<sp para actualizar un registro de usuario >
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_usuario
( 
@user_id_usuario int,
@user_nombre varchar(35),
@user_correo varchar(50),
@user_contraseña varchar(75),
@user_rol_id int,
@user_foto varchar(50)
)
AS
BEGIN
    
	update tbl_usuario  set 
	user_nombre = @user_nombre,
	user_correo= @user_correo,
	user_contraseña = @user_contraseña,
	user_rol_id = @user_rol_id,
	user_foto = @user_foto
	where user_id_usuario = @user_id_usuario

END
GO

-- Description:	<sp para seleccionar todos los registros de la tabla usuario>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_usuario
AS
BEGIN

	select 
	user_id_usuario,
   user_nombre,
   user_correo,
   user_contraseña ,
   user_rol_id,
   user_foto
	from tbl_usuario

END
GO

-- Description:	<sp para seleccionar todos los campos de un registro de usuario por el id>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_usuario
	(
	@user_id_usuario int
	)
AS
BEGIN

	select 
	user_id_usuario,
   user_nombre,
   user_correo,
   user_contraseña ,
   user_rol_id,
   user_foto
	from tbl_usuario
	where user_id_usuario = @user_id_usuario

END
GO

-------------SOCIO DIRECTOR-------------
-- Description:	<sp para insertar un registro en la tabla socio director>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_socio_director
( 
@soc_dir_codigo_socio varchar(12),
@soc_dir_director_id int
)
AS
BEGIN
    
	insert into tbl_socio_director(soc_dir_codigo_socio,soc_dir_director_id)
	values (@soc_dir_codigo_socio,@soc_dir_director_id)
END
GO

-- Description:	<sp para eliminar un registro de sociodirector>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_socio_director
	( 
	@soc_dir_id_socio_director int
	)
AS
BEGIN
    
	delete from tbl_socio_director
	where soc_dir_id_socio_director = @soc_dir_id_socio_director

END
GO

-- Description:	<sp para actualizar un registro socio director >
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_socio_director
	( 
   @soc_dir_id_socio_director int ,
   @soc_dir_codigo_socio varchar(12),
   @soc_dir_director_id int
	)
AS
BEGIN
    
	update tbl_socio_director  set 
	soc_dir_codigo_socio= @soc_dir_codigo_socio,
	soc_dir_director_id = @soc_dir_director_id
	where soc_dir_id_socio_director = @soc_dir_id_socio_director

END
GO

-- Description:	<sp para seleccionar todos los registros de la tabla sociodirector>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_socio_director
AS
BEGIN

	select 
    soc_dir_id_socio_director,
   soc_dir_codigo_socio,
   soc_dir_director_id
	from tbl_socio_director

END
GO

-- Description:	<sp para seleccionar todos los campos de un registro de socio director por el id>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_socio_director
	(
	@soc_dir_id_socio_director int
	)
AS
BEGIN

	select 
    soc_dir_id_socio_director,
   soc_dir_codigo_socio,
   soc_dir_director_id
	from tbl_socio_director
	where soc_dir_id_socio_director = @soc_dir_id_socio_director

END
GO

-----------SOCIO GENERO---------------

-- Description:	<sp para insertar un registro en la tabla socio genero>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_socio_genero
( 
@soc_gen_codigo_socio varchar(12),
@soc_gen_genero_id int
)
AS
BEGIN
    
	insert into tbl_socio_genero(soc_gen_codigo_socio,soc_gen_genero_id)
	values (@soc_gen_codigo_socio,@soc_gen_genero_id)
END
GO


-- Description:	<sp para eliminar un registro de socio genero>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_socio_genero
	( 
	@soc_gen_id_socio_genero int
	)
AS
BEGIN
    
	delete from tbl_socio_genero
	where soc_gen_id_socio_genero= @soc_gen_id_socio_genero

END
GO


-- Description:	<sp para actualizar un registro socio genero >
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_socio_genero
( 
@soc_gen_id_socio_genero int,
@soc_gen_codigo_socio varchar(12),
@soc_gen_genero_id int
)
AS
BEGIN
    
	update tbl_socio_genero  set 
	soc_gen_codigo_socio= @soc_gen_codigo_socio,
	soc_gen_genero_id = @soc_gen_genero_id
	where soc_gen_id_socio_genero = @soc_gen_id_socio_genero

END
GO


-- Description:	<sp para seleccionar todos los registros de la tabla sociodirector>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_socio_genero
AS
BEGIN

	select 
    soc_gen_id_socio_genero,
	soc_gen_codigo_socio,
    soc_gen_genero_id 
	from tbl_socio_genero

END
GO

-- Description:	<sp para seleccionar todos los campos de un registro de socio director por el id>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_socio_genero
	(
	@soc_gen_id_socio_genero int
	)
AS
BEGIN

	select 
   soc_gen_id_socio_genero,
	soc_gen_codigo_socio,
    soc_gen_genero_id 
	from tbl_socio_genero
	where  soc_gen_id_socio_genero = @soc_gen_id_socio_genero

END
GO

---------
--KRISLY
---------

--Tabla tbl_subtitulos_cinta
-- Description:	<sp para insertar un registro en la tbl_subtitulos_cinta>
-- ========01/11/22================Krisly=====================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_subtitulos_cinta 
( 
	@sub_numero_cinta varchar(13),
	@sub_idioma_id varchar (3)
)
AS
BEGIN
	insert into tbl_subtitulos_cinta(sub_numero_cinta,sub_idioma_id)
	values (@sub_numero_cinta,@sub_idioma_id)
END
GO

-- Description:	<sp para eliminar un registro de tbl_subtitulos_cinta>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_subtitulos_cinta 
( 
	@sub_subtitulos_cinta int
)
AS
BEGIN
    
	delete from tbl_subtitulos_cinta 
	where sub_subtitulos_cinta = @sub_subtitulos_cinta

END
GO

-- Description:	<sp para actualizar un registro de tbl_subtitulos_cinta >
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_subtitulos_cinta
( 
    @sub_subtitulos_cinta int,
	@sub_numero_cinta varchar(13),
	@sub_idioma_id varchar (3)
)
AS
BEGIN
    
	update tbl_subtitulos_cinta  set 	
	sub_numero_cinta= @sub_numero_cinta,
	sub_idioma_id = @sub_idioma_id	
	where sub_subtitulos_cinta = @sub_subtitulos_cinta

END
GO

-- Description:	<sp para seleccionar todos los registros de la tabla tbl_subtitulos_cinta>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_subtitulos_cinta
AS
BEGIN

	select 
	sub_subtitulos_cinta,
	sub_numero_cinta,
	sub_idioma_id
	from tbl_subtitulos_cinta

END
GO

-- Description:	<sp para seleccionar todos los campos de un registro de tbl_subtitulos_cinta por el id>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_subtitulos_cinta 
(
	@sub_subtitulos_cinta int
)
AS
BEGIN

	select 
	sub_subtitulos_cinta,
	sub_numero_cinta,
	sub_idioma_id
	from tbl_subtitulos_cinta
	where sub_subtitulos_cinta = @sub_subtitulos_cinta

END
GO

--Tabla tbl_pelicula_genero
-- Description:	<sp para insertar un registro en la tbl_pelicula_genero>
-- ========01/11/22================Krisly=====================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_pelicula_genero 
( 
	@pel_gen_genero_id int,
	@pel_gen_pelicula_id varchar (8)
)
AS
BEGIN
    
	insert into tbl_pelicula_genero(pel_gen_genero_id,pel_gen_pelicula_id)
	values (@pel_gen_genero_id,@pel_gen_pelicula_id)
END
GO


-- Description:	<sp para eliminar un registro de tbl_pelicula_genero>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_pelicula_genero 
( 
	@pel_gen_id_pelicula_genero int
)
AS
BEGIN
    
	delete from tbl_pelicula_genero 
	where pel_gen_id_pelicula_genero = @pel_gen_id_pelicula_genero

END
GO

-- Description:	<sp para actualizar un registro de tbl_pelicula_genero>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_pelicula_genero
( 
    @pel_gen_id_pelicula_genero int,
	@pel_gen_genero_id int,
	@pel_gen_pelicula_id varchar (8)	
)
AS
BEGIN
    
	update tbl_pelicula_genero  set 	
	pel_gen_genero_id= @pel_gen_genero_id,
	pel_gen_pelicula_id = @pel_gen_pelicula_id	
	where pel_gen_id_pelicula_genero = @pel_gen_id_pelicula_genero

END
GO
-- Description:	<sp para seleccionar todos los registros de la tabla tbl_pelicula_genero>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_pelicula_genero
AS
BEGIN

	select 
	pel_gen_id_pelicula_genero,
	pel_gen_genero_id,
	pel_gen_pelicula_id
	from tbl_pelicula_genero

END
GO

-- Description:	<sp para seleccionar todos los campos de un registro de tbl_pelicula_genero por el id>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_pelicula_genero 
(
@pel_gen_id_pelicula_genero int
)
AS
BEGIN

	select 
	pel_gen_id_pelicula_genero,
	pel_gen_genero_id,
	pel_gen_pelicula_id
	from tbl_pelicula_genero
	where pel_gen_id_pelicula_genero = @pel_gen_id_pelicula_genero

END
GO

--Tabla tbl_pelicula_actor
-- Description:	<sp para insertar un registro en la tbl_pelicula_actor>
-- ========01/11/22================Krisly=====================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_pelicula_actor 
( 
@pel_act_actor_id int,
@pel_act_tipo_actor varchar (10),
@pel_act_pelicula_id varchar (8)
)
AS
BEGIN
    
	insert into tbl_pelicula_actor(pel_act_actor_id ,pel_act_tipo_actor,pel_act_pelicula_id)
	values (@pel_act_actor_id,@pel_act_tipo_actor,@pel_act_pelicula_id)
END
GO

-- Description:	<sp para eliminar un registro de tbl_pelicula_actor>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_pelicula_actor 
( 
@pel_act_id_pelicula_actor int
)
AS
BEGIN
    
	delete from tbl_pelicula_actor 
	where pel_act_id_pelicula_actor = @pel_act_id_pelicula_actor

END
GO

-- Description:	<sp para actualizar un registro de tbl_pelicula_actor>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_pelicula_actor
( 
    @pel_act_id_pelicula_actor int,
	@pel_act_actor_id int,
	@pel_act_tipo_actor varchar (10),
	@pel_act_pelicula_id varchar (8)	
)
AS
BEGIN
    
	update tbl_pelicula_actor  set 	
	pel_act_actor_id= @pel_act_actor_id,
	pel_act_tipo_actor = @pel_act_tipo_actor,
	pel_act_pelicula_id= @pel_act_pelicula_id	
	where pel_act_id_pelicula_actor = @pel_act_id_pelicula_actor

END
GO

-- Description:	<sp para seleccionar todos los registros de la tabla tbl_pelicula_actor>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_pelicula_actor
AS
BEGIN

	select 
	pel_act_id_pelicula_actor,
	pel_act_actor_id,
	pel_act_tipo_actor,
	pel_act_pelicula_id
	from tbl_pelicula_actor

END
GO

-- Description:	<sp para seleccionar todos los campos de un registro de tbl_pelicula_actor por el id>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_pelicula_actor 
(
@pel_act_id_pelicula_actor int
)
AS
BEGIN

	select 
	pel_act_id_pelicula_actor,
	pel_act_actor_id,
	pel_act_tipo_actor,
	pel_act_pelicula_id
	from tbl_pelicula_actor
	where pel_act_id_pelicula_actor = @pel_act_id_pelicula_actor

END
GO

--Tabla tbl_pelicula_productora
-- Description:	<sp para insertar un registro en la tbl_pelicula_productora>
-- ========01/11/22================Krisly=====================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_pelicula_productora 
( 
	@pel_prod_productora_id int,
	@pel_prod_pelicula_id varchar (8)
)
AS
BEGIN
	insert into tbl_pelicula_productora(pel_prod_productora_id ,pel_prod_pelicula_id)
	values (@pel_prod_productora_id,@pel_prod_pelicula_id)
END
GO

-- Description:	<sp para eliminar un registro de tbl_pelicula_productora>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_pelicula_productora 
( 
@pel_prod_id_pelicula_productora int
)
AS
BEGIN
    
	delete from tbl_pelicula_productora
	where pel_prod_id_pelicula_productora = @pel_prod_id_pelicula_productora

END
GO

-- Description:	<sp para actualizar un registro de tbl_pelicula_productora>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_pelicula_productora
( 
    @pel_prod_id_pelicula_productora int,
	@pel_prod_productora_id int,
	@pel_prod_pelicula_id varchar (8)	
)
AS
BEGIN
    
	update tbl_pelicula_productora  set 	
	pel_prod_productora_id= @pel_prod_productora_id,
	pel_prod_pelicula_id = @pel_prod_pelicula_id	
	where pel_prod_id_pelicula_productora = @pel_prod_id_pelicula_productora

END
GO

-- Description:	<sp para seleccionar todos los registros de la tabla tbl_pelicula_productora>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_pelicula_productora
AS
BEGIN

	select 
	pel_prod_id_pelicula_productora,
	pel_prod_productora_id,
	pel_prod_pelicula_id
	from tbl_pelicula_productora

END
GO

-- Description:	<sp para seleccionar todos los campos de un registro de tbl_pelicula_productora por el id>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_pelicula_productora 
	(
	@pel_prod_id_pelicula_productora int
	)
AS
BEGIN

	select 
	pel_prod_id_pelicula_productora,
	pel_prod_productora_id,
	pel_prod_pelicula_id
	from tbl_pelicula_productora
	where pel_prod_id_pelicula_productora = @pel_prod_id_pelicula_productora

END
GO

--Tabla tbl_idioma
-- Description:	<sp para insertar un registro en la tbl_idioma>
-- ========01/11/22================Krisly=====================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_idioma 
( 
	@idm_nombre varchar (10)
)
AS
BEGIN
    
	insert into tbl_idioma(idm_nombre)
	values (@idm_nombre)
END
GO

-- Description:	<sp para eliminar un registro de tbl_idioma>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_idioma 
( 
@idm_id_idioma int
)
AS
BEGIN
    
	delete from tbl_idioma
	where idm_id_idioma = @idm_id_idioma

END
GO

-- Description:	<sp para actualizar un registro de tbl_idioma>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_idioma
( 
    @idm_id_idioma int,
	@idm_nombre varchar (10)
)
AS
BEGIN
    
	update tbl_idioma  set 
	idm_nombre= @idm_nombre
	where idm_id_idioma = @idm_id_idioma

END
GO

-- Description:	<sp para seleccionar todos los registros de la tabla tbl_idioma>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_idioma
AS
BEGIN

	select 
	idm_id_idioma,
	idm_nombre
	from tbl_idioma

END
GO

-- Description:	<sp para seleccionar todos los campos de un registro de tbl_idioma por el id>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_idioma
	(
	@idm_id_idioma int
	)
AS
BEGIN

	select 
	idm_id_idioma,
	idm_nombre
	from tbl_idioma
	where idm_id_idioma = @idm_id_idioma

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/10>
-- Description:	<sp para insertar un registro en la tabla tbl_socio_usuario>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_socio_usuario 
( 
	@soc_user_codigo_socio varchar(12),
	@soc_user_usuario_id int
)
AS
BEGIN
	insert into tbl_socio_usuario(soc_user_codigo_socio,soc_user_usuario_id) 
	values (@soc_user_codigo_socio,@soc_user_usuario_id)
END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/10>
-- Description:	<sp para actualizar un registro de la tabla tbl_socio_usuario>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_socio_usuario 
(
	@soc_user_id_socio_usuario int,
	@soc_user_codigo_socio varchar(12),
	@soc_user_usuario_id int
)
AS
BEGIN
    
	update tbl_socio_usuario set 
	soc_user_codigo_socio = @soc_user_codigo_socio,
	soc_user_usuario_id = @soc_user_usuario_id
	where @soc_user_id_socio_usuario = @soc_user_id_socio_usuario

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/10>
-- Description:	<sp para eliminar un registro de tbl_socio_usuario>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_socio_usuario
( 
	@soc_user_id_socio_usuario int
)
AS
BEGIN
    
	delete from tbl_socio_usuario
	where soc_user_id_socio_usuario = @soc_user_id_socio_usuario

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/10>
-- Description:	<sp para seleccionar todos los registros de la tabla tbl_empresa>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_socio_usuario
AS
BEGIN

	select 
	soc_user_id_socio_usuario,
	soc_user_codigo_socio,
	soc_user_usuario_id
	from tbl_socio_usuario

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/10>
-- Description:	<sp para seleccionar todos los campos de un registro de tbl_socio_usuario por el id>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_socio_usuario 
(
	@soc_user_id_socio_usuario int
)
AS
BEGIN

	select 
	soc_user_id_socio_usuario,
	soc_user_codigo_socio,
	soc_user_usuario_id
	from tbl_socio_usuario
	where soc_user_id_socio_usuario = @soc_user_id_socio_usuario

END
GO


---------------
-- SOFIA
---------------
-----Devolucion_Cinta-----

---Insert de devolucion_cinta----
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_devolucion_cinta 
( 
	@del_cin_numero_cinta varchar(13),
	@del_cin_codigo_socio varchar(12),
	@del_cin_fecha_prestamo datetime,
	@del_cin_fecha_devolucion datetime
)
AS
BEGIN
	insert into tbl_devolucion_cinta(del_cin_numero_cinta,del_cin_codigo_socio,del_cin_fecha_prestamo,del_cin_fecha_devolucion)
	values (@del_cin_numero_cinta,@del_cin_codigo_socio,@del_cin_fecha_prestamo,@del_cin_fecha_devolucion)
END
GO

---- delete de devolucion_cinta----
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_devolucion_cinta
( 
	@del_cin_id_devolucion_cinta int
)
AS
BEGIN
    
	delete from tbl_devolucion_cinta
	where del_cin_id_devolucion_cinta = @del_cin_id_devolucion_cinta

END
GO
---- update de devolucion_cinta----
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_devolucion_cinta
( 
	@del_cin_id_devolucion_cinta int,
  	@del_cin_numero_cinta varchar(13),
	@del_cin_codigo_socio varchar(12),
	@del_cin_fecha_prestamo datetime,
	@del_cin_fecha_devolucion datetime
)
AS
BEGIN
    
	update tbl_devolucion_cinta  set 
	del_cin_numero_cinta= @del_cin_numero_cinta,
	del_cin_codigo_socio = @del_cin_codigo_socio,
	del_cin_fecha_prestamo =@del_cin_fecha_prestamo,
	del_cin_fecha_devolucion =@del_cin_fecha_devolucion	
	where del_cin_id_devolucion_cinta = @del_cin_id_devolucion_cinta

END
GO

---- Select all de devolucion_cinta----
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_devolucion_cinta
AS
BEGIN

	select 
	del_cin_id_devolucion_cinta,
	del_cin_numero_cinta,
	del_cin_codigo_socio,
	del_cin_fecha_prestamo,
	del_cin_fecha_devolucion 
	from tbl_devolucion_cinta

END
GO

----select todos los campos de un registro-----
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_devolucion_cinta 
(
	@del_cin_id_devolucion_cinta int
)
AS
BEGIN

	select 
	del_cin_id_devolucion_cinta,
	del_cin_numero_cinta,
	del_cin_codigo_socio,
	del_cin_fecha_prestamo,
	del_cin_fecha_devolucion 
	from tbl_devolucion_cinta
	where del_cin_id_devolucion_cinta = @del_cin_id_devolucion_cinta

END
GO

----Registro_Prestamos----

----Insert de Registro_prestamos---

USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_registro_prestamos
( 
	@reg_pres_numero_cinta varchar(13),
	@reg_pres_codigo_socio varchar(12),
	@reg_pres_fecha_prestamo datetime,
	@reg_pres_fecha_devolucion datetime
)
AS
BEGIN    
	insert into tbl_registro_prestamos(reg_pres_numero_cinta,reg_pres_codigo_socio,reg_pres_fecha_prestamo,reg_pres_fecha_devolucion)
	values (@reg_pres_numero_cinta,@reg_pres_codigo_socio,@reg_pres_fecha_prestamo,@reg_pres_fecha_devolucion)
END
GO
---delete de registro_prestamo----

USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_registro_prestamos
( 
	@reg_pres_id_registro_prestamos int
)
AS
BEGIN
    
	delete from tbl_registro_prestamos
	where reg_pres_id_registro_prestamos = @reg_pres_id_registro_prestamos

END
GO

---- Actualizar registro_prestamos---
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_registro_prestamos
( 
	@reg_pres_id_registro_prestamos int,
    @reg_pres_numero_cinta varchar(13),
	@reg_pres_codigo_socio varchar(12),
	@reg_pres_fecha_prestamo datetime,
	@reg_pres_fecha_devolucion datetime
)
AS
BEGIN
    
	update tbl_registro_prestamos set 
	reg_pres_numero_cinta= @reg_pres_numero_cinta,
	reg_pres_codigo_socio = @reg_pres_codigo_socio,
	reg_pres_fecha_prestamo = @reg_pres_fecha_prestamo,
	reg_pres_fecha_devolucion = @reg_pres_fecha_devolucion
	where reg_pres_id_registro_prestamos = @reg_pres_id_registro_prestamos

END
GO

----select todos los registros de la tabla----
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_registro_prestamos
AS
BEGIN

	select 
	reg_pres_id_registro_prestamos,
	reg_pres_numero_cinta,
	reg_pres_codigo_socio,
	reg_pres_fecha_prestamo,
	reg_pres_fecha_devolucion
	from tbl_registro_prestamos

END
GO

---- select todos los campos de un registro----
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_registro_prestamos 
(
	@reg_pres_id_registro_prestamos int
)
AS
BEGIN

	select 
	reg_pres_id_registro_prestamos,
	reg_pres_numero_cinta,
	reg_pres_codigo_socio,
	reg_pres_fecha_prestamo,
	reg_pres_fecha_devolucion
	from tbl_registro_prestamos
	where reg_pres_id_registro_prestamos = @reg_pres_id_registro_prestamos

END
GO

----- Lista_espera----
----Insert un registro-----

USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_lista_espera
( 
	@list_codigo_socio varchar(12),
	@list_pelicula_id varchar(8),
	@list_fecha_solicitud datetime
)
AS
BEGIN
    
	insert into tbl_lista_espera(list_codigo_socio,list_pelicula_id,list_fecha_solicitud)
	values (@list_codigo_socio,@list_pelicula_id,@list_fecha_solicitud)
END
GO

-----Delete un registro-----
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_lista_espera
( 
	@list_id_lista_espera int
)
AS
BEGIN
    
	delete from tbl_lista_espera
	where list_id_lista_espera = @list_id_lista_espera

END
GO

----Actualizar los registros------
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_lista_espera
( 
	@list_id_lista_espera int,
	@list_codigo_socio varchar(12),
	@list_pelicula_id varchar(8),
	@list_fecha_solicitud datetime,
	@list_fecha_disponibilidad datetime,
	@list_estado varchar(10)
)
AS
BEGIN
    
	update tbl_lista_espera set 
	list_codigo_socio = @list_codigo_socio,
	list_pelicula_id= @list_pelicula_id,
	list_fecha_solicitud = @list_fecha_solicitud,
	list_fecha_disponibilidad = @list_fecha_disponibilidad,
	list_estado = @list_estado
    where list_id_lista_espera  = @list_id_lista_espera

END
GO

------select todos los registros de las tablas----
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_lista_espera
AS
BEGIN

	select 
	list_id_lista_espera,
	list_codigo_socio,
	list_pelicula_id,
	list_fecha_solicitud,
	list_fecha_disponibilidad,
	list_estado
	from tbl_lista_espera

END
GO

-----select todos los campos de los registros-----
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_lista_espera
(
	@list_id_lista_espera int
)
AS
BEGIN

	select 
	list_id_lista_espera,
	list_codigo_socio,
	list_pelicula_id,
	list_fecha_solicitud,
	list_fecha_disponibilidad,
	list_estado
	from tbl_lista_espera
	where list_id_lista_espera = @list_id_lista_espera

END
GO

-----Llamda-----
----Insert de los registros----
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_llamada
( 
	@lla_id_llamada int,
	@lla_codigo_socio varchar(12),
	@lla_pelicula_id varchar(8)
)
AS
BEGIN
    
	insert into tbl_llamada(lla_codigo_socio,lla_pelicula_id)
	values (@lla_codigo_socio,@lla_pelicula_id)
END
GO

------delete de los registros-----
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_llamada
( 
	@lla_id_llamada  int
)
AS
BEGIN
    
	delete from tbl_llamada
	where lla_id_llamada = @lla_id_llamada

END
GO

------Actualizar los registros-----
USE VIDEOTEC
GO
CREATE PROCEDURE sp_update_tbl_llamada
( 
	@lla_id_llamada int,
	@lla_codigo_socio varchar(12),
	@lla_pelicula_id varchar(8)
)
AS
BEGIN
    
	update tbl_llamada set 
	lla_codigo_socio= @lla_codigo_socio,
	lla_pelicula_id = @lla_pelicula_id	
	where lla_id_llamada = @lla_id_llamada

END
GO

------select todos los registros------
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_llamada
AS
BEGIN

	select 
	lla_id_llamada,
	lla_codigo_socio,
	lla_pelicula_id
	from tbl_llamada

END
GO

----select para todos los campos registrados----
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_llamada
(
	@lla_id_llamada int
)
AS
BEGIN

	select 
	lla_id_llamada,
    lla_codigo_socio,
	lla_pelicula_id
	from tbl_llamada
	where lla_id_llamada = @lla_id_llamada

END
GO

------socio_actor----
----insert de un registro---
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_tbl_socio_actor
( 
	@soc_act_codigo_socio varchar(12),
	@soc_act_actor_id int
)
AS
BEGIN
    
	insert into tbl_socio_actor(soc_act_codigo_socio,soc_act_actor_id)
	values (@soc_act_codigo_socio,@soc_act_actor_id)
END
GO

-----delete de los registros----
USE VIDEOTEC
GO
CREATE PROCEDURE sp_delete_tbl_socio_actor
( 
	@soc_act_id_socio_actor int
)
AS
BEGIN
    
	delete from tbl_socio_actor
	where soc_act_id_socio_actor= @soc_act_id_socio_actor

END
GO

-----Actualizar los registros-----
USE VIDEOTEC
GO
CREATE
PROCEDURE sp_update_tbl_socio_actor
( 
	@soc_act_id_socio_actor int,
	@soc_act_codigo_socio varchar(12),
	@soc_act_actor_id int 
)
AS
BEGIN
    
	update tbl_socio_actor  set 
	soc_act_codigo_socio= @soc_act_codigo_socio,
	soc_act_actor_id = @soc_act_actor_id	
	where soc_act_id_socio_actor= @soc_act_id_socio_actor

END
GO

-----select todos los registros----
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_all_tbl_socio_actor
AS
BEGIN

	select 
    soc_act_id_socio_actor,
	soc_act_codigo_socio,
    soc_act_actor_id 
	from tbl_socio_actor

END
GO

------select todos los campos de registro----
USE VIDEOTEC
GO
CREATE PROCEDURE sp_select_tbl_socio_actor
(
	@soc_act_id_socio_actor int
)
AS
BEGIN

	select 
	soc_act_id_socio_actor,
	soc_act_codigo_socio,
    soc_act_actor_id 
	from tbl_socio_actor
	where  soc_act_id_socio_actor= @soc_act_id_socio_actor

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/10>
-- Description:	<sp para insertar un registro en las tablas tbl_socio, tbl_usuario, tbl_socio_usuario>
-- =============================================
USE VIDEOTEC
GO
CREATE PROCEDURE sp_insert_socio
( 
	@soc_cedula varchar(9),
	@soc_nombre varchar(35),
	@soc_apellido1 varchar(40),
	@soc_apellido2 varchar(40),
	@soc_correo varchar(50),
	@soc_telefono varchar(8),
	@soc_codigo_postal varchar(5),
	@soc_direccion_exacta varchar(100),
	@soc_genero varchar(10),
	@soc_fecha_nacimiento date,
	@soc_foto_perfil varchar(50),
	@user_contraseña varchar(75),	
	@actor int,
	@director int,
	@genero int
)
AS
BEGIN

	declare @codigo_socio varchar(12), @soc_user_usuario_id int

	exec sp_insert_tbl_socio @soc_cedula,@soc_nombre,@soc_apellido1,@soc_apellido2,@soc_correo,@soc_telefono,@soc_codigo_postal,@soc_direccion_exacta,@soc_genero,@soc_fecha_nacimiento,@soc_foto_perfil	
	set @codigo_socio = (select bit_soc_socio from tbl_bitacora_socio where (bit_soc_fecha_accion = (select max(bit_soc_fecha_accion) from tbl_bitacora_socio)) and (bit_soc_accion = 'INSERT'))

	exec sp_insert_tbl_usuario @soc_cedula,@soc_correo,@user_contraseña,3,@soc_foto_perfil
	set @soc_user_usuario_id = (select bit_user_usuario_id from tbl_bitacora_usuario where bit_user_fecha_accion = (select max(bit_user_fecha_accion) from tbl_bitacora_usuario))

	exec sp_insert_tbl_socio_usuario @codigo_socio,@soc_user_usuario_id

	exec sp_insert_tbl_socio_actor @codigo_socio,@actor

	exec sp_insert_tbl_socio_director @codigo_socio, @director

	exec sp_insert_tbl_socio_genero @codigo_socio, @genero

END
GO

use VIDEOTEC
go
create proc sp_insert_pelicula 
(
	@pel_titulo varchar(100),
	@pel_sinopsis text,
	@pel_clasificacion varchar(5),
	@pel_duracion time,
	@pel_año_publicacion int,
	@pel_pais varchar(20),
	@pel_precio money,
	@pel_portada varchar(100),
	@pel_trailer varchar(100),
	@pel_prod_productora_id int,
	@pel_dir_director_id int,
	@pel_act_actor_id int,
	@pel_gen_genero_id int
)
as
begin

	declare @pelicula_id varchar (8), @pel_act_tipo_actor varchar(10)
	set @pel_act_tipo_actor = 'Principal'

	exec sp_insert_tbl_pelicula @pel_titulo,@pel_sinopsis,@pel_clasificacion,@pel_duracion,@pel_año_publicacion,@pel_pais,@pel_precio,@pel_portada,@pel_trailer
	
	set @pelicula_id = (select top 1 bit_pel_pelicula from tbl_bitacora_pelicula where (bit_pel_accion = 'INSERT') order by bit_pel_fecha_accion desc)

	exec sp_insert_tbl_pelicula_genero @pel_gen_genero_id,@pelicula_id
	exec sp_insert_tbl_pelicula_actor @pel_act_actor_id,@pel_act_tipo_actor,@pelicula_id
	exec sp_insert_tbl_pelicula_productora @pel_prod_productora_id,@pelicula_id
	exec sp_insert_tbl_pelicula_director @pelicula_id,@pel_dir_director_id
end
go

exec sp_insert_pelicula 'Interstellar','En 2067, la destrucción de las cosechas en la Tierra ha hecho que la agricultura sea cada vez más difícil y se vea amenazada la supervivencia de la humanidad. Joseph Cooper, viudo, exingeniero y piloto de la NASA, dirige una granja con su suegro Donald, su hijo Tom y su hija Murph, quien cree que su habitación está embrujada por un poltergeist. Cuando aparecen inexplicablemente extraños patrones de polvo en el suelo de la habitación de Murph, Cooper se da cuenta de que la gravedad está detrás de su formación, no un "fantasma". Interpreta el patrón como un conjunto de coordenadas geográficas formadas en código binario. Cooper y Murph siguen las coordenadas a una instalación secreta de la NASA, donde se encuentran con el exprofesor de Cooper, el doctor Brand.',
'PG-13','02:49',2014,'Estado Unidos',$10,'NULL','NULL',4,3,5,6

-- =========================================================
--					PREFERENCIAS DE SOCIO
-- =========================================================

--GENERO FAVS
create proc sp_preferencias_socio_generos
(
	@codigo_socio varchar(12)
)
as
BEGIN
	select gen_id_genero,gen_nombre, gen_descripcion, gen_imagen
	from tbl_genero_pelicula inner join tbl_socio_genero
	on gen_id_genero = soc_gen_genero_id
	where soc_gen_codigo_socio = @codigo_socio
END
GO

exec sp_preferencias_socio_generos '002A0B974FD9'

--ACTORES FAVS
create proc sp_preferencias_socio_actores
(
	@codigo_socio varchar(12)
)
as
BEGIN
	select act_id_actor,act_nombre,act_biografia,act_imagen
	from tbl_actor inner join tbl_socio_actor
	on act_id_actor = soc_act_actor_id
	where soc_act_codigo_socio = @codigo_socio
END
GO

exec sp_preferencias_socio_actores '002A0B974FD9'

--DIRECTORES FAVS
create proc sp_preferencias_socio_directores
(
	@codigo_socio varchar(12)
)
as
BEGIN
	select dir_id_director,dir_nombre, dir_biografia,dir_imagen
	from tbl_director inner join tbl_socio_director
	on dir_id_director = soc_dir_id_socio_director
	where soc_dir_codigo_socio = @codigo_socio
END
GO

exec sp_preferencias_socio_directores '002A0B974FD9'

USE VIDEOTEC
GO
create proc sp_actores_principales_pelicula
(
	@id_pelicula varchar(8)
)
as
BEGIN
	select act_id_actor,act_nombre,act_imagen 
	from tbl_actor inner join tbl_pelicula_actor
	on act_id_actor = pel_act_actor_id
	where (pel_act_tipo_actor = 'Principal') and (pel_act_pelicula_id = @id_pelicula)
END

exec sp_actores_principales_pelicula 'FAA82750'
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
USE VIDEOTEC
GO
create proc sp_actores_secundarios_pelicula
(
	@id_pelicula varchar(8)
)
as
BEGIN
	select act_id_actor,act_nombre,act_imagen 
	from tbl_actor inner join tbl_pelicula_actor
	on act_id_actor = pel_act_actor_id
	where (pel_act_tipo_actor = 'Secundario') and (pel_act_pelicula_id = @id_pelicula)
END

exec sp_actores_secundarios_pelicula '34F65B6D'

USE VIDEOTEC
GO
create proc sp_actores_pelicula
(
	@id_pelicula varchar(8)
)
as
BEGIN
	select act_id_actor,act_nombre,pel_act_tipo_actor,act_imagen 
	from tbl_actor inner join tbl_pelicula_actor
	on act_id_actor = pel_act_actor_id
	where (pel_act_pelicula_id = @id_pelicula)
END

exec sp_actores_pelicula '34F65B6D'

Use VIDEOTEC
go
create proc sp_prestamo_factura 
(
	@pres_id_prestamo int
) 
AS
BEGIN
	declare
	@pres_codigo_socio varchar(12),
	@pres_precio_total money,

	@det_pres_id_detalle_prestamo int,
	@det_pres_numero_cinta varchar(13),
	@det_pres_sub_total money,
	@nombre_socio varchar(200)

	set @pres_codigo_socio = (select pres_codigo_socio from tbl_prestamo where pres_id_prestamo = @pres_id_prestamo)
	set @pres_precio_total = (select pres_precio_total from tbl_prestamo where pres_id_prestamo = @pres_id_prestamo)
	set @nombre_socio = (select soc_nombre_completo from view_tbl_socio where soc_codigo_socio = @pres_codigo_socio)
	
	declare @fecha_prestamo datetime, @fechadevolucion datetime
	set @fecha_prestamo = (select pres_fecha_prestamo from tbl_prestamo where pres_id_prestamo = @pres_id_prestamo)
	set @fechadevolucion = (select pres_fecha_devolucion from tbl_prestamo where pres_id_prestamo = @pres_id_prestamo)

	declare factura cursor for
	select det_pres_id_detalle_prestamo,det_pres_numero_cinta,det_pres_sub_total from tbl_detalle_prestamo
	where det_pres_prestamo_id = @pres_id_prestamo
	
	open factura
	fetch factura into @det_pres_id_detalle_prestamo,@det_pres_numero_cinta,@det_pres_sub_total

	print '||||||||||||| VIDEOTEC ||||||||||||||'
	print 'ID ' + convert(varchar,@pres_id_prestamo)
	print 'Fechas           ' + convert(varchar,@fecha_prestamo,100)
	print '                 '+convert(varchar,@fechadevolucion,100)
	print 'Titular'
	print @nombre_socio
	print('---- Detalles ----------------------')
	print '#        NUMERO CINTA       SUBTOTAL'
	while(@@FETCH_STATUS = 0)
	begin
		print (convert(varchar,@det_pres_id_detalle_prestamo) + '     ' + @det_pres_numero_cinta + '      ' + convert(varchar,@det_pres_sub_total))
		fetch factura into @det_pres_id_detalle_prestamo,@det_pres_numero_cinta,@det_pres_sub_total
	end

	print('------------------------------------')
	print('Total:                      ' + convert(varchar,@pres_precio_total))
	print '||||||||||||||||||||||||||||||||||||'
	close factura
	deallocate factura
END
GO

exec sp_prestamo_factura 149

-- VER PLAZO DE PRESTAMOS
create proc sp_plazo_prestamo as
	select reg_pres_id_registro_prestamos as [ID],
	convert(varchar,reg_pres_fecha_prestamo,100) as [Fecha prestamo],
	convert(varchar,reg_pres_fecha_devolucion,100) as [Fecha devolucion],
	DATEDIFF(DAY,reg_pres_fecha_prestamo,reg_pres_fecha_devolucion) as [Plazo de Dias]
	from tbl_registro_prestamos
	order by [Fecha prestamo]
go

-- TABLA BITACORA GENERAL
create view bitacora_tablas as
select bit_act_id_bitacora_actor as [BitacoraID],bit_act_usuario as [Usuario],Tabla = 'tbl_actor',convert(varchar,bit_act_actor) as [RegistroID],bit_act_accion as [Accion],bit_act_fecha_accion as [FechaAccion] from tbl_bitacora_actor
union
select bit_carr_id_bitacora_carrito_compra,bit_carr_usuario,'tbl_carrito_compra',CONVERT(varchar,bit_carr_carrito_compra),bit_carr_accion,bit_carr_fecha_accion from tbl_bitacora_carrito_compra
union
select bit_cin_id_bitacora_cinta,bit_cin_usuario,'tbl_cinta',bit_cin_cinta,bit_cin_accion,bit_cin_fecha_accion from tbl_bitacora_cinta
union
select bit_clasf_id_bitacora_clasificacion,bit_clasf_usuario,'tbl_clasificacion',bit_clasf_clasificacion,bit_clasf_accion,bit_clasf_fecha_accion from tbl_bitacora_clasificacion
union
select bit_det_pres_id_bitacora_detalle_prestamo,bit_det_pres_usuario,'tbl_detalle_prestamo',convert(varchar,bit_det_pres_detalle_prestamo),bit_det_pres_accion,bit_det_pres_fecha_accion from tbl_bitacora_detalle_prestamo
union
select bit_del_cin_id_bitacora_devolucion_cinta,bit_del_cin_usuario,'tbl_devolucion_cinta',convert(varchar,bit_del_cin_devolucion_cinta),bit_del_cin_accion,bit_del_cin_fecha_accion from tbl_bitacora_devolucion_cinta
union
select bit_dir_id_bitacora_director,bit_dir_usuario,'tbl_director',CONVERT(varchar,bit_dir_director),bit_dir_accion,bit_dir_fecha_accion from tbl_bitacora_director
union
select bit_emp_id_bitacora_empresa,bit_emp_usuario,'tbl_empresa',convert(varchar,bit_emp_empresa),bit_emp_accion,bit_emp_fecha_accion from tbl_bitacora_empresa
union
select bit_gen_id_bitacora_genero_pelicula,bit_gen_usuario,'tbl_genero_pelicula',convert(varchar,bit_gen_genero_pelicula),bit_gen_accion,bit_gen_fecha_accion from tbl_bitacora_genero_pelicula
union
select bit_idm_id_bitacora_idioma,bit_idm_usuario,'tbl_idioma',convert(varchar,bit_idm_idioma_id),bit_idm_accion,bit_idm_fecha_accion from tbl_bitacora_idioma
union
select bit_list_id_bitacora_lista_espera,bit_list_usuario,'tbl_lista_espera',convert(varchar,bit_list_lista_espera),bit_list_accion,bit_list_fecha_accion from tbl_bitacora_lista_espera
union
select bit_lla_id_bitacora_llamada,bit_lla_usuario,'tbl_llamada',convert(varchar,bit_lla_llamada),bit_lla_accion,bit_lla_fecha_accion from tbl_bitacora_llamada
union
select bit_pel_id_bitacora_pelicula,bit_pel_usuario,'tbl_pelicula',bit_pel_pelicula,bit_pel_accion,bit_pel_fecha_accion from tbl_bitacora_pelicula
union
select bit_pel_act_id_bitacora_pelicula_actor,bit_pel_act_usuario,'tbl_pelicula_actor',convert(varchar,bit_pel_act_pelicula_actor),bit_pel_act_accion,bit_pel_act_fecha_accion from tbl_bitacora_pelicula_actor
union
select bit_pel_dir_id_bitacora_pelicula_director,bit_pel_dir_usuario,'tbl_pelicula_director',convert(varchar,bit_pel_dir_pelicula_director),bit_pel_dir_accion,bit_pel_dir_fecha_accion from tbl_bitacora_pelicula_director
union
select bit_pel_gen_id_bitacora_pelicula_genero,bit_pel_gen_usuario,'tbl_pelicula_genero',convert(varchar,bit_pel_gen_pelicula_genero),bit_pel_gen_accion,bit_pel_gen_fecha_accion from tbl_bitacora_pelicula_genero
union
select bit_pel_prod_id_bitacora_pelicula_productora,bit_pel_prod_usuario,'tbl_pelicula_productora',convert(varchar,bit_pel_prod_pelicula_productora),bit_pel_prod_accion,bit_pel_prod_fecha_accion from tbl_bitacora_pelicula_productora
union
select bit_pres_id_bitacora_prestamo,bit_pres_usuario,'tbl_prestamo',convert(varchar,bit_pres_prestamo),bit_pres_accion,bit_pres_fecha_accion from tbl_bitacora_prestamo
union
select bit_prod_id_bitacora_productora,bit_prod_usuario,'tbl_productora',convert(varchar,bit_prod_productora),bit_prod_accion,bit_prod_fecha_accion from tbl_bitacora_productora
union
select bit_reg_cin_id_bitacora_devolucion_cinta,bit_reg_cin_usuario,'tbl_devolucion_cinta',convert(varchar,bit_reg_cin_registro_prestamos),bit_reg_cin_accion,bit_reg_cin_fecha_accion from tbl_bitacora_registro_prestamos
union
select bit_rol_id_bitacora_rol,bit_rol_usuario,'tbl_rol',convert(varchar,bit_rol_rol),bit_rol_accion,bit_rol_fecha_accion from tbl_bitacora_rol
union
select bit_soc_id_bitacora_socio,bit_soc_usuario,'tbl_socio',bit_soc_socio,bit_soc_accion,bit_soc_fecha_accion from tbl_bitacora_socio
union
select bit_soc_act_id_bitacora_socio_actor,bit_soc_act_usuario,'tbl_socio_actor',convert(varchar,bit_soc_act_socio_actor),bit_soc_act_accion,bit_soc_act_fecha_accion from tbl_bitacora_socio_actor
union
select bit_soc_dir_id_bitacora_socio_director,bit_soc_dir_usuario,'tbl_socio_director',convert(varchar,bit_soc_dir_socio_director),bit_soc_dir_accion,bit_soc_dir_fecha_accion from tbl_bitacora_socio_director
union
select bit_soc_gen_id_bitacora_socio_genero,bit_soc_gen_usuario,'tbl_socio_genero',convert(varchar,bit_soc_gen_socio_genero),bit_soc_gen_accion,bit_soc_gen_fecha_accion from tbl_bitacora_socio_genero
union
select bit_sub_id_bitacora_subtitulos_cinta,bit_sub_usuario,'tbl_subtitulos_cinta',convert(varchar,bit_sub_subtitulos_cinta),bit_sub_accion,bit_sub_fecha_accion from tbl_bitacora_subtitulos_cinta
union
select bit_user_id_bitacora_usuario,bit_user_usuario,'tbl_usuario',convert(varchar,bit_user_usuario_id),bit_user_accion,bit_user_fecha_accion from tbl_bitacora_usuario
with check option
go

create proc sp_bitacora as
BEGIN
	select * from bitacora_tablas
	order by Tabla
END
GO

create proc sp_ganancias_por_mes as
begin
	select Mes,sum(Ganancias) as Ganancias from (select sum(pres_precio_total) as [Ganancias], datename(MONTH,pres_fecha_prestamo) as [Mes] from tbl_prestamo
	group by pres_fecha_prestamo) as tbl
	group by Mes
	order by Ganancias desc
end
go

create proc sp_ver_cantidad_detalles as
begin
	select det_pres_prestamo_id as [PrestamoID],
	count(det_pres_prestamo_id) as [DetallesPrestamo]
	from tbl_detalle_prestamo group by det_pres_prestamo_id
	order by [DetallesPrestamo] desc
end
go

create proc sp_ver_peliculas_por_clasificacion
(
	@pel_clasificacion varchar(5)
)
as
begin
	select pel_id_pelicula,
		pel_titulo,
		pel_sinopsis,
		pel_duracion,
		pel_año_publicacion,
		pel_pais,
		pel_portada,
		pel_trailer
	from tbl_pelicula
	where pel_clasificacion = @pel_clasificacion
end
GO

create proc sp_num_peliculas_clasificacion
as
begin
	select pel_clasificacion as [Clasificacion],
	count(pel_id_pelicula) as [CantidadPeliculas]
	from tbl_pelicula
	group by pel_clasificacion
	order by [CantidadPeliculas] desc
end
GO

sp_ver_peliculas_por_genero 'PG-13'

create proc sp_peliculas_actor
(
	@actor int
)
as
begin
	select pel_id_pelicula,
		pel_titulo,
		pel_sinopsis,
		pel_clasificacion,
		pel_duracion,
		pel_año_publicacion,
		pel_pais,
		pel_portada,
		pel_trailer
	from tbl_pelicula inner join tbl_pelicula_actor
	on pel_id_pelicula = pel_act_pelicula_id
	inner join tbl_actor
	on act_id_actor = pel_act_actor_id
	where act_id_actor = @actor
end
go

create proc sp_peliculas_director
(
	@director int
)
as
begin
	select pel_id_pelicula,
		pel_titulo,
		pel_sinopsis,
		pel_clasificacion,
		pel_duracion,
		pel_año_publicacion,
		pel_pais,
		pel_portada,
		pel_trailer
	from tbl_pelicula inner join tbl_pelicula_director
	on pel_id_pelicula = pel_dir_pelicula_id
	inner join tbl_director
	on dir_id_director = pel_dir_id_pelicula_director
	where dir_id_director = @director
end
go

create proc sp_ver_peliculas_por_genero
(
	@genero int
)
as
begin
	select pel_id_pelicula,
		pel_titulo,
		pel_sinopsis,
		pel_duracion,
		pel_año_publicacion,
		pel_pais,
		pel_portada,
		pel_trailer
	from tbl_pelicula inner join tbl_pelicula_genero
	on pel_id_pelicula = pel_gen_pelicula_id
	where pel_gen_genero_id = @genero
end
GO

create proc sp_peliculas_productora
(
	@productora int
)
as
begin
	select pel_id_pelicula,
		pel_titulo,
		pel_sinopsis,
		pel_clasificacion,
		pel_duracion,
		pel_año_publicacion,
		pel_pais,
		pel_portada,
		pel_trailer
	from tbl_pelicula inner join tbl_pelicula_productora
	on pel_id_pelicula = pel_prod_pelicula_id
	where pel_prod_productora_id = @productora
end

USE VIDEOTEC
GO
CREATE PROCEDURE sp_peliculas_en_lista_espera
AS
BEGIN

	select 
	list_id_lista_espera,
	list_codigo_socio,
	list_pelicula_id,
	list_fecha_solicitud,
	list_fecha_disponibilidad,
	list_estado
	from tbl_lista_espera
	where list_estado = 'En espera'
END
GO