
alter PROCEDURE [dbo].[sp_MostrarDatosPersonales]
    @pIdMascota int
AS
BEGIN
	SELECT * FROM Mascota
	INNER JOIN Dueno ON Mascota.IdDueno = Dueno.IdDueno
	WHERE Mascota.IdMascota = @pIdMascota
END
