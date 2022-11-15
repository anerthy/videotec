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
create proc sp_num_peliculas_por_genero as
begin
	select gen_nombre as Genero,count(pel_id_pelicula) as [Cantidad de Peliculas] from tbl_pelicula
	inner join tbl_pelicula_genero
	on pel_id_pelicula = pel_gen_pelicula_id
	inner join tbl_genero_pelicula
	on pel_gen_genero_id = gen_id_genero
	group by gen_nombre
end
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
	select user_nombre as [Nombre de Usuario],soc_correo as Correo,user_contrase�a as Contrase�a from tbl_usuario
	inner join tbl_socio_usuario
	on user_id_usuario = soc_user_usuario_id
	inner join tbl_socio
	on soc_codigo_socio = soc_user_codigo_socio

	with check option
GO

select * from view_user_logins

USE VIDEOTEC
GO
--Cantidad de pel�culas por genero
select gp.gen_nombre as Genero,count(p.pel_id_pelicula) as [Peliculas] from tbl_pelicula p
inner join tbl_pelicula_genero pg
on p.pel_id_pelicula = pg.pel_gen_pelicula_id
inner join tbl_genero_pelicula gp
on pg.pel_gen_genero_id = gp.gen_id_genero
group by gp.gen_nombre


--Cantidad de pel�culas por g�nero que son m�s solicitadas 
select gp.gen_nombre as [Genero],count(p.pel_id_pelicula) as [N� de Peliculas] from tbl_registro_prestamos rp
inner join tbl_cinta c
on rp.reg_pres_numero_cinta = c.cin_numero_cinta

inner join tbl_pelicula p
on c.cin_pelicula_id = p.pel_id_pelicula

inner join tbl_pelicula_genero pg
on p.pel_id_pelicula = pg.pel_gen_pelicula_id

inner join tbl_genero_pelicula gp
on gp.gen_id_genero = pg.pel_gen_genero_id
group by gp.gen_nombre
order by [N� de Peliculas] desc

--Cantidad de pel�culas en solicitudes en espera,

--tiempos de espera

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



