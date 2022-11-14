USE VIDEOTEC
GO
create view view_tbl_socio as
select soc_codigo_socio,
soc_cedula,
soc_nombre+' '+soc_apellido1+' '+soc_apellido2 as soc_nombre_completo,
soc_correo,
soc_telefono,
soc_codigo_postal,
soc_direccion_exacta,
soc_genero,
dbo.fnt_edad(soc_fecha_nacimiento) as soc_edad,
soc_foto_perfil 
from tbl_socio
with check option
go

select * from view_tbl_socio

