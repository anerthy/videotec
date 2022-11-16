create proc sp_obtenerPelicula
as
begin

select  p.*,c.clasf_nombre from tbl_pelicula p inner join tbl_clasificacion c
on p.pel_clasificacion = c.clasf_simbolo

end

go

exec sp_obtenerPelicula




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

Use VIDEOTEC
go
create proc sp_listar_clasificaciones as
begin
	select clasf_simbolo,clasf_nombre,clasf_significado from tbl_clasificacion
end
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

insert into USUARIO(Nombres,Apellidos,Correo,Contrasena,EsAdministrador) values ('test','user','admin@example.com','admin123',1)
insert into USUARIO(Nombres,Apellidos,Correo,Contrasena,EsAdministrador) values ('socio','ape','socio@info.com','123',0)