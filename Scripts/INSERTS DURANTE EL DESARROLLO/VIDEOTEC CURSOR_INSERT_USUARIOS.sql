declare
@user_nombre varchar(35),
@user_correo varchar(50),
@contrase�a varchar(75),
@user_rol_id int = 3,
@user_foto varchar(50)
declare soc_user_cursor cursor for
select soc_cedula,soc_correo,soc_nombre,soc_foto_perfil from tbl_socio

open soc_user_cursor
fetch soc_user_cursor into @user_nombre,@user_correo,@contrase�a,@user_foto

while (@@FETCH_STATUS=0)
begin
	
	set @contrase�a = (@contrase�a + '123')
	exec sp_insert_tbl_usuario @user_nombre,@user_correo,@contrase�a,@user_rol_id, @user_foto

	fetch soc_user_cursor into @user_nombre,@user_correo,@contrase�a,@user_foto

end
close soc_user_cursor
deallocate soc_user_cursor
