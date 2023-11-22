CREATE PROCEDURE [dbo].[sp_CreaVacuna]
    @pTipo varchar(50),
	@pFechaDosis1 date,
	@pFechaCaducidad1 date
AS
BEGIN
	INSERT INTO Vacuna(Tipo, FechaDosis, FechaCaducidad)
	VALUES (@pTipo, @pFechaDosis1, @pFechaCaducidad1)
END
