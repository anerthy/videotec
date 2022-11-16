Use DB_PROYECTO
go
--PROCEDIMIENTO PARA GUARDAR MARCA
CREATE PROC sp_RegistrarEmpresa(

	@emp_nombre varchar(15),
	@emp_telefono varchar(8),
	@emp_direccion text,
	@emp_correo varchar(50),
	@emp_logo varchar(500),
    @Resultado bit output

)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM tbl_empresa WHERE emp_nombre = @emp_nombre)

		insert into tbl_empresa(emp_nombre,emp_telefono,emp_direccion,emp_correo,emp_logo) values (
		@emp_nombre,@emp_telefono,@emp_direccion,@emp_correo,@emp_logo
		)
	ELSE
		SET @Resultado = 0
	
end

go

--------------------------------


--PROCEDIMIENTO PARA MODIFICAR MARCA
create procedure sp_ModificarEmpresa(
    @emp_id_empresa int,
    @emp_nombre varchar(15),
	@emp_telefono varchar(8),
	@emp_direccion text,
	@emp_correo varchar(50),
	@emp_logo varchar(500),
    @Resultado bit output

)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM tbl_empresa WHERE emp_nombre =@emp_nombre and emp_id_empresa != @emp_id_empresa)
		
		update tbl_empresa set 
		emp_nombre= @emp_nombre,
		emp_telefono = @emp_telefono,
		emp_direccion = @emp_direccion,
		emp_correo = @emp_correo,
		emp_logo = @emp_logo

		where emp_id_empresa = @emp_id_empresa
	ELSE
		SET @Resultado = 0

end