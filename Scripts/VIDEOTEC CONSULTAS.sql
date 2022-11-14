-- BORRAR MAS DE UN REGISTRO A LA VEZ SIN QUE DE ERROR EL TRIGGER

--while (exists (select * from tbl_socio where soc_codigo_socio <> '02C2D8D75F8A'))
--begin
--	declare @codigo varchar(12)
--	set @codigo = (select top 1 soc_codigo_socio from tbl_socio where soc_codigo_socio <> '02C2D8D75F8A')
--	delete from tbl_socio where soc_codigo_socio = @codigo
--end

-- cantidad de socios por genero
select COUNT(soc_codigo_socio) as [Cantidad de socios] from tbl_socio where soc_genero = 'Masculino'
select COUNT(soc_codigo_socio) as [Cantidad de socios] from tbl_socio where soc_genero = 'Femenino'
select COUNT(soc_codigo_socio) as [Cantidad de socios] from tbl_socio where soc_genero = 'No binario'

-- cantidad de socios
select COUNT(soc_codigo_socio) as [Cantidad_Socios] from tbl_socio


-- socios por genero
create proc sp_socios_por_genero as
begin
	select soc_genero as Genero,COUNT(soc_codigo_socio) as [Cantidad de socios] from tbl_socio group by soc_genero
	order by [Cantidad de socios] desc
end
go

-- cantidad de socios por edad
create proc sp_socios_por_edad as
begin
	select soc_edad as Edad,COUNT(soc_codigo_socio) as [Cantidad de socios] from view_tbl_socio group by soc_edad
end
go

-- socios con edad mas comun
select soc_nombre_completo,soc_edad from view_tbl_socio 
where soc_edad = (select max(soc_edad) from view_tbl_socio)

-- ver genero de pelicula
USE VIDEOTEC
GO
create view sp_num_peliculas_por_genero as
	select gen_nombre as Genero,count(pel_id_pelicula) as [Cantidad de Peliculas] from tbl_pelicula
	inner join tbl_pelicula_genero
	on pel_id_pelicula = pel_gen_pelicula_id
	inner join tbl_genero_pelicula
	on pel_gen_genero_id = gen_id_genero
	group by gen_nombre
with check option
GO

select * from sp_num_peliculas_por_genero

-- ver dias de prestamo
create proc sp_tiempo_devolucion_cinta as
BEGIN
	select del_cin_fecha_prestamo as [Fecha Prestamo],del_cin_fecha_devolucion as [Fecha devolucion], DATEDIFF(DAY,del_cin_fecha_prestamo,del_cin_fecha_devolucion) as [Plazo] from tbl_devolucion_cinta
END
GO

-- peliculas en lista de espera
create proc sp_peliculas_en_espera
as
BEGIN
	select COUNT(list_pelicula_id) as [Peliculas] from tbl_lista_espera
END
GO

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

USE VIDEOTEC
GO
--Cantidad de películas por genero
select gp.gen_nombre as Genero,count(p.pel_id_pelicula) as [Peliculas] from tbl_pelicula p
inner join tbl_pelicula_genero pg
on p.pel_id_pelicula = pg.pel_gen_pelicula_id
inner join tbl_genero_pelicula gp
on pg.pel_gen_genero_id = gp.gen_id_genero
group by gp.gen_nombre


--Cantidad de películas por género que son más solicitadas 
select gp.gen_nombre as [Genero],count(p.pel_id_pelicula) as [N° de Peliculas] from tbl_registro_prestamos rp
inner join tbl_cinta c
on rp.reg_pres_numero_cinta = c.cin_numero_cinta

inner join tbl_pelicula p
on c.cin_pelicula_id = p.pel_id_pelicula

inner join tbl_pelicula_genero pg
on p.pel_id_pelicula = pg.pel_gen_pelicula_id

inner join tbl_genero_pelicula gp
on gp.gen_id_genero = pg.pel_gen_genero_id
group by gp.gen_nombre
order by [N° de Peliculas] desc

