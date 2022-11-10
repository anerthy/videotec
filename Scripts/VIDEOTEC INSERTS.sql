USE VIDEOTEC
GO

exec sp_insert_tbl_socio '504460444','Andres','Mejias','Gonzalez','andmejigo@gmail.com','87293508','50201','25m de la escuela Cerro Azul','Masculino','2022-11-08','foto_perfil'

exec sp_insert_tbl_rol 'VIDEOTEC-SA','Rol de super administrador del sistema'
exec sp_insert_tbl_rol 'Administrador','Tiene acceso a todo el sistema'
exec sp_insert_tbl_rol 'Socio','Rol de socio. Puede realizar prestamos de peliculas'

--select * from tbl_pelicula
--update tbl_pelicula set pel_stock_cintas = 2 where pel_id_pelicula = '1232133'

--select * from tbl_idioma
--insert into tbl_idioma values ('ESP','ESPAÑOL'),('ENG','INGLES')

--insert into tbl_cinta values ('145','ESP','1232133','Prestada')
--select * from tbl_cinta

--delete from tbl_cinta where cin_numero_cinta = '145'

----------------

--insert into tbl_pelicula (pel_id_pelicula,pel_titulo,pel_sinopsis,pel_clasificacion,pel_duracion,pel_año_publicacion,pel_pais,pel_precio,pel_portada,pel_trailer)
--values ('123456','Avengers','lonja venjers',1,'01:45',2021,'USA',$2.5,'PORTADA','TRAILEEER')
--select * from tbl_pelicula

--------------------

--insert into tbl_prestamo values ('2022-10-29 21:00','2022-11-4 13:00','163EAD281D0E',$20)
--insert into tbl_detalle_prestamo values (1,'12',$4)
--select * from tbl_prestamo
--select * from tbl_socio
--select * from tbl_detalle_prestamo
--select * from tbl_cinta
--update tbl_cinta set cin_estado = 'Disponible' where cin_numero_cinta = '12' 

-----------

--select * from tbl_devolucion_cinta

-- -- -- -- -- -- -- 

--exec sp_insert_tbl_detalle_prestamo 1,'C0EF25B5-288A'
--exec sp_update_tbl_detalle_prestamo 1,1,'12'
--exec sp_delete_tbl_detalle_prestamo 1
--exec sp_select_tbl_detalle_prestamo 3
--exec sp_select_all_tbl_detalle_prestamo
--select * from tbl_detalle_prestamo
--exec sp_insert_tbl_pelicula 'Moana','una piba en el awa','1','01:45','2017','USA','$4','Portada','trialer'
--select * from tbl_pelicula
--exec sp_update_tbl_pelicula 'C0EF25B5','Moana 2','una piba en el awa','1','01:45','2017','USA','$4','Portada','trialer'
--select * from tbl_pelicula
--exec sp_select_tbl_pelicula 'C0EF25B5'
--exec sp_delete_tbl_pelicula 'BA168726'
--exec sp_select_all_tbl_pelicula
--select soc_codigo_socio,soc_cedula,soc_nombre,soc_apellido1,soc_apellido2,soc_correo,soc_telefono,
--soc_codigo_postal, soc_direccion_exacta, soc_genero, soc_fecha_nacimiento, soc_foto_perfil 
--from tbl_socio


--exec sp_insert_tbl_cinta 'ESP','C0EF25B5'
--select * from tbl_cinta
--exec sp_update_tbl_cinta 'C0EF25B5-C994','ENG','EB6C9F14'
--select * from tbl_pelicula
--exec sp_delete_tbl_cinta 'C0EF25B5-6259'

--exec sp_insert_tbl_socio '504460444','Andres','Mejias','Gonzalez','andmejigo@gmail.com','87293508','50201','25m de la escuela Cerro Azul','Masculino','2022-11-08','foto_perfil'
--exec sp_update_tbl_socio '123456123456','504460444','PEPE','Mejias','Gonzalez','anfmu123ego@gmail.com','129101831','50201','en la casa','Masculino','2022-11-08','foto_re_facha'
--exec sp_select_tbl_socio '163EAD281D0E'
--exec sp_select_all_tbl_socio
--exec sp_delete_tbl_socio '123456123456'

--select * from tbl_pelicula
--exec sp_insert_tbl_detalle_prestamo 1,'C0EF25B5'
--select * from tbl_detalle_prestamo

--exec sp_insert_tbl_carrito_compra 'C0EF25B5','163EAD281D0E'
--exec sp_insert_tbl_carrito_compra 'C0EF25B5','163EAD281D0E'
--exec sp_update_tbl_carrito_compra 1,'EB6C9F14','163EAD281D0E'
--exec sp_select_all_tbl_carrito_compra
--sp_select_tbl_carrito_compra 2
--exec sp_delete_tbl_carrito_compra 3
--select * from tbl_carrito_compra
--select * from tbl_pelicula