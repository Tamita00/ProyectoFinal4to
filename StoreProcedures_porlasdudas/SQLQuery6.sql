ALTER PROCEDURE [dbo].[sp_CreaVacuna]
    @pTipo varchar(50),
	@pfecha1 date,
	@pfecha10 date
AS
BEGIN
	INSERT INTO Vacuna(Tipo, FechaDosis, FechaCaducidad)
	VALUES (@pTipo, @pfecha1, @pfecha10)
END
