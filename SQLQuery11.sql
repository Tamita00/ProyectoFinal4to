USE [MiMascota]
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearVacuna]    Script Date: 22/11/2023 15:38:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_CrearVacuna]
    @pTipo varchar(50),
	@pFechaDosis1 date,
	@pFechaCaducidad1 date
AS
BEGIN
	INSERT INTO Vacuna(Tipo, FechaDosis, FechaCaducidad)
	VALUES (@pTipo, @pFechaDosis1, @pFechaCaducidad1)
END
