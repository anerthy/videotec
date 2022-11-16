--SCRIPT CON CONSULTAS PARA PROBAR

-- VER CUANTOS SOCIOS POR GENERO
EXEC sp_socios_por_genero

-- VER SOCIOS POR EDAD
EXEC sp_socios_por_edad

-- TIEMPO QUE TARDAN EN DEVOLVER UNA CINTA
EXEC sp_tiempo_devolucion_cinta

-- VER CANTIDAD PELICULAS EN ESPERA
EXEC sp_peliculas_en_espera

-- VER LOGINS
select * from view_user_logins

-- GANANCIAS OBTENIDAS POR PRESTAMOS POR MES
EXEC sp_ganancias_por_mes

-- TABLA GLOBAL BITACORA
EXEC sp_bitacora

-- VER CANTIDAD DE DETALLES DE PRESTAMOS POR PRESTAMO
EXEC sp_ver_cantidad_detalles

-- VER FACTURA DE UNA PRESTAMO 
exec sp_prestamo_factura 1475

-- VER ACTORES DE UNA PELICULA
exec sp_actores_pelicula '34F65B6D'
exec sp_actores_secundarios_pelicula '34F65B6D'
exec sp_actores_principales_pelicula 'FAA82750'
--EXEC sp_select_all_tbl_pelicula

-- PREFERENCIAS DEL SOCIO
exec sp_preferencias_socio_directores '002A0B974FD9'
exec sp_preferencias_socio_actores '002A0B974FD9'
exec sp_preferencias_socio_generos '002A0B974FD9'

-- VER CANTIDAD DE PELICULAS POR GENERO
EXEC sp_num_peliculas_por_genero
exec sp_ver_peliculas_por_genero 1
-- exec sp_select_all_tbl_genero_pelicula

-- VER PELICULAS DE UNA CLASIFICACION
exec sp_num_peliculas_clasificacion

exec sp_ver_peliculas_por_clasificacion 'PG-13'
exec sp_ver_peliculas_por_clasificacion 'R'

-- PELICULAS DONDE PARTICIPA UN ACTOR
EXEC sp_peliculas_actor 5

-- PELICULAS DIRIGIDAS POR DIRECTOR
sp_peliculas_director 1

-- VER PELICULAS PRODUCIDAS POR UNA PRODUCTORA
EXEC sp_peliculas_productora 4
