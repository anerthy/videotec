declare @i int = 0
while (@i < (select count(*) from tbl_pelicula where pel_portada <> '1'))
begin
	update tbl_pelicula set pel_portada = NULL where pel_id_pelicula = (select top 1 pel_id_pelicula from tbl_pelicula where pel_portada <> '1')
end

select * from tbl_pelicula
select * from tbl_bitacora_prestamo

