--GO
USE DB_PROYECTO

GO
create proc sp_obtenerCategoria
as
begin
 select * from CATEGORIA
end


go


--PROCEDIMIENTO PARA GUARDAR CATEGORIA
CREATE PROC sp_RegistrarCategoria(
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)

		insert into CATEGORIA(Descripcion) values (
		@Descripcion
		)
	ELSE
		SET @Resultado = 0
	
end

go

--PROCEDIMIENTO PARA MODIFICAR CATEGORIA
create procedure sp_ModificarCategoria(
@IdCategoria int,
@Descripcion varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion =@Descripcion and IdCategoria != @IdCategoria)
		
		update CATEGORIA set 
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdCategoria = @IdCategoria
	ELSE
		SET @Resultado = 0

end


GO
create proc sp_obtenerMarca
as
begin
 select * from MARCA
end

go





--PROCEDIMIENTO PARA GUARDAR MARCA
CREATE PROC sp_RegistrarMarca(
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion = @Descripcion)

		insert into MARCA(Descripcion) values (
		@Descripcion
		)
	ELSE
		SET @Resultado = 0
	
end

go

--PROCEDIMIENTO PARA MODIFICAR MARCA
create procedure sp_ModificarMarca(
@IdMarca int,
@Descripcion varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion =@Descripcion and IdMarca != @IdMarca)
		
		update MARCA set 
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdMarca = @IdMarca
	ELSE
		SET @Resultado = 0

end

GO
create proc sp_obtenerProducto
as
begin
 select p.*,m.Descripcion[DescripcionMarca],c.Descripcion[DescripcionCategoria] from PRODUCTO p
 inner join marca m on m.IdMarca = p.IdMarca
 inner join CATEGORIA c on c.IdCategoria = p.IdCategoria

end

go







create proc sp_registrarProducto(
@Nombre varchar(500),
@Descripcion varchar(500),
@IdMarca int,
@IdCategoria int,
@Precio decimal(10,2),
@Stock int,
@RutaImagen varchar(500),
@Resultado int output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Descripcion = @Descripcion)
	begin
		insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values (
		@Nombre,@Descripcion,@IdMarca,@IdCategoria,@Precio,@Stock,@RutaImagen)

		SET @Resultado = scope_identity()
	end
end

go














create proc sp_editarProducto(
@IdProducto int,
@Nombre varchar(500),
@Descripcion varchar(500),
@IdMarca int,
@IdCategoria int,
@Precio decimal(10,2),
@Stock int,
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Descripcion = @Descripcion and IdProducto != @IdProducto)
	begin
		update PRODUCTO set 
		Nombre = @Nombre,
		Descripcion = @Descripcion,
		IdMarca = @IdMarca,
		IdCategoria = @IdCategoria,
		Precio =@Precio ,
		Stock =@Stock ,
		Activo = @Activo where IdProducto = @IdProducto

		SET @Resultado =1
	end
end

go
create proc sp_actualizarRutaImagen(
@IdProducto int,
@RutaImagen varchar(500)
)
as
begin
	update PRODUCTO set RutaImagen = @RutaImagen where IdProducto = @IdProducto
end

go

create proc sp_obtenerUsuario(
@Correo varchar(100),
@Contrasena varchar(100)
)
as
begin
	IF EXISTS (SELECT * FROM usuario WHERE correo = @Correo and contrasena = @Contrasena)
	begin
		SELECT IdUsuario,Nombres,Apellidos,Correo,Contrasena,EsAdministrador FROM usuario WHERE correo = @Correo and contrasena = @Contrasena
	end
end


go

create proc sp_registrarUsuario(
@Nombres varchar(100),
@Apellidos varchar(100),
@Correo varchar(100),
@Contrasena varchar(100),
@EsAdministrador bit,
@Resultado int output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo)
	begin
		insert into USUARIO(Nombres,Apellidos,Correo,Contrasena,EsAdministrador) values
		(@Nombres,@Apellidos,@Correo,@Contrasena,@EsAdministrador)

		SET @Resultado = scope_identity()
	end
end
go

