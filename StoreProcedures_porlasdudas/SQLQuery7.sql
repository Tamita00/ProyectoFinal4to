CREATE PROCEDURE sp_EliminaVacuna 
	@pIdVacuna int
AS
BEGIN
	DELETE FROM Vacuna WHERE IdVacuna = @pIdVacuna
END
GO
