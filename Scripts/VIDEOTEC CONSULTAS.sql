-- cantidad de socios
select COUNT(soc_codigo_socio) as [Cantidad de socios] from tbl_socio

-- cantidad de socios por genero
select COUNT(soc_codigo_socio) as [Cantidad de socios] from tbl_socio where soc_genero = 'Masculino'
select COUNT(soc_codigo_socio) as [Cantidad de socios] from tbl_socio where soc_genero = 'Femenino'
select COUNT(soc_codigo_socio) as [Cantidad de socios] from tbl_socio where soc_genero = 'No binario'

select COUNT(soc_codigo_socio) as [Cantidad de socios],soc_genero from tbl_socio group by soc_genero

-- cantidad de socios por edad
select COUNT(soc_codigo_socio) as [Cantidad de socios],soc_edad from view_tbl_socio group by soc_edad

-- socios con edad mas comun
select soc_nombre,soc_edad from view_tbl_socio 
where soc_edad = (select max(soc_edad) from view_tbl_socio)

-- ver genero de pelicula 
select p.*,gp.gen_nombre from tbl_pelicula p
inner join tbl_pelicula_genero pg
on p.pel_id_pelicula = pg.pel_gen_pelicula_id
inner join tbl_genero_pelicula gp
on pg.pel_gen_genero_id = gp.gen_id_genero

-- ver dias de prestamo
select del_cin_fecha_prestamo,del_cin_fecha_devolucion, DATEDIFF(DAY,del_cin_fecha_prestamo,del_cin_fecha_devolucion) as [Plazo] from tbl_devolucion_cinta

select CONVERT(varchar,DATEDIFF(day,'2022-11-01',GETDATE())) + ' dias' as [Plazo]

-- peliculas en lista de espera
select COUNT(list_id_lista_espera) from tbl_lista_espera

--logins
select s.soc_correo,u.user_contraseña from tbl_usuario u
inner join tbl_socio_usuario sa
on u.user_id_usuario = sa.soc_user_usuario_id
inner join tbl_socio s
on s.soc_codigo_socio = sa.soc_user_codigo_socio

-- BORRAR MAS DE UN REGISTRO A LA VEZ SIN QUE DE ERROR EL TRIGGER
--while (exists (select * from tbl_socio where soc_codigo_socio <> '02C2D8D75F8A'))
--begin
--	declare @codigo varchar(12)
--	set @codigo = (select top 1 soc_codigo_socio from tbl_socio where soc_codigo_socio <> '02C2D8D75F8A')
--	delete from tbl_socio where soc_codigo_socio = @codigo
--end