create proc sp_InsertarCarrito(
@IdUsuario int,
@IdProducto int,
@Resultado int output
)
as
begin
	set @Resultado = 0
	if not exists (select * from CARRITO where IdProducto = @IdProducto and IdUsuario = @IdUsuario)
	begin
		update PRODUCTO set Stock = Stock -1 where IdProducto = @IdProducto
		insert into CARRITO(IdUsuario,IdProducto) values ( @IdUsuario,@IdProducto)
		set @Resultado = 1
	end
	
end

go

create proc sp_ObtenerCarrito(
@IdUsuario int
)
as
begin
	select c.IdCarrito, p.IdProducto,m.Descripcion,p.Nombre,p.Precio,p.RutaImagen from carrito c
	inner join PRODUCTO p on p.IdProducto = c.IdProducto
	inner join MARCA m on m.IdMarca = p.IdMarca
	where c.IdUsuario = @IdUsuario
end

go


create proc sp_registrarCompra(
@IdUsuario int,
@TotalProducto int,
@Total decimal(10,2),
@Contacto varchar(100),
@Telefono varchar(100),
@Direccion varchar(100),
@IdDistrito varchar(10),
@QueryDetalleCompra nvarchar(max),
@Resultado bit output
)
as
begin
	begin try
		SET @Resultado = 0
		begin transaction
		
		declare @idcompra int = 0
		insert into COMPRA(IdUsuario,TotalProducto,Total,Contacto,Telefono,Direccion,IdDistrito) values
		(@IdUsuario,@TotalProducto,@Total,@Contacto,@Telefono,@Direccion,@IdDistrito)

		set @idcompra = scope_identity()

		set @QueryDetalleCompra = replace(@QueryDetalleCompra,'¡idcompra!',@idcompra)

		EXECUTE sp_executesql @QueryDetalleCompra

		delete from CARRITO where IdUsuario = @IdUsuario

		SET @Resultado = 1

		commit
	end try
	begin catch
		rollback
		SET @Resultado = 0
	end catch
end

go

create proc sp_ObtenerCompra(
@IdUsuario int)
as
begin
select c.Total,convert(char(10),c.FechaCompra,103)[Fecha],

(select m.Descripcion, p.Nombre,p.RutaImagen,dc.Total,dc.Cantidad from DETALLE_COMPRA dc
inner join PRODUCTO p on p.IdProducto = dc.IdProducto
inner join MARCA m on m.IdMarca = p.IdMarca
where dc.IdCompra = c.IdCompra
FOR XML PATH ('PRODUCTO'),TYPE) AS 'DETALLE_PRODUCTO'

from compra c
where c.IdUsuario = @IdUsuario
FOR XML PATH('COMPRA'), ROOT('DATA') 
end

exec sp_ObtenerCompra 2

-----------VIDEOTEC


-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/30>
-- Description:	<sp para insertar un registro en la tabla tbl_empresa>
-- =============================================
USE DB_PROYECTO
GO
create PROCEDURE sp_insert_tbl_empresa ( 
	@emp_nombre varchar(15),
	@emp_telefono varchar(8),
	@emp_direccion text,
	@emp_correo varchar(50),
	@emp_logo varchar(500)
	)
AS
BEGIN
    
	insert into tbl_empresa(emp_nombre,emp_telefono,emp_direccion,emp_correo,emp_logo) 
	values (@emp_nombre,@emp_telefono,@emp_direccion,@emp_correo,@emp_logo)
END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para actualizar un registro de la tabla tbl_empresa>
-- =============================================
USE DB_PROYECTO
GO
create PROCEDURE sp_update_tbl_empresa 
	( 
	@emp_id_empresa int,
	@emp_nombre varchar(15),
	@emp_telefono varchar(8),
	@emp_direccion text,
	@emp_correo varchar(50),
	@emp_logo varchar(500)
	)
AS
BEGIN
    
	update tbl_empresa set 
	emp_nombre = @emp_nombre,
	emp_telefono = @emp_telefono,
	emp_direccion = @emp_direccion,
	emp_correo = @emp_correo,
	emp_logo = @emp_logo
	where emp_id_empresa = @emp_id_empresa

