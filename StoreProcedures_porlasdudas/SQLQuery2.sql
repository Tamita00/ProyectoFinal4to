CREATE PROCEDURE sp_MostrarMascota
	@pIdMascota int
AS
BEGIN
	select * FROM Mascota WHERE IdMascota = @pIdMascota
END
GO
