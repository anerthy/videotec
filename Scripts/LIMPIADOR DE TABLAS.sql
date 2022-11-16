declare @i int = 0
while (@i < (select count(*) from tbl_genero_pelicula where gen_imagen != NULL))
begin
	update tbl_genero_pelicula set gen_imagen = NULL where gen_id_genero = (select top 1 gen_id_genero from tbl_genero_pelicula where gen_imagen <> NULL)
end

select * from tbl_genero_pelicula


