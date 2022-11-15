USE VIDEOTEC
GO

create proc sp_listar_idiomas as
begin
	select idm_id_idioma,idm_nombre from tbl_idioma
end

create proc sp_listar_generos as
begin
	select gen_id_genero,gen_nombre from tbl_genero_pelicula
end

create proc sp_listar_actores as
begin
	select act_id_actor,act_nombre from tbl_actor
end

create proc sp_listar_directores as
begin
	select dir_id_director,dir_nombre from tbl_director
end

create proc sp_productoras as
begin
	select prod_id_productora,prod_nombre from tbl_productora
end

create proc sp_listar_peliculas as
begin
	select pel_id_pelicula,pel_titulo from tbl_pelicula
end
go

create proc sp_listar_peliculas_disponibles as
begin
	select pel_id_pelicula,pel_titulo from tbl_pelicula where pel_disponibilidad = 'Disponible'
end
go

create proc sp_listar_socios as
begin
	select soc_codigo_socio,soc_cedula,soc_nombre+' '+soc_apellido1+' '+soc_apellido2 as soc_nombre from tbl_socio
end
go

create proc sp_listar_roles as
begin
	select rol_id_rol,rol_nombre from tbl_rol
end
go

create proc sp_listar_usuarios_socios as
begin
	select user_id_usuario,user_nombre from tbl_usuario
	inner join tbl_rol
	on user_rol_id = rol_id_rol
	where rol_nombre = 'Socio'
end

create proc sp_listar_usuarios as
begin
	select user_id_usuario,user_nombre from tbl_usuario
end

create proc sp_listar_clasificaciones as
begin
	select clasf_simbolo,clasf_nombre from tbl_clasificacion
end
go

create proc sp_listar_cintas as
begin
	select cin_numero_cinta,pel_titulo,cin_idioma from tbl_cinta
	inner join tbl_idioma
	on idm_id_idioma = cin_idioma
	inner join tbl_pelicula
	on pel_id_pelicula = cin_pelicula_id
end
go

create proc sp_listar_prestamos as
begin
	select pres_id_prestamo,soc_nombre_completo from tbl_prestamo
	inner join view_tbl_socio
	on pres_codigo_socio = soc_codigo_socio
	order by pres_fecha_prestamo
end