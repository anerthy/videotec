GO
USE DB_PROYECTO


go


insert into USUARIO(Nombres,Apellidos,Correo,Contrasena,EsAdministrador) values ('test','user','admin@example.com','admin123',1)
insert into USUARIO(Nombres,Apellidos,Correo,Contrasena,EsAdministrador) values ('test1','user1','1admin@example.com','admin123',0)
GO
insert into CATEGORIA(Descripcion) values
('Tecnolog�a'),
('Muebles'),
('Dormitorio'),
('Deportes'),
('Zapatos'),
('Accesorios'),
('Jugueter�a'),
('Electrohogar')

GO

insert into MARCA(Descripcion) values
('SONYTE'),
('HPTE'),
('LGTE'),
('HYUNDAITE'),
('CANONTE'),
('ROBERTA ALLENTE'),
('MICATE'),
('FORLITE'),
('BE CRAFTYTE'),
('ADIDASTE'),
('BESTTE'),
('REEBOKTE'),
('FOSSILTE'),
('BILLABONGTE'),
('POWCOTE'),
('HOT WHEELSTE'),
('LEGOTE'),
('SAMSUNGTE'),
('RECCOTE'),
('INDURAMATE'),
('ALFANOTE'),
('MABETE'),
('ELECTROLUXTE')


GO



insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Consola de PS4 Pro 1TB Negro','Tipo: PS4
Procesador: AMD
Entradas USB: 3
Entradas HDMI: 1
Conectividad: WiFi',1,1,'2000','50','~/Imagenes/Productos/1.jpg')



insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('HP Laptop 15-EF1019LA','Procesador: AMD RYZEN R5
Modelo tarjeta de video: Gr�ficos AMD Radeon
Tama�o de la pantalla: 15.6 pulgadas
Disco duro s�lido: 512GB
N�cleos del procesador: Hexa Core',2,1,'2500','60','~/Imagenes/Productos/2.jpg')


insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Televisor 65 4K Ultra HD Smart TV 65UN7100PSA.AWF','Tama�o de la pantalla: 65 pulgadas
Resoluci�n: 4K Ultra HD
Tecnolog�a: LED
Conexi�n Bluetooth: S�
Entradas USB: 2',3,1,'3000','120','~/Imagenes/Productos/3.jpg')

insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Televisor 50 4K Ultra HD Smart Android','Tama�o de la pantalla: 50 pulgadas
Resoluci�n: 4K Ultra HD
Tecnolog�a: LED
Conexi�n Bluetooth: S�
Entradas USB: 2',4,1,'3200','70','~/Imagenes/Productos/4.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('C�mara Reflex EOS Rebel T100','',5,1,'1560','90','~/Imagenes/Productos/5.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Aparador Surat','Marca: Roberta Allen
Modelo: SURAT
Tipo: Buffets
Alto: 86 cm
Ancho: 85 cm',6,2,'500','60','~/Imagenes/Productos/6.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Mesa de Comedor Donatello','Ancho/Di�metro: 90 cm
Largo: 150 cm
Alto: 75 cm
N�mero de puestos: 6
Material de la base: Madera',7,2,'400','90','~/Imagenes/Productos/7.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Colch�n Polaris 1 Plz + 1 Almohada + Protector','Nivel de confort: Intermedio
Tama�o: 1 plz
Tipo de estructura: Acero
Relleno del colch�n: Resortes
Material del tapiz: Jacquard',8,3,'500','120','~/Imagenes/Productos/8.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Juegos de S�banas 180 Hilos Solid','1.5 PLAZAS',6,3,'200','130','~/Imagenes/Productos/9.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Tocador Franca','Marca: Mica
Tipo: Tocadores
Modelo: Franca
Material de la estructura: Aglomerado MDP
Espesor: 15 mm',7,3,'450','60','~/Imagenes/Productos/10.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Alfombra Infantil de Osa Melange Medio','Marca: Be Crafty
Modelo: Osa
Tipo: Alfombras
Tipo de tejido: A mano
Tama�o: Peque�a',9,3,'120','50','~/Imagenes/Productos/11.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Mochila Unisex Deportivo Classic','NINGUNO',10,4,'220','45','~/Imagenes/Productos/12.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Bicicleta Monta�era Best Inka Aro 29 Roja','NINGUNO',11,4,'890','75','~/Imagenes/Productos/13.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Zapatillas Urbanas Mujer adidas Team Court','TALLA: 4
TALLA:4.5',10,5,'260','80','~/Imagenes/Productos/14.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Zapatillas Training Hombre Rebook Dart TR 2','TALLA: 4
TALLA:4.5',12,5,'230','38','~/Imagenes/Productos/15.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Reloj','NINGUNO',13,6,'300','20','~/Imagenes/Productos/16.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Billetera Hombre','NINGUNO',14,6,'87','88','~/Imagenes/Productos/17.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Auto Deportivo 45 cm Naranja','COLOR: NARANJA',15,7,'90','55','~/Imagenes/Productos/18.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Set de Juego Hot Wheels Robo Tibur�n','NINGUNO',16,7,'130','70','~/Imagenes/Productos/19.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Lego 10713 Set Classic: Malet�n Creativo','NINGUNO',17,7,'110','60','~/Imagenes/Productos/20.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Refrigerador Samsung RT29K571JS8 295 litros','Modelo: RT29K571JS8/PE
Capacidad total �til: 295 lt
Dispensador de agua: S�
Ice maker interior: S�
Material de las bandejas: Vidrio templado',18,8,'2100','90','~/Imagenes/Productos/21.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Ventilador 3 En 1 16 50W','Marca: RECCO
Modelo: RD-40G-3
Tipo: Ventiladores 3 en 1
N�mero de velocidades: 4
Potencia: 50',19,8,'1100','56','~/Imagenes/Productos/22.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Frigobar RI-100BL 92 Lt Blanco','Marca: Indurama
Modelo: RI-100BL
Tipo: Frigobar
Eficiencia energ�tica: A
Capacidad total �til: 92 lt',20,8,'940','78','~/Imagenes/Productos/23.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Aire Acondicionado 12,000 BTU/h Split','Marca: ALFANO
Modelo: 12000 BTU
Tipo: Aires acondicionados Split
Capacidad de enfriamiento: 12000 BTU
Modo: Fr�o',21,8,'1700','56','~/Imagenes/Productos/24.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Lavadora Mabe 16kg','Capacidad de carga: 16KG
Tipo de carga: Superior
Material del tambor: Acero inoxidable
Tecnolog�a: No inverter
Dimensiones (AltoxAnchoxProfundidad): 100cmx62cmx61cm',22,8,'2800','48','~/Imagenes/Productos/25.jpg')
insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values('Campana Extractora EJSE202TBJS','Retr�ctil: No
Iluminaci�n: S�
Modelo: EJSE202TBJS
Tipo: Campanas cl�sicas
Alto: 14 cm',23,8,'1500','56','~/Imagenes/Productos/26.jpg')


go
------CLASIFICACION
Use DB_PROYECTO
insert into tbl_clasificacion (clasf_simbolo,clasf_nombre,clasf_significado) values
('G','General Audiences','Admitido para todas las edades. Nada que pudiera ofender a los padres si lo vieran sus hijos.'),
('PG','Parental Guidance Suggested','Algunos contenidos pueden no ser apropiados para ni�os. Puede contener algunas im�genes que podr�an no gustar a los padres para sus hijos j�venes.'),
('PG-13','Parents Strongly Cautioned','Algunos materiales pueden ser inapropiados para ni�os menores de 13 a�os. Los padres deben ser cautelosos. Puede ser inapropiado para pre-adolescentes.'),
('R','Restricted','Personas de menos de 17 a�os requieren acompa�amiento de un adulto. Contienen algunos materiales para adultos. Los padres deben informarse sobre la pel�cula antes de llevar a sus hijos a verla.'),
('NC-17','Adults Only','Nadie menor de 17 a�os. Solamente adultos. No se admiten ni�os.'),
('E','Exento de clasificaci�n','A�n no clasificado, generalmente material educativo')


select * from tbl_pelicula

-----PELICULA
Use DB_PROYECTO
go
exec sp_registrarPelicula 'Black Panther: Wakanda Forever','TChalla, rey de Wakanda, muere de una enfermedad que su hermana Shuri cree que podr�a haber sido curada por la "hierba en forma de coraz�n". Shuri ha estado intentando recrear sint�ticamente la hierba despu�s de que Killmonger la destruyera, pero no tiene �xito.','PG','02:41',2022,'Estados Unidos',6.65,'NULL','NULL' 
exec sp_insert_tbl_pelicula 'Sonic','NULL','PG','02:41',2022,'Estados Unidos',6.65,'NULL','NULL'
exec sp_insert_tbl_pelicula 'Ring, The', 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 'PG-13', '1:48 AM', 2001, 'China', '$0.91', 'null', 'null'
exec sp_insert_tbl_pelicula 'Gypsy 83', 'Vestibulum ante ipsum primis in faucibus orci an olutfringilla rhoncus.', 'PG-13', '02:38', 2009,'USA',1.31,'null', 'null'
exec sp_insert_tbl_pelicula 'OKA!', 'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.', 'PG-13', '2:50 AM', 2004, 'Indonesia', '$3.03', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Beer', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'PG', '1:59 AM', 2006, 'Colombia', '$8.02', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Gaby: A True Story', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'E', '1:33 AM', 2003, 'Nigeria', '$8.38', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Year of Living Vicariously, The', 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'NC-17', '2:50 AM', 2003, 'Philippines', '$6.52', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Red Road', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.', 'PG-13', '1:01 AM', 2011, 'China', '$6.39', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Prey for Rock & Roll', 'Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.', 'E', '2:09 AM', 2012, 'Indonesia', '$9.07', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Come Back to Me', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', 'PG-13', '2:07 AM', 2011, 'Philippines', '$9.88', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Vertical Features Remake', 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.', 'R', '1:30 AM', 1989, 'Libya', '$6.04', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Veronica Guerin', 'Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'G', '2:12 AM', 2007, 'Peru', '$9.49', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Daddy and Them', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.', 'G', '2:16 AM', 2006, 'Portugal', '$5.25', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Flying Down to Rio', 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'R', '1:18 AM', 1979, 'Pakistan', '$2.78', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Golden Age, The (�ge d''Or, L'')', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', 'PG', '2:10 AM', 1994, 'Yemen', '$3.33', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Dummy', 'Praesent blandit lacinia erat.', 'E', '2:39 AM', 1986, 'Tajikistan', '$8.14', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Matin�e', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'G', '1:39 AM', 2013, 'France', '$3.82', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Year of the Gun', 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.', 'G', '2:46 AM', 2003, 'Indonesia', '$7.22', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Beyond the Valley of the Dolls', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna.', 'G', '1:25 AM', 2006, 'Hong Kong', '$6.22', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula '36 Hours', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 'E', '1:32 AM', 2007, 'China', '$1.20', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Amityville 1992: It''s About Time', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'G', '1:39 AM', 2012, 'Vietnam', '$0.93', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Dressed to Kill', 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 'G', '2:26 AM', 1996, 'New Caledonia', '$8.46', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Torrente 3: El protector', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.', 'PG', '2:48 AM', 2012, 'China', '$6.84', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Life and Nothing But (Vie et rien d''autre, La)', 'Integer a nibh.', 'PG-13', '1:04 AM', 1998, 'Yemen', '$8.54', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'The ''High Sign''', 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'E', '1:25 AM', 2007, 'France', '$6.43', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Grand Seduction, The', 'Donec posuere metus vitae ipsum. Aliquam non mauris.', 'R', '1:47 AM', 1999, 'Czech Republic', '$5.24', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Werner - Beinhart!', 'Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.', 'PG-13', '2:35 AM', 1994, 'Japan', '$6.82', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Haunted, The', 'Integer ac neque.', 'NC-17', '2:07 AM', 2003, 'Honduras', '$6.65', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'D-War (Dragon Wars)', 'Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 'E', '2:33 AM', 2009, 'Peru', '$8.79', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Treasure Island', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.', 'NC-17', '1:35 AM', 1996, 'Portugal', '$6.02', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Wild Angels, The', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.', 'G', '1:29 AM', 1999, 'Russia', '$6.67', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Nina Frisk', 'In hac habitasse platea dictumst.', 'PG', '2:03 AM', 2005, 'Vietnam', '$1.58', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Playboys, The', 'Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'G', '2:11 AM', 2007, 'Brazil', '$8.51', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Charly', 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'E', '2:27 AM', 2006, 'Japan', '$2.63', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Killer Force', 'Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.', 'E', '1:22 AM', 1999, 'China', '$8.71', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Johnny Handsome', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', 'PG', '2:25 AM', 1988, 'United States', '$1.58', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Confessions from a Holiday Camp', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.', 'PG-13', '1:09 AM', 1990, 'Czech Republic', '$6.61', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Death Becomes Her', 'Maecenas rhoncus aliquam lacus.', 'PG-13', '1:27 AM', 2007, 'Vietnam', '$2.02', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Alien', 'Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'R', '1:31 AM', 1994, 'Benin', '$7.73', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Conan the Barbarian', 'Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 'PG', '1:47 AM', 2002, 'Philippines', '$5.17', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Larceny, Inc.', 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.', 'PG', '2:57 AM', 1994, 'China', '$8.70', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Vasermil', 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', 'R', '1:05 AM', 2003, 'Vietnam', '$6.10', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Montana', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 'PG', '2:49 AM', 2001, 'France', '$2.13', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Tom Sawyer', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 'NC-17', '1:23 AM', 1996, 'Indonesia', '$0.14', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Admiral Yamamoto', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.', 'R', '2:47 AM', 1967, 'Albania', '$6.26', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Agnes Browne', 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 'PG', '1:09 AM', 2005, 'China', '$6.43', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'I Inside, The', 'Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.', 'R', '1:06 AM', 1995, 'Poland', '$6.30', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Crimson Gold (Talaye sorgh)', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 'PG-13', '2:58 AM', 2012, 'Czech Republic', '$1.74', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Afternoon of a Torturer, The (Dupa-amiaza unui tortionar)', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'G', '1:35 AM', 1993, 'China', '$5.36', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Internes Can''t Take Money', 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 'NC-17', '1:31 AM', 1999, 'Peru', '$4.28', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Sisters', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 'G', '1:24 AM', 1986, 'Niger', '$3.61', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Alex Cross', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 'PG-13', '1:33 AM', 1990, 'China', '$7.28', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'People Will Talk', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'R', '1:25 AM', 1989, 'Bolivia', '$4.65', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Cruel Story of Youth (Seishun zankoku monogatari)', 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 'PG', '1:02 AM', 2007, 'Brazil', '$2.80', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'There''s Something About Mary', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.', 'PG-13', '1:08 AM', 1999, 'Portugal', '$3.58', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Ewok Adventure, The (a.k.a. Caravan of Courage: An Ewok Adventure)', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.', 'NC-17', '2:28 AM', 2010, 'Indonesia', '$1.09', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'I''m Not Rappaport', 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'G', '1:50 AM', 2011, 'Chile', '$7.43', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'House Built on Water, A (Khanei ruye ab)', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', 'NC-17', '1:15 AM', 2004, 'Jordan', '$0.81', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Queen - Rock Montreal', 'Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 'E', '2:18 AM', 1992, 'United States', '$1.22', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Wise Guys', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 'PG', '2:56 AM', 1995, 'China', '$2.11', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Another Nine & a Half Weeks (Love in Paris) (9 1/2 Weeks II) (Another 9 1/2 Weeks)', 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', 'PG-13', '1:44 AM', 2005, 'Cuba', '$8.91', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Thief', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.', 'G', '1:12 AM', 2003, 'Portugal', '$5.71', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Mad Dogs & Englishmen', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.', 'R', '2:22 AM', 2004, 'Indonesia', '$4.69', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Selena', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl.', 'R', '2:27 AM', 2001, 'Yemen', '$9.94', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Gatekeepers, The', 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'R', '1:32 AM', 2006, 'Tanzania', '$6.52', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Hand of Peace: Pope Pius XII and the Holocaust, A', 'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.', 'NC-17', '1:13 AM', 2010, 'Zimbabwe', '$0.54', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Let''s Be Cops', 'Donec posuere metus vitae ipsum. Aliquam non mauris.', 'R', '1:39 AM', 2010, 'Poland', '$1.76', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Girls on the Road (a.k.a. Hot Summer Week)', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.', 'E', '1:38 AM', 2012, 'Syria', '$0.10', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Most Dangerous Game, The', 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'G', '1:01 AM', 2004, 'China', '$5.73', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Risky Business', 'Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.', 'PG-13', '1:17 AM', 1996, 'Philippines', '$4.96', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'U.S. vs. John Lennon, The', 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 'PG-13', '1:27 AM', 2010, 'Georgia', '$4.64', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'O Brother, Where Art Thou?', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', 'NC-17', '1:38 AM', 2001, 'France', '$4.14', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Day of the Triffids, The', 'Nullam varius. Nulla facilisi.', 'R', '1:44 AM', 1998, 'Russia', '$8.90', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'A Christmas Kiss', 'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.', 'E', '2:52 AM', 1968, 'Russia', '$0.21', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Ultramarines: A Warhammer 40,000 Movie', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.', 'PG-13', '2:44 AM', 1993, 'Peru', '$7.98', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Light Bulb Conspiracy, The', 'Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', 'G', '1:29 AM', 1994, 'Russia', '$1.80', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula '13th Warrior, The', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 'NC-17', '1:25 AM', 2003, 'Indonesia', '$5.40', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Starving Games, The', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.', 'PG', '2:48 AM', 2004, 'Malaysia', '$3.62', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Hitting Home', 'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'PG', '1:11 AM', 2005, 'Czech Republic', '$3.42', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Mysterious Origins of Man', 'Integer ac leo. Pellentesque ultrices mattis odio.', 'E', '2:59 AM', 2001, 'Indonesia', '$3.02', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Body of War', 'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', 'R', '2:55 AM', 2009, 'China', '$6.98', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Body of Evidence', 'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', 'R', '2:00 AM', 2003, 'Indonesia', '$4.01', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula '1, 2, 3, Sun (Un, deuz, trois, soleil)', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', 'E', '1:42 AM', 2011, 'Russia', '$6.92', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Chronicles (Cr�nicas)', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.', 'PG', '1:42 AM', 2011, 'Greece', '$3.05', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Guilty Hearts', 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'E', '2:12 AM', 2003, 'Turkmenistan', '$4.70', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Breaking Up', 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'G', '2:23 AM', 2007, 'China', '$5.24', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Dr. Ehrlich''s Magic Bullet', 'In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', 'PG', '2:54 AM', 1966, 'Russia', '$3.74', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Bye Bye Brazil (Bye Bye Brasil)', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 'NC-17', '1:07 AM', 2004, 'Switzerland', '$3.32', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Last Ride, The', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.', 'PG', '2:07 AM', 2009, 'Ukraine', '$8.04', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Dangerous Moves (La diagonale du fou)', 'Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.', 'PG', '2:43 AM', 1997, 'Indonesia', '$0.15', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Passion Fish', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.', 'NC-17', '1:32 AM', 2010, 'Russia', '$9.24', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Battery, The', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 'NC-17', '1:11 AM', 1968, 'Ethiopia', '$0.80', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Arctic Blast', 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'E', '1:19 AM', 2012, 'China', '$9.11', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Birdwatchers (BirdWatchers - La terra degli uomini rossi)', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', 'R', '2:44 AM', 1999, 'Egypt', '$6.53', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Misfits, The', 'Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.', 'PG-13', '1:20 AM', 2008, 'China', '$3.38', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Battle of Britain, The (Why We Fight, 4)', 'Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'PG', '1:26 AM', 2007, 'Venezuela', '$1.16', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'War of the Wildcats (In Old Oklahoma)', 'Ut at dolor quis odio consequat varius.', 'PG-13', '2:34 AM', 2005, 'Finland', '$4.18', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Lucky Them', 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.', 'R', '2:57 AM', 2005, 'China', '$0.52', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'First Day of the Rest of Your Life, The (Le premier jour du reste de ta vie)', 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 'R', '2:09 AM', 1989, 'Indonesia', '$9.10', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'First Shot', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'NC-17', '1:44 AM', 1994, 'Indonesia', '$3.99', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Men with Guns', 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.', 'PG', '2:28 AM', 2007, 'Netherlands', '$7.81', 'NULL', 'NULL' 
exec sp_insert_tbl_pelicula 'Grave Encounters', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', 'PG', '2:52 AM', 2005, 'Bulgaria', '$9.66', 'NULL', 'NULL' 





----------SOCIO
exec sp_insert_tbl_socio '114260441','Andres','Mejias','Gonzalez','andmejigo@gmail.com','87293508','50201','25m de la escuela Cerro Azul','Femenino','1989-11-08','foto_perfil'

---PELICULA
insert into tbl_pelicula(pel_titulo,pel_sinopsis,pel_clasificacion,pel_duracion,pel_a�o_publicacion,pel_pais,pel_precio,pel_portada,pel_trailer) values('Black Panther: Wakanda Forever','TChalla, rey de Wakanda, muere de una enfermedad que su hermana Shuri cree que podr�a haber sido curada por la "hierba en forma de coraz�n". Shuri ha estado intentando recrear sint�ticamente la hierba despu�s de que Killmonger la destruyera, pero no tiene �xito.','PG','02:41',2022,'Estados Unidos',6.65,'NULL','NULL' 
)

exec sp_insert_tbl_pelicula 'Black Panther: Wakanda Forever','TChalla, rey de Wakanda, muere de una enfermedad que su hermana Shuri cree que podr�a haber sido curada por la "hierba en forma de coraz�n". Shuri ha estado intentando recrear sint�ticamente la hierba despu�s de que Killmonger la destruyera, pero no tiene �xito.','PG','02:41',2022,'Estados Unidos',6.65,'NULL','NULL' 
