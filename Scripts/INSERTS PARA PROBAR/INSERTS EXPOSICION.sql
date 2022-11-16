BEGIN TRAN
--INSERTAR ACTOR
exec sp_insert_tbl_actor 'Herb', 'Herb Hardy', 'California', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1994, '1976/11/11', 'Nuclear Power Engineer', 'http://dummyimage.com/218x100.png/dddddd/000000' 
exec sp_insert_tbl_actor 'Karel', 'Karel Revely', 'Indiana', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 2003, '1985/10/30', 'Office Assistant II', 'http://dummyimage.com/141x100.png/ff4444/ffffff' 
exec sp_insert_tbl_actor 'Idalia', 'Idalia Tenney', 'Texas', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 2006, '2000/10/29', 'Operator', 'http://dummyimage.com/131x100.png/5fa2dd/ffffff' 
exec sp_insert_tbl_actor 'Standford', 'Standford Popping', 'Wisconsin', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 1999, '2000/09/17', 'Actuary', 'http://dummyimage.com/163x100.png/cc0000/ffffff' 
exec sp_insert_tbl_actor 'Nevins', 'Nevins Smogur', 'Minnesota', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.In congue. Etiam justo. Etiam pretium iaculis justo.', 1995, '1989/10/01', 'Cost Accountant', 'http://dummyimage.com/180x100.png/cc0000/ffffff' 

select * from tbl_bitacora_actor 
where bit_act_accion = 'INSERT'
order by bit_act_fecha_accion desc

--INSERTAR DIRECTOR
exec sp_insert_tbl_director 'Tatiania', 'Tatiania Crookshank', 'Texas', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', '1988/09/26', 'http://dummyimage.com/101x100.png/cc0000/ffffff' 
exec sp_insert_tbl_director 'Francisco', 'Francisco Timperley', 'Florida', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', '1973/07/06', 'http://dummyimage.com/200x100.png/5fa2dd/ffffff' 
exec sp_insert_tbl_director 'Bruno', 'Bruno Astin', 'Florida', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', '2003/04/14', 'http://dummyimage.com/240x100.png/ff4444/ffffff' 
exec sp_insert_tbl_director 'Shea', 'Shea Hazeman', 'South Carolina', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '1971/05/17', 'http://dummyimage.com/119x100.png/cc0000/ffffff' 

select * from tbl_bitacora_director
where bit_dir_accion = 'INSERT'
order by bit_dir_fecha_accion desc

exec sp_select_all_tbl_genero_pelicula

--INSERTAR SOCIO
exec sp_insert_socio '501230456','Melany','Lawson','Melany','melany@info.com','89120478','50201','Donec semper sapien a libero. Nam dui.','Femenino','2001-04-17',NULL,'DK39C_14X',216,115,8

exec sp_select_all_tbl_socio

--INSERTAR PELICULA
--exec sp_select_all_tbl_productora
--exec sp_select_all_tbl_director
--exec sp_select_all_tbl_actor
--exec sp_select_all_tbl_genero_pelicula

exec sp_insert_pelicula 'Puente hasta Terabithia','sipnosis','PG-13','02:43',2007,'Estados unidos',8.70,NULL,NULL,5,114,208,2

select * from tbl_bitacora_pelicula
where bit_pel_accion = 'INSERT'
order by bit_pel_fecha_accion desc

exec sp_select_all_tbl_pelicula

--INSERTAR CINTA
EXEC sp_select_all_tbl_idioma

exec sp_insert_tbl_cinta 'ES','072BC556'
exec sp_insert_tbl_cinta 'ES','072BC556'

EXEC sp_select_all_tbl_cinta

--INSERTAR PRESTAMO Y DETALLE PRESTAMO

exec sp_insert_tbl_prestamo '2022-11-16','2022-11-22','030F4C88D92A'

exec sp_select_all_tbl_prestamo 

select * from tbl_bitacora_prestamo
where bit_pres_accion = 'INSERT'
order by bit_pres_fecha_accion desc

exec sp_insert_tbl_detalle_prestamo '2178','FAA82750'
exec sp_insert_tbl_detalle_prestamo '2178','D37DC775'


ROLLBACK TRAN