-- cantidad de socios por genero
select COUNT(soc_codigo_socio) as [Cantidad de socios] from tbl_socio where soc_genero = 'Masculino'
select COUNT(soc_codigo_socio) as [Cantidad de socios] from tbl_socio where soc_genero = 'Femenino'
select COUNT(soc_codigo_socio) as [Cantidad de socios] from tbl_socio where soc_genero = 'No binario'

-- cantidad de socios
select COUNT(soc_codigo_socio) as [Cantidad_Socios] from tbl_socio

-- socios con edad mas comun
select soc_nombre_completo,soc_edad from view_tbl_socio 
where soc_edad = (select max(soc_edad) from view_tbl_socio)

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