--Cantidad de películas en solicitudes en espera,

--tiempos de espera
select reg_pres_id_registro_prestamos,reg_pres_fecha_prestamo,reg_pres_fecha_devolucion,DATEDIFF(DAY,reg_pres_fecha_prestamo,reg_pres_fecha_devolucion) as [Plazo] from tbl_registro_prestamos

select * from tbl_cinta
select * from tbl_pelicula
select * from tbl_socio
select * from tbl_idioma
select * from tbl_carrito_compra
select * from tbl_prestamo order by pres_precio_total desc
select * from tbl_detalle_prestamo
select * from tbl_clasificacion
select * from tbl_genero_pelicula order by gen_nombre
select * from tbl_registro_prestamos
-- ver actores de peliculas
select pel_id_pelicula,pel_titulo,pel_act_tipo_actor,act_nombre from tbl_pelicula
inner join tbl_pelicula_actor
on  pel_id_pelicula = pel_act_pelicula_id
inner join tbl_actor
on act_id_actor = pel_act_actor_id

--ver info de peliculas
select pel_id_pelicula,
	pel_titulo,
	act_id_actor,
	act_nombre,
	dir_id_director,
	dir_nombre
from tbl_pelicula
inner join tbl_pelicula_actor
on  pel_id_pelicula = pel_act_pelicula_id
inner join tbl_actor
on act_id_actor = pel_act_actor_id
inner join tbl_pelicula_director
on pel_dir_pelicula_id = pel_id_pelicula
inner join tbl_director
on pel_dir_director_id = dir_id_director
where pel_act_tipo_actor = 'Principal'

--PREFERENCIAS DE SOCIO

--GENERO FAVS
select soc_cedula,soc_nombre + ' ' + soc_apellido1 + ' ' + soc_apellido2 as soc_nombre,
gen_nombre
from tbl_socio inner join tbl_socio_genero
on soc_codigo_socio = soc_gen_codigo_socio
inner join tbl_genero_pelicula
on soc_gen_genero_id = gen_id_genero

--ACTORES FAVS
select soc_cedula,soc_nombre + ' ' + soc_apellido1 + ' ' + soc_apellido2 as soc_nombre,
act_nombre
from tbl_socio inner join tbl_socio_actor
on soc_codigo_socio = soc_act_codigo_socio
inner join tbl_actor
on soc_act_actor_id = act_id_actor

--ACTORES FAVS
select soc_cedula,soc_nombre + ' ' + soc_apellido1 + ' ' + soc_apellido2 as soc_nombre,
dir_nombre
from tbl_socio inner join tbl_socio_director
on soc_codigo_socio = soc_dir_codigo_socio
inner join tbl_director
on soc_dir_id_socio_director = dir_id_director

Use VIDEOTEC
go
alter proc sp_prestamo_factura 
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


	declare factura cursor for
	select det_pres_id_detalle_prestamo,det_pres_numero_cinta,det_pres_sub_total from tbl_detalle_prestamo
	where det_pres_prestamo_id = @pres_id_prestamo
	
	open factura
	fetch factura into @det_pres_id_detalle_prestamo,@det_pres_numero_cinta,@det_pres_sub_total

	print 'ID ' + convert(varchar,@pres_id_prestamo)
	print 'Nombre del socio: ' + @nombre_socio
	print('---------------------')
	print('Detalles del prestamo')
	print '#   ' + 'NUMERO CINTA  ' + 'SUBTOTAL'
	while(@@FETCH_STATUS = 0)
	begin
		print (convert(varchar,@det_pres_id_detalle_prestamo) + ' ' + @det_pres_numero_cinta + ' ' + convert(varchar,@det_pres_sub_total))
		fetch factura into @det_pres_id_detalle_prestamo,@det_pres_numero_cinta,@det_pres_sub_total
	end

	print('---------------------')
	print('Total: ' + convert(varchar,@pres_precio_total))
	close factura
	deallocate factura
END
GO

exec sp_prestamo_factura 149

