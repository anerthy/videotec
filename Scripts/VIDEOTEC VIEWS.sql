USE VIDEOTEC
GO
create view view_tbl_socio as
select soc_codigo_socio,
soc_cedula,
soc_nombre+' '+soc_apellido1+' '+soc_apellido2 as soc_nombre_completo,
soc_correo,
soc_telefono,
soc_codigo_postal,
soc_direccion_exacta,
soc_genero,
dbo.fnt_edad(soc_fecha_nacimiento) as soc_edad,
soc_foto_perfil 
from tbl_socio
with check option
go

select * from view_tbl_socio

create view view_registros_prestamos as
	select pel_id_pelicula,reg_pres_codigo_socio from tbl_pelicula inner join tbl_cinta
	on pel_id_pelicula = cin_pelicula_id
	inner join tbl_registro_prestamos
	on cin_numero_cinta = reg_pres_numero_cinta
with check option
go

select * from view_registros_prestamos

create view view_socio_preferencias as
	select s.*,act_nombre,dir_nombre,gen_nombre
	from view_tbl_socio s inner join tbl_socio_actor
	on soc_codigo_socio = soc_act_codigo_socio
	inner join tbl_actor
	on act_id_actor = soc_act_actor_id
	inner join tbl_socio_director
	on soc_codigo_socio = soc_dir_codigo_socio
	inner join tbl_director
	on dir_id_director = soc_dir_director_id
	inner join tbl_socio_genero
	on soc_codigo_socio = soc_gen_codigo_socio
	inner join tbl_genero_pelicula
	on gen_id_genero = soc_gen_genero_id
with check option
go

select * from view_socio_preferencias

USE VIDEOTEC
GO
create view view_pelicula as
	select pel_id_pelicula,pel_titulo,pel_clasificacion,pel_sinopsis,
	act_nombre, dir_nombre,prod_nombre 
	from tbl_pelicula inner join tbl_pelicula_actor
	on pel_id_pelicula = pel_act_pelicula_id
	inner join tbl_actor
	on act_id_actor = pel_act_actor_id
	inner join tbl_pelicula_director
	on pel_id_pelicula = pel_dir_pelicula_id
	inner join tbl_director
	on dir_id_director = pel_dir_director_id
	inner join tbl_pelicula_productora
	on pel_dir_pelicula_id = pel_prod_pelicula_id
	inner join tbl_productora
	on prod_id_productora = pel_prod_productora_id
	where pel_act_tipo_actor = 'Principal'
with check option
go

select * from view_pelicula

create view view_registro_prestamo_peliculas as
	SELECT * FROM tbl_pelicula 
	WHERE pel_id_pelicula IN (SELECT distinct SUBSTRING(reg_pres_numero_cinta,1,8) FROM tbl_registro_prestamos)
with check option
go

select * from view_registro_prestamo_peliculas

--logins
create view view_user_logins as
	select user_nombre as [Nombre de Usuario],soc_correo as Correo,user_contraseña as Contraseña from tbl_usuario
	inner join tbl_socio_usuario
	on user_id_usuario = soc_user_usuario_id
	inner join tbl_socio
	on soc_codigo_socio = soc_user_codigo_socio

	with check option
GO

select * from view_user_logins