CREATE PROCEDURE sp_EliminarAntecedente
	@pIdAntecedente int
AS
BEGIN
	DELETE FROM Antecedente WHERE IdAntecedente = @pIdAntecedente
END
GO