END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para eliminar un registro de tbl_empresa>
-- =============================================
USE DB_PROYECTO
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
USE DB_PROYECTO
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
USE DB_PROYECTO
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

--------------------
create proc sp_actualizarLogo(
@emp_id_empresa int,
@emp_logo varchar(50)
)
as
begin
	update tbl_empresa set emp_logo = @emp_logo where emp_id_empresa = @emp_id_empresa
end

go


------------



-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para insertar un registro de un socio>
-- =============================================
USE DB_PROYECTO
GO
CREATE PROCEDURE sp_insert_tbl_pelicula ( 
	@pel_titulo varchar(100),
	@pel_sinopsis text,
	@pel_clasificacion varchar(5),
	@pel_duracion varchar(10),
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




create proc sp_registrarPelicula(
@pel_titulo varchar(500),
@pel_sinopsis text,
@pel_clasificacion varchar(5),
@pel_duracion varchar(10),
@pel_año_publicacion int,
@pel_pais varchar(20),
@pel_precio money,
@pel_portada varchar(100),
@pel_trailer varchar(100),
@Resultado int output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM tbl_pelicula WHERE pel_titulo = @pel_titulo)
	begin

	     insert into tbl_pelicula(pel_titulo,pel_sinopsis,pel_clasificacion,pel_duracion,pel_año_publicacion,pel_pais,
		 pel_precio,pel_portada,pel_trailer) values (
		 @pel_titulo,@pel_sinopsis,@pel_clasificacion,@pel_duracion,@pel_año_publicacion,@pel_pais,@pel_precio,
		 @pel_portada,@pel_trailer)



		SET @Resultado = scope_identity()
	end
end

go

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para actualizar un registro de socio>
-- =============================================
USE DB_PROYECTO
GO
CREATE PROCEDURE sp_update_tbl_pelicula ( 
	@pel_id_pelicula varchar(8),
	@pel_titulo varchar(10),
	@pel_sinopsis text,
	@pel_clasificacion varchar(5),
	@pel_duracion varchar(10),
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
-- Description:	<sp para eliminar un registro de socio>
-- =============================================
USE DB_PROYECTO
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
-- Description:	<sp para seleccionar todos los registros de la tabla tbl_socio>
-- =============================================
USE DB_PROYECTO
GO
CREATE PROCEDURE sp_select_all_tbl_pelicula
AS
BEGIN

    select pel_id_pelicula,pel_titulo,pel_sinopsis,pel_clasificacion,pel_duracion,pel_año_publicacion,pel_stock_cintas,pel_pais,pel_precio,pel_disponibilidad,pel_portada,pel_trailer from tbl_pelicula

END
GO


create proc sp_obtenerPelicula
as
begin

select  p.*,c.clasf_nombre from tbl_pelicula p inner join tbl_clasificacion c
on p.pel_clasificacion = c.clasf_simbolo

end

go

exec sp_obtenerPelicula




-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<sp para seleccionar todos los campos de un registro de tbl_socio por el codigo socio>
-- =============================================
USE DB_PROYECTO
GO
CREATE PROCEDURE sp_select_tbl_pelicula (@pel_id_pelicula varchar(8))
AS
BEGIN

	select pel_id_pelicula,pel_titulo,pel_sinopsis,pel_clasificacion,pel_duracion,pel_año_publicacion,pel_stock_cintas,pel_pais,pel_precio,pel_disponibilidad,pel_portada,pel_trailer from tbl_pelicula where pel_id_pelicula = @pel_id_pelicula

END
GO

----------------CLASIFICACION
Use DB_PROYECTO
go
create proc sp_listar_clasificaciones as
begin
	select clasf_simbolo,clasf_nombre,clasf_significado from tbl_clasificacion
end
go


-- socios por genero
USE DB_PROYECTO
go
create proc sp_socios_por_genero as
begin
	select soc_genero as Genero,COUNT(soc_codigo_socio) as Cantidad_de_socios from tbl_socio group by soc_genero
	order by Cantidad_de_socios desc
end
go

drop proc sp_socios_por_genero

exec sp_socios_por_genero

