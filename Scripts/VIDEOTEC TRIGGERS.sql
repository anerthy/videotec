-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<trigger que actualiza el campo stock_cintas de la pelicula al insertar o eliminar una cinta>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_recalcular_stock_cintas
on tbl_cinta
AFTER INSERT, DELETE
AS
	BEGIN
		declare @pelicula1 varchar(8),@pelicula2 varchar(8), @stock int
		
		set @pelicula1 = (select cin_pelicula_id from inserted)
		set @pelicula2 = (select cin_pelicula_id from deleted)

		set @stock = (select count(cin_numero_cinta) from tbl_cinta where cin_pelicula_id in (@pelicula1,@pelicula2))

		update tbl_pelicula set pel_stock_cintas = @stock where pel_id_pelicula in (@pelicula1,@pelicula2)
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<trigger que actualiza la disponibilidad de una pelicula>
-- =============================================
USE VIDEOTEC
GO
CREATE trigger tr_validar_disponibilidad_pelicula
on tbl_cinta
AFTER INSERT, UPDATE, DELETE
AS
	BEGIN
		declare @pelicula1 varchar(8),@pelicula2 varchar(8),@cintas int
		
		set @pelicula1 = (select cin_pelicula_id from inserted)
		set @pelicula2 = (select cin_pelicula_id from deleted)

		set @cintas = (select count(cin_numero_cinta) from tbl_cinta where cin_pelicula_id in (@pelicula1,@pelicula2) and (cin_estado = 'Disponible'))

		if  @cintas <> 0
		begin
			update tbl_pelicula set pel_disponibilidad = 'Disponible' where pel_id_pelicula in (@pelicula1,@pelicula2)
		end
		else
		begin
			update tbl_pelicula set pel_disponibilidad = 'No disponible' where pel_id_pelicula in (@pelicula1,@pelicula2)
		end
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<trigger que cuando se ingresa una cinta a la tabla detalle_prestamo actualiza el estado de esa cinta a Prestada>
-- =============================================
USE VIDEOTEC
GO
CREATE trigger tr_actualizar_estado_cinta
on tbl_detalle_prestamo
AFTER INSERT
AS
	BEGIN
		declare @cinta varchar(13)
		
		set @cinta = (select det_pres_numero_cinta from inserted)

		update tbl_cinta set cin_estado = 'Prestada' where cin_numero_cinta = @cinta
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<trigger que cuando se ingresa una cinta a la tabla devolucion_cinta actualiza el estado de esa cinta a Disponible>
-- =============================================
USE VIDEOTEC
GO
CREATE trigger tr_actualizar_estado_cinta_disponible
on tbl_devolucion_cinta
AFTER INSERT
AS
	BEGIN
		declare @cinta varchar(13)
		
		set @cinta = (select del_cin_numero_cinta from inserted)

		update tbl_cinta set cin_estado = 'Disponible' where cin_numero_cinta = @cinta
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/10/29>
-- Description:	<trigger que actualiza el precio total de un prestamo>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_calcular_precio_total_01
on tbl_detalle_prestamo
AFTER INSERT, UPDATE
AS
	BEGIN
		declare @prestamo int, @precio money = 0
		
		set @prestamo = (select det_pres_prestamo_id from inserted)

		set @precio = (select sum(det_pres_sub_total) from tbl_detalle_prestamo where det_pres_prestamo_id = @prestamo)
		update tbl_prestamo set pres_precio_total = @precio where pres_id_prestamo = @prestamo
	END
GO

USE VIDEOTEC
GO
create trigger tr_calcular_precio_total_02
on tbl_detalle_prestamo
AFTER DELETE
AS
	BEGIN
		declare @prestamo int, @precio money = 0
		
		set @prestamo = (select det_pres_prestamo_id from deleted)

		set @precio = (select det_pres_sub_total from deleted)
		update tbl_prestamo set pres_precio_total = (pres_precio_total - @precio) where pres_id_prestamo = @prestamo
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/12>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_detalle_prestamo>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_registro_prestamo
on tbl_detalle_prestamo
AFTER INSERT
AS
	BEGIN
		declare @reg_pres_numero_cinta varchar(13),
		@reg_pres_codigo_socio varchar(12),
		@reg_pres_fecha_prestamo datetime,
		@reg_pres_fecha_devolucion datetime

		set @reg_pres_numero_cinta = (select det_pres_numero_cinta from inserted)
		set @reg_pres_codigo_socio = (select pres_codigo_socio from inserted inner join tbl_prestamo on det_pres_prestamo_id = pres_id_prestamo)
		set @reg_pres_fecha_prestamo = (select pres_fecha_prestamo from inserted inner join tbl_prestamo on det_pres_prestamo_id = pres_id_prestamo)
		set @reg_pres_fecha_devolucion = (select pres_fecha_devolucion from inserted inner join tbl_prestamo on det_pres_prestamo_id = pres_id_prestamo)

		exec sp_insert_tbl_registro_prestamos @reg_pres_numero_cinta,@reg_pres_codigo_socio,@reg_pres_fecha_prestamo,@reg_pres_fecha_devolucion
	END
