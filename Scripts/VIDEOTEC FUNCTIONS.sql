USE VIDEOTEC
GO
create function fnt_edad (@nacimiento date) returns int
as
BEGIN

declare @hoy date = getdate(), @a�os int

set @a�os= (year(@hoy) - year(@nacimiento))

IF(month(@hoy) = month(@nacimiento))
BEGIN

	if (day(@hoy) < day(@nacimiento))
	begin
		set @a�os -= 1
	end

END
ELSE IF (month(@hoy) < month(@nacimiento))
begin
	set @a�os -= 1
end
 return @a�os

END



