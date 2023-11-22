CREATE PROCEDURE sp_EliminarNota
	@pIdNota int
AS
BEGIN

	delete from Nota where IdNota = @pIdNota

END
GO