GO

---------------------------
-- TRIGGERS DE BITACORA  --
---------------------------

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/4>
-- Description:	<trigger que registra los inserts que se realizan en la tabla idioma>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_idm
on tbl_idioma
AFTER INSERT
AS
	BEGIN
		declare @bit_idm_idioma_id varchar(3)
		set @bit_idm_idioma_id = (select idm_id_idioma from inserted)

		insert into tbl_bitacora_idioma(bit_idm_usuario,bit_idm_idioma_id,bit_idm_accion)
		values(CURRENT_USER,@bit_idm_idioma_id,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/4>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla idioma>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_idm
on tbl_idioma
AFTER UPDATE
AS
	BEGIN
		declare @bit_idm_idioma_id varchar(3)
		set @bit_idm_idioma_id = (select idm_id_idioma from inserted)

		insert into tbl_bitacora_idioma(bit_idm_usuario,bit_idm_idioma_id,bit_idm_accion)
		values(CURRENT_USER,@bit_idm_idioma_id,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/4>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla idioma>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_idm
on tbl_idioma
AFTER DELETE
AS
	BEGIN
		declare @bit_idm_idioma_id varchar(3)
		set @bit_idm_idioma_id = (select idm_id_idioma from deleted)

		insert into tbl_bitacora_idioma(bit_idm_usuario,bit_idm_idioma_id,bit_idm_accion)
		values(CURRENT_USER,@bit_idm_idioma_id,'DELETE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra los inserts que se realizan en la tabla empresa>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_emp
on tbl_empresa
AFTER INSERT
AS
	BEGIN
		declare @bit_emp_empresa int
		set @bit_emp_empresa = (select emp_id_empresa from inserted)

		insert into tbl_bitacora_empresa(bit_emp_empresa,bit_emp_accion)
		values(@bit_emp_empresa,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla empresa>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_emp
on tbl_empresa
AFTER UPDATE
AS
	BEGIN
		declare @bit_emp_empresa int
		set @bit_emp_empresa = (select emp_id_empresa from inserted)

		insert into tbl_bitacora_empresa(bit_emp_empresa,bit_emp_accion)
		values(@bit_emp_empresa,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla empresa>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_emp
on tbl_empresa
AFTER DELETE
AS
	BEGIN
		declare @bit_emp_empresa int
		set @bit_emp_empresa = (select emp_id_empresa from deleted)

		insert into tbl_bitacora_empresa(bit_emp_empresa,bit_emp_accion)
		values(@bit_emp_empresa,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_genero_pelicula>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_gen
on tbl_genero_pelicula
AFTER INSERT
AS
	BEGIN
		declare @bit_gen_genero_pelicula int
		set @bit_gen_genero_pelicula = (select gen_id_genero from inserted)

		insert into tbl_bitacora_genero_pelicula(bit_gen_genero_pelicula,bit_gen_accion)
		values(@bit_gen_genero_pelicula,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_genero_pelicula>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_gen
on tbl_genero_pelicula
AFTER UPDATE
AS
	BEGIN
		declare @bit_gen_genero_pelicula int
		set @bit_gen_genero_pelicula = (select gen_id_genero from inserted)

		insert into tbl_bitacora_genero_pelicula(bit_gen_genero_pelicula,bit_gen_accion)
		values(@bit_gen_genero_pelicula,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_genero_pelicula>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_gen
on tbl_genero_pelicula
AFTER DELETE
AS
	BEGIN
		declare @bit_gen_genero_pelicula int
		set @bit_gen_genero_pelicula = (select gen_id_genero from deleted)

		insert into tbl_bitacora_genero_pelicula(bit_gen_genero_pelicula,bit_gen_accion)
		values(@bit_gen_genero_pelicula,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_actor>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_act
on tbl_actor
AFTER INSERT
AS
	BEGIN
		declare @bit_act_actor int
		set @bit_act_actor = (select act_id_actor from inserted)

		insert into tbl_bitacora_actor(bit_act_actor,bit_act_accion)
		values(@bit_act_actor,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_actor>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_act
on tbl_actor
AFTER UPDATE
AS
	BEGIN
		declare @bit_act_actor int
		set @bit_act_actor = (select act_id_actor from inserted)

		insert into tbl_bitacora_actor(bit_act_actor,bit_act_accion)
		values(@bit_act_actor,'UPDATE')		
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_actor>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_act
on tbl_actor
AFTER DELETE
AS
	BEGIN
		declare @bit_act_actor int
		set @bit_act_actor = (select act_id_actor from deleted)

		insert into tbl_bitacora_actor(bit_act_actor,bit_act_accion)
		values(@bit_act_actor,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_productora>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_prod
on tbl_productora
AFTER INSERT
AS
	BEGIN
		declare @bit_prod_productora int
		set @bit_prod_productora = (select prod_id_productora from inserted)

		insert into tbl_bitacora_productora(bit_prod_productora,bit_prod_accion)
		values(@bit_prod_productora,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_actor>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_prod
on tbl_productora
AFTER UPDATE
AS
	BEGIN
		declare @bit_prod_productora int
		set @bit_prod_productora = (select prod_id_productora from inserted)

		insert into tbl_bitacora_productora(bit_prod_productora,bit_prod_accion)
		values(@bit_prod_productora,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_productora>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_prod
on tbl_productora
AFTER DELETE
AS
	BEGIN
		declare @bit_prod_productora int
		set @bit_prod_productora = (select prod_id_productora from deleted)

		insert into tbl_bitacora_productora(bit_prod_productora,bit_prod_accion)
		values(@bit_prod_productora,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_director>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_dir
on tbl_director
AFTER INSERT
AS
	BEGIN
		declare @bit_dir_director int
		set @bit_dir_director = (select dir_id_director from inserted)

		insert into tbl_bitacora_director(bit_dir_director,bit_dir_accion)
		values(@bit_dir_director,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_director>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_dir
on tbl_director
AFTER UPDATE
AS
	BEGIN
		declare @bit_dir_director int
		set @bit_dir_director = (select dir_id_director from inserted)

		insert into tbl_bitacora_director(bit_dir_director,bit_dir_accion)
		values(@bit_dir_director,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_director>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_dir
on tbl_director
AFTER DELETE
AS
	BEGIN
		declare @bit_dir_director int
		set @bit_dir_director = (select dir_id_director from deleted)

		insert into tbl_bitacora_director(bit_dir_director,bit_dir_accion)
		values(@bit_dir_director,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_pelicula>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_pel
on tbl_pelicula
AFTER INSERT
AS
	BEGIN
		declare @bit_pel_pelicula varchar(8)
		set @bit_pel_pelicula = (select pel_id_pelicula from inserted)

		insert into tbl_bitacora_pelicula(bit_pel_pelicula,bit_pel_accion)
		values(@bit_pel_pelicula,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_pelicula>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_pel
on tbl_pelicula
AFTER UPDATE
AS
	BEGIN
		declare @bit_pel_pelicula varchar(8)
		set @bit_pel_pelicula = (select pel_id_pelicula from inserted)

		insert into tbl_bitacora_pelicula(bit_pel_pelicula,bit_pel_accion)
		values(@bit_pel_pelicula,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_pelicula>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_pel
on tbl_pelicula
AFTER DELETE
AS
	BEGIN
		declare @bit_pel_pelicula varchar(8)
		set @bit_pel_pelicula = (select pel_id_pelicula from deleted)

		insert into tbl_bitacora_pelicula(bit_pel_pelicula,bit_pel_accion)
		values(@bit_pel_pelicula,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_socio>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_soc
on tbl_socio
AFTER INSERT
AS
	BEGIN
		declare @bit_soc_socio varchar(12)
		set @bit_soc_socio = (select soc_codigo_socio from inserted)

		insert into tbl_bitacora_socio(bit_soc_socio,bit_soc_accion)
		values(@bit_soc_socio,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_socio>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_soc
on tbl_socio
AFTER UPDATE
AS
	BEGIN
		declare @bit_soc_socio varchar(12)
		set @bit_soc_socio = (select soc_codigo_socio from inserted)

		insert into tbl_bitacora_socio(bit_soc_socio,bit_soc_accion)
		values(@bit_soc_socio,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_socio>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_soc
on tbl_socio
AFTER DELETE
AS
	BEGIN
		declare @bit_soc_socio varchar(12)
		set @bit_soc_socio = (select soc_codigo_socio from deleted)

		insert into tbl_bitacora_socio(bit_soc_socio,bit_soc_accion)
		values(@bit_soc_socio,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_cinta>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_cin
on tbl_cinta
AFTER INSERT
AS
	BEGIN
		declare @bit_cin_cinta varchar(13)
		set @bit_cin_cinta = (select cin_numero_cinta from inserted)

		insert into tbl_bitacora_cinta(bit_cin_cinta,bit_cin_accion)
		values(@bit_cin_cinta,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_cinta>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_cin
on tbl_cinta
AFTER UPDATE
AS
	BEGIN
		declare @bit_cin_cinta varchar(13)
		set @bit_cin_cinta = (select cin_numero_cinta from inserted)

		insert into tbl_bitacora_cinta(bit_cin_cinta,bit_cin_accion)
		values(@bit_cin_cinta,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_cinta>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_cin
on tbl_cinta
AFTER DELETE
AS
	BEGIN
		declare @bit_cin_cinta varchar(13)
		set @bit_cin_cinta = (select cin_numero_cinta from deleted)

		insert into tbl_bitacora_cinta(bit_cin_cinta,bit_cin_accion)
		values(@bit_cin_cinta,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_usuario>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_user
on tbl_usuario
AFTER INSERT
AS
	BEGIN
		declare @bit_user_usuario_id int
		set @bit_user_usuario_id = (select user_id_usuario from inserted)

		insert into tbl_bitacora_usuario(bit_user_usuario_id,bit_user_accion)
		values(@bit_user_usuario_id,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_usuario>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_user
on tbl_usuario
AFTER UPDATE
AS
	BEGIN
		declare @bit_user_usuario_id int
		set @bit_user_usuario_id = (select user_id_usuario from inserted)

		insert into tbl_bitacora_usuario(bit_user_usuario_id,bit_user_accion)
		values(@bit_user_usuario_id,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_usuario>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_user
on tbl_usuario
AFTER DELETE
AS
	BEGIN
		declare @bit_user_usuario_id int
		set @bit_user_usuario_id = (select user_id_usuario from deleted)

		insert into tbl_bitacora_usuario(bit_user_usuario_id,bit_user_accion)
		values(@bit_user_usuario_id,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_rol>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_rol
on tbl_rol
AFTER INSERT
AS
	BEGIN
		declare @bit_rol_rol int
		set @bit_rol_rol = (select rol_id_rol from inserted)

		insert into tbl_bitacora_rol(bit_rol_rol,bit_rol_accion)
		values(@bit_rol_rol,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_rol>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_rol
on tbl_rol
AFTER UPDATE
AS
	BEGIN
		declare @bit_rol_rol int
		set @bit_rol_rol = (select rol_id_rol from inserted)

		insert into tbl_bitacora_rol(bit_rol_rol,bit_rol_accion)
		values(@bit_rol_rol,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_rol>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_rol
on tbl_rol
AFTER DELETE
AS
	BEGIN
		declare @bit_rol_rol int
		set @bit_rol_rol = (select rol_id_rol from deleted)

		insert into tbl_bitacora_rol(bit_rol_rol,bit_rol_accion)
		values(@bit_rol_rol,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_prestamo>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_pres
on tbl_prestamo
AFTER INSERT
AS
	BEGIN
		declare @bit_pres_prestamo int
		set @bit_pres_prestamo = (select pres_id_prestamo from inserted)

		insert into tbl_bitacora_prestamo(bit_pres_prestamo,bit_pres_accion)
		values(@bit_pres_prestamo,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_prestamo>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_pres
on tbl_prestamo
AFTER UPDATE
AS
	BEGIN
		declare @bit_pres_prestamo int
		set @bit_pres_prestamo = (select pres_id_prestamo from inserted)

		insert into tbl_bitacora_prestamo(bit_pres_prestamo,bit_pres_accion)
		values(@bit_pres_prestamo,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_prestamo>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_pres
on tbl_prestamo
AFTER DELETE
AS
	BEGIN
		declare @bit_pres_prestamo int
		set @bit_pres_prestamo = (select pres_id_prestamo from deleted)

		insert into tbl_bitacora_prestamo(bit_pres_prestamo,bit_pres_accion)
		values(@bit_pres_prestamo,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_detalle_prestamo>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_det_pres
on tbl_detalle_prestamo
AFTER INSERT
AS
	BEGIN
		declare @bit_det_pres_detalle_prestamo int
		set @bit_det_pres_detalle_prestamo = (select det_pres_id_detalle_prestamo from inserted)

		insert into tbl_bitacora_detalle_prestamo(bit_det_pres_detalle_prestamo,bit_det_pres_accion)
		values(@bit_det_pres_detalle_prestamo,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_detalle_prestamo>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_det_pres
on tbl_detalle_prestamo
AFTER UPDATE
AS
	BEGIN
		declare @bit_det_pres_detalle_prestamo int
		set @bit_det_pres_detalle_prestamo = (select det_pres_id_detalle_prestamo from inserted)

		insert into tbl_bitacora_detalle_prestamo(bit_det_pres_detalle_prestamo,bit_det_pres_accion)
		values(@bit_det_pres_detalle_prestamo,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_detalle_prestamo>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_det_pres
on tbl_detalle_prestamo
AFTER DELETE
AS
	BEGIN
		declare @bit_det_pres_detalle_prestamo int
		set @bit_det_pres_detalle_prestamo = (select det_pres_id_detalle_prestamo from deleted)

		insert into tbl_bitacora_detalle_prestamo(bit_det_pres_detalle_prestamo,bit_det_pres_accion)
		values(@bit_det_pres_detalle_prestamo,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_carrito_compra>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_carr
on tbl_carrito_compra
AFTER INSERT
AS
	BEGIN
		declare @bit_carr_carrito_compra int
		set @bit_carr_carrito_compra = (select carr_id_carrito from inserted)

		insert into tbl_bitacora_carrito_compra(bit_carr_carrito_compra,bit_carr_accion)
		values(@bit_carr_carrito_compra,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_carrito_compra>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_carr
on tbl_carrito_compra
AFTER UPDATE
AS
	BEGIN
		declare @bit_carr_carrito_compra int
		set @bit_carr_carrito_compra = (select carr_id_carrito from inserted)

		insert into tbl_bitacora_carrito_compra(bit_carr_carrito_compra,bit_carr_accion)
		values(@bit_carr_carrito_compra,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_carrito_compra>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_carr
on tbl_carrito_compra
AFTER DELETE
AS
	BEGIN
		declare @bit_carr_carrito_compra int
		set @bit_carr_carrito_compra = (select carr_id_carrito from deleted)

		insert into tbl_bitacora_carrito_compra(bit_carr_carrito_compra,bit_carr_accion)
		values(@bit_carr_carrito_compra,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_subtitulos_cinta>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_sub
on tbl_subtitulos_cinta
AFTER INSERT
AS
	BEGIN
		declare @bit_sub_subtitulos_cinta int
		set @bit_sub_subtitulos_cinta = (select sub_subtitulos_cinta from inserted)

		insert into tbl_bitacora_subtitulos_cinta(bit_sub_subtitulos_cinta,bit_sub_accion)
		values(@bit_sub_subtitulos_cinta,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_subtitulos_cinta>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_sub
on tbl_subtitulos_cinta
AFTER UPDATE
AS
	BEGIN
		declare @bit_sub_subtitulos_cinta int
		set @bit_sub_subtitulos_cinta = (select sub_subtitulos_cinta from inserted)

		insert into tbl_bitacora_subtitulos_cinta(bit_sub_subtitulos_cinta,bit_sub_accion)
		values(@bit_sub_subtitulos_cinta,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_subtitulos_cinta>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_sub
on tbl_subtitulos_cinta
AFTER DELETE
AS
	BEGIN
		declare @bit_sub_subtitulos_cinta int
		set @bit_sub_subtitulos_cinta = (select sub_subtitulos_cinta from deleted)

		insert into tbl_bitacora_subtitulos_cinta(bit_sub_subtitulos_cinta,bit_sub_accion)
		values(@bit_sub_subtitulos_cinta,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_pelicula_genero>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_pel_gen
on tbl_pelicula_genero
AFTER INSERT
AS
	BEGIN
		declare @bit_pel_gen_pelicula_genero int
		set @bit_pel_gen_pelicula_genero = (select pel_gen_id_pelicula_genero from inserted)

		insert into tbl_bitacora_pelicula_genero(bit_pel_gen_pelicula_genero,bit_pel_gen_accion)
		values(@bit_pel_gen_pelicula_genero,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_pelicula_genero>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_pel_gen
on tbl_pelicula_genero
AFTER UPDATE
AS
	BEGIN
		declare @bit_pel_gen_pelicula_genero int
		set @bit_pel_gen_pelicula_genero = (select pel_gen_id_pelicula_genero from inserted)

		insert into tbl_bitacora_pelicula_genero(bit_pel_gen_pelicula_genero,bit_pel_gen_accion)
		values(@bit_pel_gen_pelicula_genero,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/8>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_pelicula_genero>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_pel_gen
on tbl_pelicula_genero
AFTER DELETE
AS
	BEGIN
		declare @bit_pel_gen_pelicula_genero int
		set @bit_pel_gen_pelicula_genero = (select pel_gen_id_pelicula_genero from deleted)

		insert into tbl_bitacora_pelicula_genero(bit_pel_gen_pelicula_genero,bit_pel_gen_accion)
		values(@bit_pel_gen_pelicula_genero,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_pelicula_actor>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_pel_act
on tbl_pelicula_actor
AFTER INSERT
AS
	BEGIN
		declare @bit_pel_act_id_bitacora_pelicula_actor int
		set @bit_pel_act_id_bitacora_pelicula_actor = (select pel_act_id_pelicula_actor from inserted)

		insert into tbl_bitacora_pelicula_actor(bit_pel_act_pelicula_actor,bit_pel_act_accion)
		values(@bit_pel_act_id_bitacora_pelicula_actor,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_pelicula_actor>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_pel_act
on tbl_pelicula_actor
AFTER UPDATE
AS
	BEGIN
		declare @bit_pel_act_id_bitacora_pelicula_actor int
		set @bit_pel_act_id_bitacora_pelicula_actor = (select pel_act_id_pelicula_actor from inserted)

		insert into tbl_bitacora_pelicula_actor(bit_pel_act_pelicula_actor,bit_pel_act_accion)
		values(@bit_pel_act_id_bitacora_pelicula_actor,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_pelicula_actor>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_pel_act
on tbl_pelicula_actor
AFTER DELETE
AS
	BEGIN
		declare @bit_pel_act_id_bitacora_pelicula_actor int
		set @bit_pel_act_id_bitacora_pelicula_actor = (select pel_act_id_pelicula_actor from deleted)

		insert into tbl_bitacora_pelicula_actor(bit_pel_act_pelicula_actor,bit_pel_act_accion)
		values(@bit_pel_act_id_bitacora_pelicula_actor,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_pelicula_productora>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_pel_prod
on tbl_pelicula_productora
AFTER INSERT
AS
	BEGIN
		declare @bit_pel_prod_pelicula_productora int
		set @bit_pel_prod_pelicula_productora = (select pel_prod_id_pelicula_productora from inserted)

		insert into tbl_bitacora_pelicula_productora(bit_pel_prod_pelicula_productora,bit_pel_prod_accion)
		values(@bit_pel_prod_pelicula_productora,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_pelicula_productora>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_pel_prod
on tbl_pelicula_productora
AFTER UPDATE
AS
	BEGIN
		declare @bit_pel_prod_pelicula_productora int
		set @bit_pel_prod_pelicula_productora = (select pel_prod_id_pelicula_productora from inserted)

		insert into tbl_bitacora_pelicula_productora(bit_pel_prod_pelicula_productora,bit_pel_prod_accion)
		values(@bit_pel_prod_pelicula_productora,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_pelicula_productora>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_pel_prod
on tbl_pelicula_productora
AFTER DELETE
AS
	BEGIN
		declare @bit_pel_prod_pelicula_productora int
		set @bit_pel_prod_pelicula_productora = (select pel_prod_id_pelicula_productora from deleted)

		insert into tbl_bitacora_pelicula_productora(bit_pel_prod_pelicula_productora,bit_pel_prod_accion)
		values(@bit_pel_prod_pelicula_productora,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_pelicula_director>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_pel_dir
on tbl_pelicula_director
AFTER INSERT
AS
	BEGIN
		declare @bit_pel_dir_pelicula_director int
		set @bit_pel_dir_pelicula_director = (select pel_dir_id_pelicula_director from inserted)

		insert into tbl_bitacora_pelicula_director(bit_pel_dir_pelicula_director,bit_pel_dir_accion)
		values(@bit_pel_dir_pelicula_director,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_pelicula_director>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_pel_dir
on tbl_pelicula_director
AFTER UPDATE
AS
	BEGIN
		declare @bit_pel_dir_pelicula_director int
		set @bit_pel_dir_pelicula_director = (select pel_dir_id_pelicula_director from inserted)

		insert into tbl_bitacora_pelicula_director(bit_pel_dir_pelicula_director,bit_pel_dir_accion)
		values(@bit_pel_dir_pelicula_director,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_pelicula_director>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_pel_dir
on tbl_pelicula_director
AFTER DELETE
AS
	BEGIN
		declare @bit_pel_dir_pelicula_director int
		set @bit_pel_dir_pelicula_director = (select pel_dir_id_pelicula_director from deleted)

		insert into tbl_bitacora_pelicula_director(bit_pel_dir_pelicula_director,bit_pel_dir_accion)
		values(@bit_pel_dir_pelicula_director,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_lista_espera>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_list
on tbl_lista_espera
AFTER INSERT
AS
	BEGIN
		declare @bit_list_lista_espera int
		set @bit_list_lista_espera = (select list_id_lista_espera from inserted)

		insert into tbl_bitacora_lista_espera(bit_list_lista_espera,bit_list_accion)
		values(@bit_list_lista_espera,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_lista_espera>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_list
on tbl_lista_espera
AFTER UPDATE
AS
	BEGIN
		declare @bit_list_lista_espera int
		set @bit_list_lista_espera = (select list_id_lista_espera from inserted)

		insert into tbl_bitacora_lista_espera(bit_list_lista_espera,bit_list_accion)
		values(@bit_list_lista_espera,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_lista_espera>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_list
on tbl_lista_espera
AFTER DELETE
AS
	BEGIN
		declare @bit_list_lista_espera int
		set @bit_list_lista_espera = (select list_id_lista_espera from deleted)

		insert into tbl_bitacora_lista_espera(bit_list_lista_espera,bit_list_accion)
		values(@bit_list_lista_espera,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_llamada>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_lla
on tbl_llamada
AFTER INSERT
AS
	BEGIN
		declare @bit_lla_llamada int
		set @bit_lla_llamada = (select lla_id_llamada from inserted)

		insert into tbl_bitacora_llamada(bit_lla_llamada,bit_lla_accion)
		values(@bit_lla_llamada,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_llamada>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_lla
on tbl_llamada
AFTER UPDATE
AS
	BEGIN
		declare @bit_lla_llamada int
		set @bit_lla_llamada = (select lla_id_llamada from inserted)

		insert into tbl_bitacora_llamada(bit_lla_llamada,bit_lla_accion)
		values(@bit_lla_llamada,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_llamada>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_lla
on tbl_llamada
AFTER DELETE
AS
	BEGIN
		declare @bit_lla_llamada int
		set @bit_lla_llamada = (select lla_id_llamada from deleted)

		insert into tbl_bitacora_llamada(bit_lla_llamada,bit_lla_accion)
		values(@bit_lla_llamada,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_socio_actor>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_soc_act
on tbl_socio_actor
AFTER INSERT
AS
	BEGIN
		declare @bit_soc_act_socio_actor int
		set @bit_soc_act_socio_actor = (select soc_act_id_socio_actor from inserted)

		insert into tbl_bitacora_socio_actor(bit_soc_act_socio_actor,bit_soc_act_accion)
		values(@bit_soc_act_socio_actor,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_socio_actor>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_soc_act
on tbl_socio_actor
AFTER UPDATE
AS
	BEGIN
		declare @bit_soc_act_socio_actor int
		set @bit_soc_act_socio_actor = (select soc_act_id_socio_actor from inserted)

		insert into tbl_bitacora_socio_actor(bit_soc_act_socio_actor,bit_soc_act_accion)
		values(@bit_soc_act_socio_actor,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_socio_actor>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_soc_act
on tbl_socio_actor
AFTER DELETE
AS
	BEGIN
		declare @bit_soc_act_socio_actor int
		set @bit_soc_act_socio_actor = (select soc_act_id_socio_actor from deleted)

		insert into tbl_bitacora_socio_actor(bit_soc_act_socio_actor,bit_soc_act_accion)
		values(@bit_soc_act_socio_actor,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_socio_genero>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_soc_gen
on tbl_socio_genero
AFTER INSERT
AS
	BEGIN
		declare @bit_soc_gen_socio_genero int
		set @bit_soc_gen_socio_genero = (select soc_gen_id_socio_genero from inserted)

		insert into tbl_bitacora_socio_genero(bit_soc_gen_socio_genero,bit_soc_gen_accion)
		values(@bit_soc_gen_socio_genero,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_socio_genero>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_soc_gen
on tbl_socio_genero
AFTER UPDATE
AS
	BEGIN
		declare @bit_soc_gen_socio_genero int
		set @bit_soc_gen_socio_genero = (select soc_gen_id_socio_genero from inserted)

		insert into tbl_bitacora_socio_genero(bit_soc_gen_socio_genero,bit_soc_gen_accion)
		values(@bit_soc_gen_socio_genero,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_socio_genero>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_soc_gen
on tbl_socio_genero
AFTER DELETE
AS
	BEGIN
		declare @bit_soc_gen_socio_genero int
		set @bit_soc_gen_socio_genero = (select soc_gen_id_socio_genero from deleted)

		insert into tbl_bitacora_socio_genero(bit_soc_gen_socio_genero,bit_soc_gen_accion)
		values(@bit_soc_gen_socio_genero,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_socio_director>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_soc_dir
on tbl_socio_director
AFTER INSERT
AS
	BEGIN
		declare @bit_soc_dir_socio_director int
		set @bit_soc_dir_socio_director = (select soc_dir_id_socio_director from inserted)

		insert into tbl_bitacora_socio_director(bit_soc_dir_socio_director,bit_soc_dir_accion)
		values(@bit_soc_dir_socio_director,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_socio_director>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_soc_dir
on tbl_socio_director
AFTER UPDATE
AS
	BEGIN
		declare @bit_soc_dir_socio_director int
		set @bit_soc_dir_socio_director = (select soc_dir_id_socio_director from inserted)

		insert into tbl_bitacora_socio_director(bit_soc_dir_socio_director,bit_soc_dir_accion)
		values(@bit_soc_dir_socio_director,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_socio_director>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_soc_dir
on tbl_socio_director
AFTER DELETE
AS
	BEGIN
		declare @bit_soc_dir_socio_director int
		set @bit_soc_dir_socio_director = (select soc_dir_id_socio_director from deleted)

		insert into tbl_bitacora_socio_director(bit_soc_dir_socio_director,bit_soc_dir_accion)
		values(@bit_soc_dir_socio_director,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_devolucion_cinta>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_del_cin
on tbl_devolucion_cinta
AFTER INSERT
AS
	BEGIN
		declare @bit_del_cin_devolucion_cinta int
		set @bit_del_cin_devolucion_cinta = (select del_cin_id_devolucion_cinta from inserted)

		insert into tbl_bitacora_devolucion_cinta(bit_del_cin_devolucion_cinta,bit_del_cin_accion)
		values(@bit_del_cin_devolucion_cinta,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_devolucion_cinta>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_del_cin
on tbl_devolucion_cinta
AFTER UPDATE
AS
	BEGIN
		declare @bit_del_cin_devolucion_cinta int
		set @bit_del_cin_devolucion_cinta = (select del_cin_id_devolucion_cinta from inserted)

		insert into tbl_bitacora_devolucion_cinta(bit_del_cin_devolucion_cinta,bit_del_cin_accion)
		values(@bit_del_cin_devolucion_cinta,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_devolucion_cinta>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_del_cin
on tbl_devolucion_cinta
AFTER DELETE
AS
	BEGIN
		declare @bit_del_cin_devolucion_cinta int
		set @bit_del_cin_devolucion_cinta = (select del_cin_id_devolucion_cinta from deleted)

		insert into tbl_bitacora_devolucion_cinta(bit_del_cin_devolucion_cinta,bit_del_cin_accion)
		values(@bit_del_cin_devolucion_cinta,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_registro_prestamos>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_reg_pres
on tbl_registro_prestamos
AFTER INSERT
AS
	BEGIN
		declare @bit_reg_cin_registro_prestamos int
		set @bit_reg_cin_registro_prestamos = (select reg_pres_id_registro_prestamos from inserted)

		insert into tbl_bitacora_registro_prestamos(bit_reg_cin_registro_prestamos,bit_reg_cin_accion)
		values(@bit_reg_cin_registro_prestamos,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_registro_prestamos>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_reg_pres
on tbl_registro_prestamos
AFTER UPDATE
AS
	BEGIN
		declare @bit_reg_cin_registro_prestamos int
		set @bit_reg_cin_registro_prestamos = (select reg_pres_id_registro_prestamos from inserted)

		insert into tbl_bitacora_registro_prestamos(bit_reg_cin_registro_prestamos,bit_reg_cin_accion)
		values(@bit_reg_cin_registro_prestamos,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/9>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_registro_prestamos>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_reg_pres
on tbl_registro_prestamos
AFTER DELETE
AS
	BEGIN
		declare @bit_reg_cin_registro_prestamos int
		set @bit_reg_cin_registro_prestamos = (select reg_pres_id_registro_prestamos from deleted)

		insert into tbl_bitacora_registro_prestamos(bit_reg_cin_registro_prestamos,bit_reg_cin_accion)
		values(@bit_reg_cin_registro_prestamos,'DELETE')
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/10>
-- Description:	<trigger que registra los inserts que se realizan en la tabla tbl_socio_usuario>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_insert_bitacora_soc_user
on tbl_socio_usuario
AFTER INSERT
AS
	BEGIN
		declare @bit_soc_user_socio_usuario int
		set @bit_soc_user_socio_usuario = (select soc_user_id_socio_usuario from inserted)

		insert into tbl_bitacora_socio_usuario(bit_soc_user_socio_usuario,bit_soc_user_accion)
		values(@bit_soc_user_socio_usuario,'INSERT')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/10>
-- Description:	<trigger que registra las actualizaciones que se realizan en la tabla tbl_socio_usuario>
-- =============================================
USE VIDEOTEC
GO
create trigger tr_update_bitacora_soc_user
on tbl_socio_usuario
AFTER UPDATE
AS
	BEGIN
		declare @bit_soc_user_socio_usuario int
		set @bit_soc_user_socio_usuario = (select soc_user_id_socio_usuario from inserted)

		insert into tbl_bitacora_socio_usuario(bit_soc_user_socio_usuario,bit_soc_user_accion)
		values(@bit_soc_user_socio_usuario,'UPDATE')	
	END
GO

-- =============================================
-- Author:		<Andrés>
-- Create date: <2022/11/10>
-- Description:	<trigger que registra el eliminado de registros que se realizan en la tabla tbl_socio_usuario>
-- =============================================
USE VIDEOTEC
GO
create TRIGGER tr_delete_bitacora_soc_user
on tbl_socio_usuario
AFTER DELETE
AS
	BEGIN
		declare @bit_soc_user_socio_usuario int
		set @bit_soc_user_socio_usuario = (select soc_user_id_socio_usuario from deleted)

		insert into tbl_bitacora_socio_usuario(bit_soc_user_socio_usuario,bit_soc_user_accion)
		values(@bit_soc_user_socio_usuario,'DELETE')
	END
GO
