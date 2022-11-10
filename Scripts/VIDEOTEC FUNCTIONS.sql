USE VIDEOTEC
GO
create function fnt_edad (@nacimiento date) returns int
as
BEGIN

declare @hoy date = getdate(), @años int

set @años= (year(@hoy) - year(@nacimiento))

IF(month(@hoy) = month(@nacimiento))
BEGIN

	if (day(@hoy) < day(@nacimiento))
	begin
		set @años -= 1
	end

END
ELSE IF (month(@hoy) < month(@nacimiento))
begin
	set @años -= 1
end
 return @años

END



